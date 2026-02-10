const {connection} = require('../config/database');
const {hashPassword} = require('../utils/hash.utils');

const GetAllUsuarios = (req, res) => {
    const query = 'SELECT * FROM usuario WHERE activo_usuario = 1';
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener los usuarios'});
        }
        res.status(200).json(results);
    }
    );
};

const GetUsuarioById = (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM usuario WHERE id_usuario = ? AND activo_usuario = 1';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al obtener el usuario'});
        }
        if (results.length === 0) {
            return res.status(404).json({error: 'Usuario no encontrado'});
        }
        res.status(200).json(results[0]);
    });
}

const CreateUsuario = (req, res) => {
    const { usuario_nombre, usuario_mail, usuario_contrasena, administrador } = req.body;

    if (!usuario_nombre || !usuario_mail || !usuario_contrasena) {
        return res.status(400).json({ error: 'usuario_nombre, usuario_mail y usuario_contrasena son requeridos' });
    }

    // Normalizar campo administrador a 0/1
    const isAdmin = administrador ? 1 : 0;

    // Hashear contraseña antes de la transacción
    hashPassword(usuario_contrasena).then((hashedPassword) => {
        // Iniciar transacción con el mismo patrón usado en CreateEquipo
        connection.beginTransaction((err) => {
            if (err) {
                console.error('Error al iniciar transacción:', err);
                return res.status(500).json({ error: 'Error al iniciar transacción' });
            }

            // 1) Comprobar existencia
            const qCheck = 'SELECT id_usuario FROM usuario WHERE usuario_mail = ? AND activo_usuario = 1';
            connection.query(qCheck, [usuario_mail], (errCheck, resultsCheck) => {
                if (errCheck) {
                    return connection.rollback(() => {
                        console.error('Error en query comprobación usuario:', errCheck);
                        res.status(500).json({ error: 'Error al crear el usuario', details: errCheck.message });
                    });
                }

                if (resultsCheck.length > 0) {
                    return connection.rollback(() => {
                        return res.status(400).json({ error: 'El correo electrónico ya está registrado' });
                    });
                }

                // 2) Insertar usuario
                const qInsert = 'INSERT INTO usuario (usuario_nombre, usuario_mail, usuario_contrasena, administrador) VALUES (?, ?, ?, ?)';
                connection.query(qInsert, [usuario_nombre, usuario_mail, hashedPassword, isAdmin], (errInsert, resultsInsert) => {
                    if (errInsert) {
                        return connection.rollback(() => {
                            console.error('Error al insertar usuario:', errInsert);
                            res.status(500).json({ error: 'Error al crear el usuario', details: errInsert.message });
                        });
                    }

                    // 3) Commit
                    connection.commit((errCommit) => {
                        if (errCommit) {
                            return connection.rollback(() => {
                                console.error('Error al confirmar transacción:', errCommit);
                                res.status(500).json({ error: 'Error al confirmar la creación' });
                            });
                        }

                        res.status(201).json({ id: resultsInsert.insertId, usuario_nombre, usuario_mail, administrador: !!isAdmin });
                    });
                });
            });
        });
    }).catch((hashErr) => {
        console.error('Error al hashear contraseña:', hashErr);
        res.status(500).json({ error: 'Error interno al procesar la contraseña' });
    });
};

const UpdateUsuario = async (req, res) => {
    try {
    const { id } = req.params;
    const { usuario_nombre, usuario_mail, usuario_contrasena, administrador } = req.body;
    const isAdmin = administrador ? 1 : 0;

        if (typeof usuario_contrasena !== 'undefined' && usuario_contrasena !== null) {
            const hashed = await hashPassword(usuario_contrasena);
            const query = 'UPDATE usuario SET usuario_nombre = ?, usuario_mail = ?, usuario_contrasena = ?, administrador = ? WHERE id_usuario = ?';
            connection.query(query, [usuario_nombre, usuario_mail, hashed, isAdmin, id], (error, results) => {
                if (error) {
                    console.error('UpdateUsuario DB error:', error);
                    return res.status(500).json({error: 'Error al actualizar el usuario', details: error.message});
                }
                if (results.affectedRows === 0) {
                    return res.status(404).json({error: 'Usuario no encontrado'});
                }
                return res.status(200).json({id, usuario_nombre, usuario_mail, administrador: !!isAdmin});
            });
        } else {
            // No actualizar contraseña
            const query = 'UPDATE usuario SET usuario_nombre = ?, usuario_mail = ?, administrador = ? WHERE id_usuario = ?';
            connection.query(query, [usuario_nombre, usuario_mail, isAdmin, id], (error, results) => {
                if (error) {
                    console.error('UpdateUsuario DB error:', error);
                    return res.status(500).json({error: 'Error al actualizar el usuario', details: error.message});
                }
                if (results.affectedRows === 0) {
                    return res.status(404).json({error: 'Usuario no encontrado'});
                }
                return res.status(200).json({id, usuario_nombre, usuario_mail, administrador: !!isAdmin});
            });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Error interno al procesar la contraseña' });
    }
}

const deleteUsuario = (req, res) => {
    const { id } = req.params;
    const query = 'UPDATE usuario SET activo_usuario = 0 WHERE id_usuario = ?';
    connection.query(query, [id], (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error al eliminar el usuario'});
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({error: 'Usuario no encontrado'});
        }
        res.status(204).send();
    });
}

module.exports = {
    GetAllUsuarios,
    GetUsuarioById,
    CreateUsuario,
    UpdateUsuario,
    deleteUsuario
};