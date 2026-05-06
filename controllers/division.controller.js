const { connection } = require('../config/database');

const GetAllDivisions = (req, res) => {
    const query = 'SELECT * FROM division WHERE activo_division = 1';
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener las divisiones' });
        }
        res.status(200).json(results);
    });
};

const GetDivisionById = (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM division WHERE id_division = ? AND activo_division = 1';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener la división' });
        }
        if (results.length === 0) {
            return res.status(404).json({ error: 'División no encontrada' });
        }
        res.status(200).json(results[0]);
    });
};
const CreateDivision = async (req, res) => {
    const { nombre_division, masculino, femenino, cloned_from_id } = req.body;
    if (!nombre_division) {
        return res.status(400).json({ error: 'nombre_division es requerido' });
    }

    try {
        const promisePool = connection.promise();
        const conn = await promisePool.getConnection();
        await conn.beginTransaction();

        try {
            // 1. Crear división
            const queryDiv = 'INSERT INTO division (Nombre_division, masculino, femenino) VALUES (?, ?, ?)';
            const [divResults] = await conn.query(queryDiv, [nombre_division, masculino, femenino]);
            const newDivId = divResults.insertId;

            // 2. Clonar datos si aplica
            if (cloned_from_id) {
                // Clonar equipos
                const [equipos] = await conn.query('SELECT * FROM equipo WHERE id_division = ? AND activo_equipo = 1', [cloned_from_id]);
                
                for (const equipo of equipos) {
                    const qEq = 'INSERT INTO equipo (nombre_equipo, logo, id_division) VALUES (?, ?, ?)';
                    const [eqRes] = await conn.query(qEq, [equipo.nombre_equipo, equipo.logo, newDivId]);
                    const newEqId = eqRes.insertId;

                    // Crear clasificación inicial en 0
                    const tClas = `
                        INSERT INTO clasificacion 
                        (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, 
                        partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) 
                        VALUES (?, ?, 0, 0, 0, 0, 0, 0, 0, 0)
                    `;
                    await conn.query(tClas, [newEqId, newDivId]);

                    // Clonar jugadores del equipo
                    const [jugadores] = await conn.query('SELECT * FROM jugador WHERE id_equipo = ? AND activo_jugador = 1', [equipo.id_equipo]);
                    if (jugadores.length > 0) {
                        const jugValues = jugadores.map(j => [j.jugador_nombre, j.DNI_jugador, j.fecha_nac, 0, 0, 0, newEqId]);
                        await conn.query('INSERT INTO jugador (jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo) VALUES ?', [jugValues]);
                    }

                    // Clonar cuerpo técnico del equipo
                    const [cuerpo] = await conn.query('SELECT * FROM cuerpo_tecnico WHERE id_equipo = ? AND activo_cuerpo_tecnico = 1', [equipo.id_equipo]);
                    if (cuerpo.length > 0) {
                        const ctValues = cuerpo.map(c => [c.cuerpo_tecnico_nombre, c.DNI_cuerpo_tecnico, 0, 0, newEqId]);
                        await conn.query('INSERT INTO cuerpo_tecnico (cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo) VALUES ?', [ctValues]);
                    }
                }
            }

            await conn.commit();
            conn.release();
            res.status(201).json({ id_division: newDivId, nombre_division, masculino, femenino });
        } catch (txnError) {
            await conn.rollback();
            conn.release();
            console.error('CreateDivision Txn Error:', txnError);
            res.status(500).json({ error: 'Error al crear la división', details: txnError.message });
        }
    } catch (dbError) {
        console.error('CreateDivision DB Connection Error:', dbError);
        return res.status(500).json({ error: 'Error de base de datos' });
    }
};

const UpdateDivision = (req, res) => {
    const { id } = req.params;
    const { nombre_division, masculino, femenino, terminado } = req.body;
    const isTerminado = terminado ? 1 : 0;
    const query = 'UPDATE division SET Nombre_division = ?, masculino = ?, femenino = ?, terminado = ? WHERE id_division = ?';
    connection.query(query, [nombre_division, masculino, femenino, isTerminado, id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al actualizar la división' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'División no encontrada' });
        }
        res.status(200).json({ id_division: id, nombre_division, masculino, femenino, terminado: isTerminado });
    });
};
const deleteDivision = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE division SET activo_division = 0 WHERE id_division = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al eliminar la división' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'División no encontrada' });
        }
        res.status(200).json({ message: 'División eliminada correctamente' });
    });
};


