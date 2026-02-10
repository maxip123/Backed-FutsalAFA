const {connection} = require('../config/database');

const GetAllJugadores = (req, res) => {
    const query = `
        SELECT j.*, e.nombre_equipo AS nombre_equipo
        FROM jugador AS j
        INNER JOIN equipo AS e ON e.id_equipo = j.id_equipo
        WHERE j.activo_jugador = 1 AND e.activo_equipo = 1
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
        INNER JOIN equipo AS e ON e.id_equipo = j.id_equipo
        WHERE j.id_jugador = ? AND j.activo_jugador = 1 AND e.activo_equipo = 1
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
    const { 
        nombre_jugador,
        dni_jugador,
        fecha_nacimiento,
        id_equipo,
        goles = 0,
        tarjetas_amarillas = 0,
        tarjetas_rojas = 0
    } = req.body;

    if (!nombre_jugador || !dni_jugador || !id_equipo) {
        return res.status(400).json({
            error: 'Faltan campos requeridos',
            details: 'Se requieren: nombre, DNI y equipo'
        });
    }

    const query = `
        INSERT INTO jugador 
        (jugador_nombre, DNI_jugador, fecha_nac, id_equipo, goles, tarjetas_amarillas, tarjetas_rojas) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;
    // formatear fecha a formato MySQL (YYYY-MM-DD) para evitar errores con ISO strings
    const formatToMySQLDate = (fecha) => {
        if (!fecha) return null;
        const d = new Date(fecha);
        if (isNaN(d)) return null;
        return d.toISOString().slice(0,10); // usa la parte de fecha en UTC
    }

    connection.query(
        query, 
        [nombre_jugador, dni_jugador, formatToMySQLDate(fecha_nacimiento) || null, id_equipo, goles, tarjetas_amarillas, tarjetas_rojas], 
        (error, results) => {
            if (error) {
                console.error('Error al crear jugador:', error);
                return res.status(500).json({
                    error: 'Error al crear el jugador',
                    details: error.message
                });
            }
            res.status(201).json({
                id_jugador: results.insertId,
                jugador_nombre: nombre_jugador,
                DNI_jugador: dni_jugador,
                fecha_nac: formatToMySQLDate(fecha_nacimiento) || null,
                id_equipo,
                goles,
                tarjetas_amarillas,
                tarjetas_rojas
            });
        }
    );
}

const UpdateJugador = (req, res) => {
    const { id } = req.params;
    
    const { 
        nombre_jugador,
        dni_jugador,
        fecha_nacimiento,
        id_equipo,
        goles,
        tarjetas_amarillas,
        tarjetas_rojas
    } = req.body;

    if (!nombre_jugador || !dni_jugador || !id_equipo) {
        return res.status(400).json({
            error: 'Faltan campos requeridos',
            details: 'Se requieren: nombre, DNI y equipo'
        });
    }

    const query = `
        UPDATE jugador 
        SET jugador_nombre = ?, 
            DNI_jugador = ?, 
            fecha_nac = ?,
            id_equipo = ?,
            goles = ?,
            tarjetas_amarillas = ?,
            tarjetas_rojas = ?
        WHERE id_jugador = ?
    `;
    // formatear fecha a YYYY-MM-DD antes de enviarla a MySQL
    const formatToMySQLDate = (fecha) => {
        if (!fecha) return null;
        const d = new Date(fecha);
        if (isNaN(d)) return null;
        return d.toISOString().slice(0,10);
    }

    connection.query(
        query, 
        [nombre_jugador, dni_jugador, formatToMySQLDate(fecha_nacimiento) || null, id_equipo, goles || 0, tarjetas_amarillas || 0, tarjetas_rojas || 0, id], 
        (error, results) => {
            if (error) {
                console.error('Error al actualizar jugador:', error);
                return res.status(500).json({
                    error: 'Error al actualizar el jugador',
                    details: error.message
                });
            }
            if (results.affectedRows === 0) {
                return res.status(404).json({error: 'Jugador no encontrado'});
            }
            res.status(200).json({
                id_jugador: id,
                jugador_nombre: nombre_jugador,
                DNI_jugador: dni_jugador,
                fecha_nac: fecha_nacimiento || null,
                id_equipo,
                goles: goles || 0,
                tarjetas_amarillas: tarjetas_amarillas || 0,
                tarjetas_rojas: tarjetas_rojas || 0
            });
        }
    );
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