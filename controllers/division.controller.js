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
const CreateDivision = (req, res) => {
    const { nombre_division, masculino, femenino } = req.body;
    if (!nombre_division) {
        return res.status(400).json({ error: 'nombre_division es requerido' });
    }
    const query = 'INSERT INTO division (Nombre_division, masculino, femenino) VALUES (?, ?, ?)';
    connection.query(query, [nombre_division, masculino, femenino], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al crear la división' });
        }
        res.status(201).json({ id_division: results.insertId, nombre_division, masculino, femenino });
    });
};

const UpdateDivision = (req, res) => {
    const { id } = req.params;
    const { nombre_division, masculino, femenino } = req.body;
    const query = 'UPDATE division SET Nombre_division = ?, masculino = ?, femenino = ? WHERE id_division = ?';
    connection.query(query, [nombre_division, masculino, femenino, id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al actualizar la división' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'División no encontrada' });
        }
        res.status(200).json({ id_division: id, nombre_division, masculino, femenino });
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

// ResetDivision: pone en 0 todas las estadísticas de la clasificación
// y las estadísticas de jugadores y cuerpo técnico para una división
const ResetDivision = (req, res) => {
    const { id } = req.params; // id_division

    // Usamos transacción para que todos los cambios sean atómicos
    connection.getConnection((err, conn) => {
        if (err) return res.status(500).json({ error: 'Error al obtener conexión' });

        conn.beginTransaction(err => {
            if (err) {
                conn.release();
                console.error('Error iniciando transacción:', err);
                return res.status(500).json({ error: 'Error al iniciar la operación' });
            }

            // 1) Reset clasificacion for the division
            const q1 = `
                UPDATE clasificacion
                SET puntos = 0,
                    partidos_jugados = 0,
                    partidos_ganados = 0,
                    partidos_empatados = 0,
                    partidos_perdidos = 0,
                    goles_a_favor = 0,
                    goles_en_contra = 0,
                    diferencia_goles = 0
                WHERE id_division = ?
            `;

            conn.query(q1, [id], (err1) => {
                if (err1) {
                    console.error('Error reseteando clasificacion:', err1);
                    return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al resetear clasificación', details: err1.message }); });
                }

                // 2) Reset jugadores (goles y tarjetas) for teams in the division
                const q2 = `
                    UPDATE jugador j
                    INNER JOIN equipo e ON j.id_equipo = e.id_equipo
                    SET j.goles = 0,
                        j.tarjetas_amarillas = 0,
                        j.tarjetas_rojas = 0
                    WHERE e.id_division = ?
                `;

                conn.query(q2, [id], (err2) => {
                    if (err2) {
                        console.error('Error reseteando jugadores:', err2);
                        return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al resetear jugadores', details: err2.message }); });
                    }

                    // 3) Reset cuerpo_tecnico tarjetas for teams in the division
                    const q3 = `
                        UPDATE cuerpo_tecnico ct
                        INNER JOIN equipo e ON ct.id_equipo = e.id_equipo
                        SET ct.tarjetas_amarillas = 0,
                            ct.tarjetas_rojas = 0
                        WHERE e.id_division = ?
                    `;

                    conn.query(q3, [id], (err3) => {
                        if (err3) {
                            console.error('Error reseteando cuerpo técnico:', err3);
                            return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al resetear cuerpo técnico', details: err3.message }); });
                        }

                        // Si todo OK, commit
                        conn.commit(commitErr => {
                            if (commitErr) {
                                console.error('Error al commitear transacción:', commitErr);
                                return conn.rollback(() => { conn.release(); res.status(500).json({ error: 'Error al finalizar la operación', details: commitErr.message }); });
                            }
                            conn.release();
                            res.status(200).json({ message: 'División reseteada correctamente' });
                        });
                    });
                });
            });
        });
    });
};

module.exports = {
    GetAllDivisions,
    GetDivisionById,
    CreateDivision,
    UpdateDivision,
    deleteDivision,
    ResetDivision
};