// FinalizarDivision: marca la división como terminada, toma el goleador automáticamente
// y guarda el campeón elegido en el historial_torneo
const FinalizarDivision = (req, res) => {
    const { id } = req.params;
    const { id_equipo_campeon } = req.body;

    if (!id_equipo_campeon) {
        return res.status(400).json({ error: 'id_equipo_campeon es requerido' });
    }

    connection.getConnection((err, conn) => {
        if (err) return res.status(500).json({ error: 'Error al obtener conexión' });

        conn.beginTransaction(txErr => {
            if (txErr) {
                conn.release();
                return res.status(500).json({ error: 'Error al iniciar la transacción' });
            }

            // 1) Obtener datos del equipo campeón
            conn.query(
                'SELECT * FROM equipo WHERE id_equipo = ? AND activo_equipo = 1',
                [id_equipo_campeon],
                (err1, equipos) => {
                    if (err1 || equipos.length === 0) {
                        return conn.rollback(() => {
                            conn.release();
                            res.status(404).json({ error: 'Equipo campeón no encontrado' });
                        });
                    }
                    const campeon = equipos[0];

                    // 2) Obtener el goleador de la división
                    const qGoleador = `
                        SELECT j.id_jugador, j.jugador_nombre, j.goles, e.nombre_equipo
                        FROM jugador j
                        JOIN equipo e ON j.id_equipo = e.id_equipo
                        WHERE e.id_division = ? AND j.activo_jugador = 1
                        ORDER BY j.goles DESC
                        LIMIT 1
                    `;
                    conn.query(qGoleador, [id], (err2, goleadores) => {
                        if (err2) {
                            return conn.rollback(() => {
                                conn.release();
                                res.status(500).json({ error: 'Error al obtener goleador', details: err2.message });
                            });
                        }
                        const goleador = goleadores[0] || null;

                        // 3) Insertar en historial_torneo
                        const qInsert = `
                            INSERT INTO historial_torneo
                            (id_division, anio, id_equipo_campeon, nombre_campeon, logo_campeon,
                             id_jugador_goleador, nombre_goleador, goles_goleador, nombre_equipo_goleador)
                            VALUES (?, YEAR(CURDATE()), ?, ?, ?, ?, ?, ?, ?)
                        `;
                        const valuesInsert = [
                            id,
                            campeon.id_equipo,
                            campeon.nombre_equipo,
                            campeon.logo || null,
                            goleador ? goleador.id_jugador : null,
                            goleador ? goleador.jugador_nombre : 'Sin goleador',
                            goleador ? goleador.goles : 0,
                            goleador ? goleador.nombre_equipo : '-'
                        ];

                        conn.query(qInsert, valuesInsert, (err3) => {
                            if (err3) {
                                return conn.rollback(() => {
                                    conn.release();
                                    res.status(500).json({ error: 'Error al guardar historial', details: err3.message });
                                });
                            }

                            // 4) Marcar división como terminada
                            conn.query(
                                'UPDATE division SET terminado = 1 WHERE id_division = ?',
                                [id],
                                (err4) => {
                                    if (err4) {
                                        return conn.rollback(() => {
                                            conn.release();
                                            res.status(500).json({ error: 'Error al marcar división como terminada', details: err4.message });
                                        });
                                    }

                                    conn.commit(commitErr => {
                                        if (commitErr) {
                                            return conn.rollback(() => {
                                                conn.release();
                                                res.status(500).json({ error: 'Error al confirmar la operación' });
                                            });
                                        }
                                        conn.release();
                                        res.status(200).json({ message: 'Torneo finalizado correctamente' });
                                    });
                                }
                            );
                        });
                    });
                }
            );
        });
    });
};


module.exports = {
    GetAllDivisions,
    GetDivisionById,
    CreateDivision,
    UpdateDivision,
    deleteDivision,
    FinalizarDivision
};