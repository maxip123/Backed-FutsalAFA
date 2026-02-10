const { connection } = require('../config/database');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
const { comparePasswords } = require('../utils/hash.utils');

dotenv.config();

const login = (req, res) => {
    const { usuario_mail, usuario_contrasena } = req.body;

    if (!usuario_mail || !usuario_contrasena) {
        return res.status(400).json({ error: 'usuario_mail y usuario_contrasena son requeridos' });
    }

    connection.query('SELECT * FROM usuario WHERE usuario_mail = ? AND activo_usuario = 1', [usuario_mail], async (err, results) => {
        if (err) {
            console.error('Login DB error:', err);
            return res.status(500).json({ error: 'Error interno del servidor', details: err.message });
        }


        if (!results || results.length === 0) {
            console.log('Usuario no encontrado o inactivo:', usuario_mail);
            return res.status(404).json({ error: 'Usuario no encontrado o inactivo' });
        }

        const user = results[0];

        try {
            const isMatch = await comparePasswords(usuario_contrasena, user.usuario_contrasena);
            console.log('Password match:', isMatch);

            if (!isMatch) {
                return res.status(401).json({ error: 'Contraseña incorrecta' });
            }

            const secret = process.env.JWT_SECRET || 'secret';
            // Incluir flag administrador en el payload para poder autorizar en middleware
            const payload = { id: user.id_usuario, administrador: !!user.administrador };
            // Token válido por 30 días
            const token = jwt.sign(payload, secret, { expiresIn: '30d' });
            console.log('Login successful for:', usuario_mail);
            // Devolvemos token y también la información mínima del usuario (incluyendo administrador)
            return res.status(200).json({ token, administrador: !!user.administrador, usuario: { id: user.id_usuario, usuario_nombre: user.usuario_nombre, usuario_mail: user.usuario_mail } });
        } catch (e) {
            console.error('Login compare error:', e);
            return res.status(500).json({ error: 'Error interno del servidor' });
        }
    });
};

module.exports = {
    login
};
