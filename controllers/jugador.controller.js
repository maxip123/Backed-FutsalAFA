const {connection} = require('../config/database');

const GetAllJugadores = (req, res) => {
    const query = `
        SELECT j.*, e.nombre_equipo AS nombre_equipo
        FROM jugador AS j
        LEFT JOIN equipo AS e ON e.id_equipo = j.id_equipo
        WHERE j.activo_jugador = 1 AND (e.activo_equipo = 1 OR e.id_equipo IS NULL)
    `;
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener los jugadores'});
        }
        res.status(200).json(results);
    });
}
const GetJugadorById = (req, res) => {
    const { id } = req.params;
    const query = `
        SELECT j.*, e.nombre_equipo AS nombre_equipo
        FROM jugador AS j
        LEFT JOIN equipo AS e ON e.id_equipo = j.id_equipo
        WHERE j.id_jugador = ? AND j.activo_jugador = 1 AND (e.activo_equipo = 1 OR e.id_equipo IS NULL)
    `;
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener el jugador'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Jugador no encontrado'});
        }
        res.status(200).json(results[0]);
    });
}

const CreateJugador = (req, res) => {
    const { nombre_jugador, dni_jugador, fecha_nacimiento, id_equipo } = req.body;
    const query = 'INSERT INTO jugador (jugador_nombre, DNI_jugador, fecha_nac, id_equipo) VALUES (?, ?, ?, ?)';
    connection.query(query, [nombre_jugador, dni_jugador, fecha_nacimiento, id_equipo], (error, results) => { 
        if (error) {
            return res.status(500).json({error: 'Error al crear el jugador'});
        }
        res.status(201).json({id_jugador: results.insertId, nombre_jugador, dni_jugador, fecha_nacimiento, id_equipo});
    });
}

const UpdateJugador = (req, res) => {
    const { id } = req.params;
    const { nombre_jugador, dni_jugador, fecha_nacimiento, id_equipo } = req.body;
    const query = 'UPDATE jugador SET jugador_nombre = ?, DNI_jugador = ?, fecha_nac = ?, id_equipo = ? WHERE id_jugador = ?';
    connection.query(query, [nombre_jugador, dni_jugador, fecha_nacimiento, id_equipo, id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al actualizar el jugador'});
        }   
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Jugador no encontrado'});
        }
        res.status(200).json({id_jugador: id, nombre_jugador, dni_jugador, fecha_nacimiento, id_equipo});
    });
}

const deleteJugador = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE jugador SET activo_jugador = 0 WHERE id_jugador = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar el jugador'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Jugador no encontrado'});
        }
        res.status(200).json({message: 'Jugador eliminado correctamente'});
    });
}

module.exports = {
    GetAllJugadores,
    GetJugadorById,
    CreateJugador,
    UpdateJugador,
    deleteJugador
};