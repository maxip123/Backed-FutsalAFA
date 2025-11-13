const {connection} = require('../config/database');

const GetAllEquipos = (req, res) => {
    const query = `
        SELECT e.*, d.Nombre_division AS nombre_division
        FROM equipo AS e
        INNER JOIN division AS d ON d.id_division = e.id_division
        WHERE e.activo_equipo = 1 AND d.activo_division = 1
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
        INNER JOIN division AS d ON d.id_division = e.id_division
        WHERE e.id_equipo = ? AND e.activo_equipo = 1 AND d.activo_division = 1
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
    
    // Iniciar transacción para asegurar atomicidad
    connection.beginTransaction((err) => {
        if (err) {
            return res.status(500).json({error: 'Error al iniciar transacción'});
        }
        
        // 1. Crear el equipo
        const queryEquipo = 'INSERT INTO equipo (nombre_equipo, logo, id_division) VALUES (?, ?, ?)';
        
        connection.query(queryEquipo, [nombre_equipo, logo, id_division], (errorEquipo, resultsEquipo) => {
            if (errorEquipo) {
                return connection.rollback(() => {
                    console.error('Error al crear equipo:', errorEquipo);
                    res.status(500).json({error: 'Error al crear el equipo', details: errorEquipo.message});
                });
            }
            
            const id_equipo = resultsEquipo.insertId;
            
            // 2. Crear automáticamente la clasificación con valores en 0
            const queryClasificacion = `
                INSERT INTO clasificacion 
                (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, 
                 partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) 
                VALUES (?, ?, 0, 0, 0, 0, 0, 0, 0, 0)
            `;
            
            connection.query(queryClasificacion, [id_equipo, id_division], (errorClas, resultsClas) => {
                if (errorClas) {
                    return connection.rollback(() => {
                        console.error('Error al crear clasificación automática:', errorClas);
                        res.status(500).json({error: 'Error al crear clasificación del equipo', details: errorClas.message});
                    });
                }
                
                // 3. Confirmar transacción
                connection.commit((errorCommit) => {
                    if (errorCommit) {
                        return connection.rollback(() => {
                            console.error('Error al confirmar transacción:', errorCommit);
                            res.status(500).json({error: 'Error al confirmar la creación'});
                        });
                    }
                    
                    // 4. Devolver el equipo creado exitosamente
                    res.status(201).json({
                        id_equipo: id_equipo, 
                        nombre_equipo, 
                        logo, 
                        id_division,
                        mensaje: 'Equipo y clasificación creados exitosamente'
                    });
                });
            });
        });
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