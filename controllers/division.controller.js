const {connection} = require('../config/database');

const GetAllDivisions = (req, res) => {
    const query = 'SELECT * FROM division WHERE activo_division = 1';
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener las divisiones'});
        }
        res.status(200).json(results);
    });
};

const GetDivisionById = (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM division WHERE id_division = ? AND activo_division = 1';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener la división'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'División no encontrada'});
        }
        res.status(200).json(results[0]);
    });
};
const CreateDivision = (req, res) => {
    const { nombre_division, masculino, femenino } = req.body;
    const query = 'INSERT INTO division (Nombre_division, masculino, femenino) VALUES (?, ?, ?)';
    connection.query(query, [nombre_division, masculino, femenino], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al crear la división'});
        }
        res.status(201).json({id_division: results.insertId, nombre_division, masculino, femenino});
    });
};

const UpdateDivision = (req, res) => {
    const { id } = req.params;
    const { nombre_division, masculino, femenino } = req.body;
    const query = 'UPDATE division SET Nombre_division = ?, masculino = ?, femenino = ? WHERE id_division = ?';
    connection.query(query, [nombre_division, masculino, femenino, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al actualizar la división'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'División no encontrada'});
        }
        res.status(200).json({id_division: id, nombre_division, masculino, femenino});
    });
};
const deleteDivision = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE division SET activo_division = 0 WHERE id_division = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar la división'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'División no encontrada'});
        }
        res.status(200).json({message: 'División eliminada correctamente'});
    });
};

module.exports = {
    GetAllDivisions,
    GetDivisionById,
    CreateDivision,
    UpdateDivision,
    deleteDivision
};