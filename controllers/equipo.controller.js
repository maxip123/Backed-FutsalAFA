const { connection } = require('../config/database');

const GetAllEquipos = (req, res) => {
    const query = `
        SELECT e.*, d.Nombre_division AS nombre_division
        FROM equipo AS e
        INNER JOIN division AS d ON d.id_division = e.id_division
        WHERE e.activo_equipo = 1 AND d.activo_division = 1
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener los equipos' });
        }
        res.status(200).json(results);
    }
    );
}

const GetEquipoById = (req, res) => {
    const { id } = req.params;
    const query = `
        SELECT e.*, d.Nombre_division AS nombre_division
        FROM equipo AS e
        INNER JOIN division AS d ON d.id_division = e.id_division
        WHERE e.id_equipo = ? AND e.activo_equipo = 1 AND d.activo_division = 1
    `;
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener el equipo' });
        }
        if (results.length === 0) {
            return res.status(404).json({ error: 'Equipo no encontrado' });
        }
        res.status(200).json(results[0]);
    });
}

const CreateEquipo = (req, res) => {
    const { nombre_equipo, logo, id_division } = req.body;

    if (!nombre_equipo || !id_division) {
        return res.status(400).json({ error: 'nombre_equipo e id_division son requeridos' });
    }

    // Iniciar transacción para asegurar atomicidad
    connection.getConnection((err, conn) => {
        if (err) return res.status(500).json({ error: 'Error al obtener conexión' });

        conn.beginTransaction((err) => {
            if (err) {
                conn.release();
                return res.status(500).json({ error: 'Error al iniciar transacción' });
            }

            // 1. Crear el equipo
            const queryEquipo = 'INSERT INTO equipo (nombre_equipo, logo, id_division) VALUES (?, ?, ?)';

            conn.query(queryEquipo, [nombre_equipo, logo, id_division], (errorEquipo, resultsEquipo) => {
                if (errorEquipo) {
                    return conn.rollback(() => {
                        conn.release();
                        console.error('Error al crear equipo:', errorEquipo);
                        res.status(500).json({ error: 'Error al crear el equipo', details: errorEquipo.message });
                    });
                }

                const id_equipo = resultsEquipo.insertId;

                // 2. Crear automáticamente la clasificación con valores en 0
                const queryClasificacion = `
                    INSERT INTO clasificacion 
                    (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, 
                     partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) 
                    VALUES (?, ?, 0, 0, 0, 0, 0, 0, 0, 0)
                `;

                conn.query(queryClasificacion, [id_equipo, id_division], (errorClas, resultsClas) => {
                    if (errorClas) {
                        return conn.rollback(() => {
                            conn.release();
                            console.error('Error al crear clasificación automática:', errorClas);
                            res.status(500).json({ error: 'Error al crear clasificación del equipo', details: errorClas.message });
                        });
                    }

                    // 3. Confirmar transacción
                    conn.commit((errorCommit) => {
                        if (errorCommit) {
                            return conn.rollback(() => {
                                conn.release();
                                console.error('Error al confirmar transacción:', errorCommit);
                                res.status(500).json({ error: 'Error al confirmar la creación' });
                            });
                        }

                        conn.release();
                        // 4. Devolver el equipo creado exitosamente
                        res.status(201).json({
                            id_equipo: id_equipo,
                            nombre_equipo,
                            logo,
                            id_division,
                            mensaje: 'Equipo y clasificación creados exitosamente'
                        });
                    });
                });
            });
        });
    });
}

const UpdateEquipo = (req, res) => {
    const { id } = req.params;
    const { nombre_equipo, logo, id_division } = req.body;
    const query = 'UPDATE equipo SET nombre_equipo = ?, logo = ?, id_division = ? WHERE id_equipo = ?';
    connection.query(query, [nombre_equipo, logo, id_division, id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al actualizar el equipo' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'Equipo no encontrado' });
        }
        res.status(200).json({ id_equipo: id, nombre_equipo, logo, id_division });
    });
}

const deleteEquipo = (req, res) => {
    const { id } = req.params;

    // Usamos transacción para asegurarnos que la clasificación también se marque como inactiva
    connection.getConnection((err, conn) => {
        if (err) return res.status(500).json({ error: 'Error al obtener conexión' });

        conn.beginTransaction(err => {
            if (err) {
                conn.release();
                console.error('Error iniciando transacción:', err);
                return res.status(500).json({ error: 'Error al iniciar la operación' });
            }

            const q1 = 'UPDATE equipo SET activo_equipo = 0 WHERE id_equipo = ?';
            conn.query(q1, [id], (error, results) => {
                if (error) {
                    console.error('Error al actualizar equipo:', error);
                    return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al eliminar el equipo', details: error.message }); });
                }
                if (results.affectedRows === 0) {
                    return conn.rollback(() => { conn.release(); res.status(404).json({ error: 'Equipo no encontrado' }); });
                }

                // Marcar la clasificación relacionada como inactiva (soft delete)
                const q2 = 'UPDATE clasificacion SET activo_clasificacion = 0 WHERE id_equipo = ?';
                conn.query(q2, [id], (error2) => {
                    if (error2) {
                        console.error('Error al actualizar clasificación:', error2);
                        return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al actualizar clasificación', details: error2.message }); });
                    }

                    conn.commit(commitErr => {
                        if (commitErr) {
                            console.error('Error al confirmar transacción:', commitErr);
                            return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al finalizar la operación', details: commitErr.message }); });
                        }
                        conn.release();
                        res.status(200).json({ message: 'Equipo y clasificación marcados como inactivos correctamente' });
                    });
                });
            });
        });
    });
}
module.exports = {
    GetAllEquipos,
    GetEquipoById,
    CreateEquipo,
    UpdateEquipo,
    deleteEquipo
};  