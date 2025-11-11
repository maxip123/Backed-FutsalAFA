const {connection} = require('../config/database');

const GetAllEquipos = (req, res) => {
    const query = `
        SELECT e.*, d.Nombre_division AS nombre_division
        FROM equipo AS e
        LEFT JOIN division AS d ON d.id_division = e.id_division
        WHERE e.activo_equipo = 1 AND (d.activo_division = 1 OR d.id_division IS NULL)
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener los equipos'});
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
        LEFT JOIN division AS d ON d.id_division = e.id_division
        WHERE e.id_equipo = ? AND e.activo_equipo = 1 AND (d.activo_division = 1 OR d.id_division IS NULL)
    `;
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener el equipo'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Equipo no encontrado'});
        }
        res.status(200).json(results[0]);
    });
}

const CreateEquipo = (req, res) => {
    const { nombre_equipo, logo, id_division } = req.body;
    const query = 'INSERT INTO equipo (nombre_equipo, logo, id_division) VALUES (?, ?, ?)';
    connection.query(query, [nombre_equipo, logo, id_division], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al crear el equipo'});
        }
        res.status(201).json({id: results.insertId, nombre_equipo, logo, id_division});
    });
}

const UpdateEquipo = (req, res) => {
    const { id } = req.params;
    const { nombre_equipo, logo, id_division } = req.body;
    const query = 'UPDATE equipo SET nombre_equipo = ?, logo = ?, id_division = ? WHERE id_equipo = ?';
    connection.query(query, [nombre_equipo, logo, id_division, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al actualizar el equipo'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Equipo no encontrado'});
        }
        res.status(200).json({id_equipo: id, nombre_equipo, logo, id_division});
    });
}

const deleteEquipo = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE equipo SET activo_equipo = 0 WHERE id_equipo = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar el equipo'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Equipo no encontrado'});
        }
        res.status(200).json({message: 'Equipo eliminado correctamente'});
    });
}
module.exports = {
    GetAllEquipos,
    GetEquipoById,
    CreateEquipo,
    UpdateEquipo,
    deleteEquipo
};  