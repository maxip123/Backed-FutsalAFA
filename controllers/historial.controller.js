const { connection } = require('../config/database');

// Obtener todo el historial de torneos finalizados
const GetAllHistorial = (req, res) => {
    const query = `
        SELECT h.*, d.Nombre_division AS nombre_torneo
        FROM historial_torneo h
        LEFT JOIN division d ON h.id_division = d.id_division
        WHERE h.activo_historial = 1
        ORDER BY h.anio DESC, h.fecha_registro DESC
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener el historial de torneos' });
        }
        res.status(200).json(results);
    });
};

// Obtener historial de un torneo por id
const GetHistorialById = (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM historial_torneo WHERE id_historial = ? AND activo_historial = 1';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener el torneo' });
        }
        if (results.length === 0) {
            return res.status(404).json({ error: 'Torneo no encontrado' });
        }
        res.status(200).json(results[0]);
    });
};

// Crear historial manualmente (para casos de edición o corrección)
// Body: { id_division, anio, nombre_campeon, logo_campeon, nombre_subcampeon, nombre_goleador, goles_goleador, nombre_equipo_goleador }
const CreateHistorial = (req, res) => {
    const {
        id_division, anio,
        id_equipo_campeon, nombre_campeon, logo_campeon,
        id_equipo_subcampeon, nombre_subcampeon,
        id_jugador_goleador, nombre_goleador, goles_goleador, nombre_equipo_goleador
    } = req.body;

    if (!id_division || !anio || !nombre_campeon || !nombre_goleador || goles_goleador === undefined) {
        return res.status(400).json({ error: 'Faltan campos obligatorios' });
    }

    const query = `
        INSERT INTO historial_torneo
        (id_division, anio, id_equipo_campeon, nombre_campeon, logo_campeon,
         id_equipo_subcampeon, nombre_subcampeon, id_jugador_goleador, nombre_goleador, goles_goleador, nombre_equipo_goleador)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    connection.query(query, [
        id_division, anio,
        id_equipo_campeon || null, nombre_campeon, logo_campeon || null,
        id_equipo_subcampeon || null, nombre_subcampeon || null,
        id_jugador_goleador || null, nombre_goleador, goles_goleador, nombre_equipo_goleador
    ], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al crear el historial', details: error.message });
        }
        res.status(201).json({ id_historial: results.insertId, message: 'Historial creado correctamente' });
    });
};

// Eliminar historial (soft delete)
const DeleteHistorial = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE historial_torneo SET activo_historial = 0 WHERE id_historial = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al eliminar el historial' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'Historial no encontrado' });
        }
        res.status(200).json({ message: 'Historial eliminado correctamente' });
    });
};

module.exports = {
    GetAllHistorial,
    GetHistorialById,
    CreateHistorial,
    DeleteHistorial
};
