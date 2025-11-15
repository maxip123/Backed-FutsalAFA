const {connection} = require('../config/database');

const GetAllSedes = (req, res) => {
    const query = 'SELECT * FROM sede WHERE activo_sede = 1';
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error en la consulta de sedes'});
        }
        res.status(200).json(results);
    });
};

const GetSedeById = (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM sede WHERE id_sede = ? AND activo_sede = 1';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error en la consulta de sede'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Sede no encontrada'});
        }
        res.status(200).json(results[0]);
    });
};

const CreateSede = (req, res) => {
    const { nombre, direccion, google_maps } = req.body;
    const query = 'INSERT INTO sede (nombre_sede, direccion, google_maps) VALUES (?, ?, ?)';
    connection.query(query, [nombre, direccion, google_maps], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error en la creación de la sede'});
        }
        res.status(201).json({id_sede: results.insertId, nombre_sede: nombre, direccion, google_maps});
    });
};

const UpdateSede = (req, res) => {
    const { id } = req.params;
    const { nombre, direccion, google_maps } = req.body;
    const query = 'UPDATE sede SET nombre_sede = ?, direccion = ?, google_maps = ? WHERE id_sede = ?';
    connection.query(query, [nombre, direccion, google_maps, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error en la actualización de la sede'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Sede no encontrada'});
        }
        res.status(200).json({id_sede: id, nombre_sede: nombre, direccion, google_maps});
    });
};

const deleteSede = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE sede SET activo_sede = 0 WHERE id_sede = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error en la eliminación de la sede'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Sede no encontrada'});
        }
        res.status(200).json({message: 'Sede eliminada correctamente'});
    });
};


module.exports = {
    GetAllSedes,
    GetSedeById,
    CreateSede,
    UpdateSede,
    deleteSede
};
