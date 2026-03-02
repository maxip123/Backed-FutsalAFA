const jwt = require('jsonwebtoken');
const { connection } = require('../config/database');
const { recoverPasswordEmail } = require('../services/email.services');
const { hashPassword } = require('../utils/hash.utils');

const recoverPassword = async (req, res) => {
    const { usuario_mail } = req.body;
    // Validación mínima: asegurar que el email venga en el body
    if (!usuario_mail) {
        return res.status(400).json({ error: 'usuario_mail es requerido' });
    }
    try {
        // Tabla usada en el resto del proyecto es `usuario` (singular)
        // Usar la interfaz promise() de mysql2 para await
        const [rows] = await connection.promise().execute('SELECT * FROM usuario WHERE usuario_mail = ?', [usuario_mail]);
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        const user = rows[0];
        const token = jwt.sign({ id: user.id_usuario }, process.env.JWT_SECRET, { expiresIn: '1h' });
        // Pasamos sólo el token; el servicio construye el enlace con FRONTEND_URL
        await recoverPasswordEmail(usuario_mail, token);
        res.status(200).json({ message: 'Correo de recuperación enviado' });
    } catch (error) {
        console.error('Error en recoverPassword:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
}

const resetPassword = async (req, res) => {
    const { token, newPassword } = req.body;
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        const hashedPassword = await hashPassword(newPassword);
        const [result] = await connection.promise().execute('UPDATE usuario SET usuario_contrasena = ? WHERE id_usuario = ?', [hashedPassword, decoded.id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        res.status(200).json({ message: 'Contraseña actualizada correctamente' });
    } catch (error) {
        if (error.name === 'TokenExpiredError') {
            return res.status(401).json({ error: 'Token expirado' });
        }
        console.error('Error en resetPassword:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
}

module.exports = {
    recoverPassword,
    resetPassword
};