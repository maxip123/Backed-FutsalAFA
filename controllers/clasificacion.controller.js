const {connection} = require('../config/database');

const GetAllClasificaciones = (req, res) => {
    const query = `
        SELECT c.*, 
               e.nombre_equipo, 
               d.Nombre_division AS nombre_division
        FROM clasificacion AS c
        LEFT JOIN equipo AS e ON e.id_equipo = c.id_equipo
        LEFT JOIN division AS d ON d.id_division = c.id_division
        WHERE (e.activo_equipo = 1 OR e.id_equipo IS NULL)
          AND (d.activo_division = 1 OR d.id_division IS NULL)
        ORDER BY c.id_division, c.puntos DESC, c.diferencia_goles DESC
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener las clasificaciones'});
        }
        res.status(200).json(results);
    });
};

const GetClasificacionById = (req, res) => {
    const { id } = req.params;
    const query = `
        SELECT c.*, 
               e.nombre_equipo, 
               d.Nombre_division AS nombre_division
        FROM clasificacion AS c
        LEFT JOIN equipo AS e ON e.id_equipo = c.id_equipo
        LEFT JOIN division AS d ON d.id_division = c.id_division
        WHERE c.id_clasificacion = ?
          AND (e.activo_equipo = 1 OR e.id_equipo IS NULL)
          AND (d.activo_division = 1 OR d.id_division IS NULL)
    `;
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener la clasificación'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Clasificación no encontrada'});
        }
        res.status(200).json(results[0]);
    });
};

const GetClasificacionByDivision = (req, res) => {
    const { id_division } = req.params;
    const query = `
        SELECT c.*, 
               e.nombre_equipo, 
               d.Nombre_division AS nombre_division
        FROM clasificacion AS c
        LEFT JOIN equipo AS e ON e.id_equipo = c.id_equipo
        LEFT JOIN division AS d ON d.id_division = c.id_division
        WHERE c.id_division = ?
          AND (e.activo_equipo = 1 OR e.id_equipo IS NULL)
          AND (d.activo_division = 1 OR d.id_division IS NULL)
        ORDER BY c.puntos DESC, c.diferencia_goles DESC
    `;
    connection.query(query, [id_division], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener la clasificación por división'});
        }
        res.status(200).json(results);
    });
};

const CreateClasificacion = (req, res) => {
    const { id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles } = req.body;
    const query = 'INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    connection.query(query, [id_equipo, id_division, puntos || 0, partidos_jugados || 0, partidos_ganados || 0, partidos_empatados || 0, partidos_perdidos || 0, goles_a_favor || 0, goles_en_contra || 0, diferencia_goles || 0], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al crear la clasificación'});
        }
        res.status(201).json({
            id_clasificacion: results.insertId, 
            id_equipo, 
            id_division, 
            puntos: puntos || 0, 
            partidos_jugados: partidos_jugados || 0, 
            partidos_ganados: partidos_ganados || 0, 
            partidos_empatados: partidos_empatados || 0, 
            partidos_perdidos: partidos_perdidos || 0, 
            goles_a_favor: goles_a_favor || 0, 
            goles_en_contra: goles_en_contra || 0, 
            diferencia_goles: diferencia_goles || 0
        });
    });
};

const UpdateClasificacion = (req, res) => {
    const { id } = req.params;
    const { id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles } = req.body;
    const query = 'UPDATE clasificacion SET id_equipo = ?, id_division = ?, puntos = ?, partidos_jugados = ?, partidos_ganados = ?, partidos_empatados = ?, partidos_perdidos = ?, goles_a_favor = ?, goles_en_contra = ?, diferencia_goles = ? WHERE id_clasificacion = ?';
    connection.query(query, [id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al actualizar la clasificación'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Clasificación no encontrada'});
        }
        res.status(200).json({
            id_clasificacion: id, 
            id_equipo, 
            id_division, 
            puntos, 
            partidos_jugados, 
            partidos_ganados, 
            partidos_empatados, 
            partidos_perdidos, 
            goles_a_favor, 
            goles_en_contra, 
            diferencia_goles
        });
    });
};

const deleteClasificacion = (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM clasificacion WHERE id_clasificacion = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar la clasificación'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Clasificación no encontrada'});
        }
        res.status(200).json({message: 'Clasificación eliminada correctamente'});
    });
};

module.exports = {
    GetAllClasificaciones,
    GetClasificacionById,
    GetClasificacionByDivision,
    CreateClasificacion,
    UpdateClasificacion,
    deleteClasificacion
};
