const {connection} = require('../config/database');

const GetAllCuerpoTecnico = (req, res) => {
    const query = `
        SELECT ct.*, e.nombre_equipo AS nombre_equipo
        FROM cuerpo_tecnico AS ct
        LEFT JOIN equipo AS e ON e.id_equipo = ct.id_equipo
        WHERE ct.activo_cuerpo_tecnico = 1 AND (e.activo_equipo = 1 OR e.id_equipo IS NULL)
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener el cuerpo técnico'});
        }
        res.status(200).json(results);
    });
}

const GetCuerpoTecnicoById = (req, res) => {
    const { id } = req.params;
    const query = `
        SELECT ct.*, e.nombre_equipo AS nombre_equipo
        FROM cuerpo_tecnico AS ct
        LEFT JOIN equipo AS e ON e.id_equipo = ct.id_equipo
        WHERE ct.id_cuerpo_tecnico = ? AND ct.activo_cuerpo_tecnico = 1 AND (e.activo_equipo = 1 OR e.id_equipo IS NULL)
    `;
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener el cuerpo técnico'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Cuerpo técnico no encontrado'});
        }
        res.status(200).json(results[0]);
    });
}

const CreateCuerpoTecnico = (req, res) => {
    const { nombre_ct, apellido_ct, dni_ct, id_equipo } = req.body;
    const query = 'INSERT INTO cuerpo_tecnico (cuerpo_tecnico_nombre, cuerpo_tecnico_apellido, DNI_cuerpo_tecnico, id_equipo) VALUES (?, ?, ?, ?)';
    connection.query(query, [nombre_ct, apellido_ct, dni_ct, id_equipo], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al crear el cuerpo técnico'});
        }
        res.status(201).json({id_cuerpo_tecnico: results.insertId, nombre_ct, apellido_ct, dni_ct, id_equipo});
    });
};

const UpdateCuerpoTecnico = (req, res) => {
    const { id } = req.params;
    const { nombre_ct, apellido_ct, dni_ct, id_equipo } = req.body;
    const query = 'UPDATE cuerpo_tecnico SET cuerpo_tecnico_nombre = ?, cuerpo_tecnico_apellido = ?, DNI_cuerpo_tecnico = ?, id_equipo = ? WHERE id_cuerpo_tecnico = ?';
    connection.query(query, [nombre_ct, apellido_ct, dni_ct, id_equipo, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al actualizar el cuerpo técnico'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Cuerpo técnico no encontrado'});
        }
        res.status(200).json({id_cuerpo_tecnico: id, nombre_ct, apellido_ct, dni_ct, id_equipo});
    });
}

const deleteCuerpoTecnico = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE cuerpo_tecnico SET activo_cuerpo_tecnico = 0 WHERE id_cuerpo_tecnico = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar el cuerpo técnico'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Cuerpo técnico no encontrado'});
        }
        res.status(200).json({message: 'Cuerpo técnico eliminado correctamente'});
    });
};
module.exports = {
    GetAllCuerpoTecnico,
    GetCuerpoTecnicoById,
    CreateCuerpoTecnico,
    UpdateCuerpoTecnico,
    deleteCuerpoTecnico
};
