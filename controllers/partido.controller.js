const {connection} = require('../config/database');

const GetAllPartidos = (req, res) => {
    const query = `
        SELECT p.*, 
               s.nombre_sede, 
               el.nombre_equipo AS equipo_local, 
               ev.nombre_equipo AS equipo_visitante,
               d.Nombre_division AS nombre_division
        FROM partido AS p
        LEFT JOIN sede AS s ON s.id_sede = p.id_sede
        LEFT JOIN equipo AS el ON el.id_equipo = p.id_equipo_local
        LEFT JOIN equipo AS ev ON ev.id_equipo = p.id_equipo_visitante
        LEFT JOIN division AS d ON d.id_division = p.id_division
        WHERE p.activo_partido = 1 
          AND (s.activo_sede = 1 OR s.id_sede IS NULL)
          AND (el.activo_equipo = 1 OR el.id_equipo IS NULL)
          AND (ev.activo_equipo = 1 OR ev.id_equipo IS NULL)
          AND (d.activo_division = 1 OR d.id_division IS NULL)
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener los partidos'});
        }
        res.status(200).json(results);
    });
};

const GetPartidoById = (req, res) => {
    const { id } = req.params;
    const query = `
        SELECT p.*, 
               s.nombre_sede, 
               el.nombre_equipo AS equipo_local, 
               ev.nombre_equipo AS equipo_visitante,
               d.Nombre_division AS nombre_division
        FROM partido AS p
        LEFT JOIN sede AS s ON s.id_sede = p.id_sede
        LEFT JOIN equipo AS el ON el.id_equipo = p.id_equipo_local
        LEFT JOIN equipo AS ev ON ev.id_equipo = p.id_equipo_visitante
        LEFT JOIN division AS d ON d.id_division = p.id_division
        WHERE p.id_partido = ? AND p.activo_partido = 1
          AND (s.activo_sede = 1 OR s.id_sede IS NULL)
          AND (el.activo_equipo = 1 OR el.id_equipo IS NULL)
          AND (ev.activo_equipo = 1 OR ev.id_equipo IS NULL)
          AND (d.activo_division = 1 OR d.id_division IS NULL)
    `;
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener el partido'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Partido no encontrado'});
        }
        res.status(200).json(results[0]);
    });
};

const CreatePartido = (req, res) => {
    const { fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, cancelado } = req.body;
    const query = 'INSERT INTO partido (fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, cancelado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    connection.query(query, [fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local || 0, goles_visitante || 0, id_division, cancelado || 0], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al crear el partido'});
        }
        res.status(201).json({
            id_partido: results.insertId, 
            fecha_partido, 
            id_sede, 
            id_equipo_local, 
            id_equipo_visitante, 
            goles_local: goles_local || 0, 
            goles_visitante: goles_visitante || 0, 
            id_division, 
            cancelado: cancelado || 0
        });
    });
};

const UpdatePartido = (req, res) => {
    const { id } = req.params;
    const { fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, cancelado } = req.body;
    const query = 'UPDATE partido SET fecha_partido = ?, id_sede = ?, id_equipo_local = ?, id_equipo_visitante = ?, goles_local = ?, goles_visitante = ?, id_division = ?, cancelado = ? WHERE id_partido = ?';
    connection.query(query, [fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, cancelado, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al actualizar el partido'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Partido no encontrado'});
        }
        res.status(200).json({
            id_partido: id, 
            fecha_partido, 
            id_sede, 
            id_equipo_local, 
            id_equipo_visitante, 
            goles_local, 
            goles_visitante, 
            id_division, 
            cancelado
        });
    });
};

const deletePartido = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE partido SET activo_partido = 0 WHERE id_partido = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar el partido'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Partido no encontrado'});
        }
        res.status(200).json({message: 'Partido eliminado correctamente'});
    });
};

module.exports = {
    GetAllPartidos,
    GetPartidoById,
    CreatePartido,
    UpdatePartido,
    deletePartido
};
