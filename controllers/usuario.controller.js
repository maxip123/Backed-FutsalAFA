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

const CreateUsuario = async (req, res) => {
    try {
        const { usuario_nombre, usuario_mail, usuario_contrasena } = req.body;
        const hashedPassword = usuario_contrasena ? await hashPassword(usuario_contrasena) : null;

        const query = 'INSERT INTO usuario (usuario_nombre, usuario_mail, usuario_contrasena) VALUES (?, ?, ?)';
        connection.query(query, [usuario_nombre, usuario_mail, hashedPassword], (error, results) => {
            if (error) {
                console.error('CreateUsuario DB error:', error);
                return res.status(500).json({error: 'Error al crear el usuario', details: error.message});
            }
            // No devolver la contraseña en la respuesta
            res.status(201).json({id: results.insertId, usuario_nombre, usuario_mail});
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Error interno al procesar la contraseña' });
    }
}

const UpdateUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const { usuario_nombre, usuario_mail, usuario_contrasena } = req.body;

        if (typeof usuario_contrasena !== 'undefined' && usuario_contrasena !== null) {
            const hashed = await hashPassword(usuario_contrasena);
            const query = 'UPDATE usuario SET usuario_nombre = ?, usuario_mail = ?, usuario_contrasena = ? WHERE id_usuario = ?';
            connection.query(query, [usuario_nombre, usuario_mail, hashed, id], (error, results) => {
                if (error) {
                    console.error('UpdateUsuario DB error:', error);
                    return res.status(500).json({error: 'Error al actualizar el usuario', details: error.message});
                }
                if (results.affectedRows === 0) {
                    return res.status(404).json({error: 'Usuario no encontrado'});
                }
                return res.status(200).json({id, usuario_nombre, usuario_mail});
            });
        } else {
            // No actualizar contraseña
            const query = 'UPDATE usuario SET usuario_nombre = ?, usuario_mail = ? WHERE id_usuario = ?';
            connection.query(query, [usuario_nombre, usuario_mail, id], (error, results) => {
                if (error) {
                    console.error('UpdateUsuario DB error:', error);
                    return res.status(500).json({error: 'Error al actualizar el usuario', details: error.message});
                }
                if (results.affectedRows === 0) {
                    return res.status(404).json({error: 'Usuario no encontrado'});
                }
                return res.status(200).json({id, usuario_nombre, usuario_mail});
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