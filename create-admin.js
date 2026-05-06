const { connection } = require('./config/database');
const { hashPassword } = require('./utils/hash.utils');
require('dotenv').config();

async function createAdminUser() {
    try {
        // Contraseña del admin
        const plainPassword = 'Admin123?'; // Cambia esto por la contraseña que quieras

        // Hashear la contraseña
        const hashedPassword = await hashPassword(plainPassword);

        // Datos del usuario admin
        const adminData = {
            usuario_nombre: 'Administrador',
            usuario_mail: 'admin1@futsalafa.com',
            usuario_contrasena: hashedPassword,
            administrador: 1,
            activo_usuario: 1
        };

        // Insert en la base de datos
        const query = 'INSERT INTO usuario (usuario_nombre, usuario_mail, usuario_contrasena, administrador, activo_usuario) VALUES (?, ?, ?, ?, ?)';

        connection.query(
            query,
            [adminData.usuario_nombre, adminData.usuario_mail, adminData.usuario_contrasena, adminData.administrador, adminData.activo_usuario],
            (err, results) => {
                if (err) {
                    console.error('Error creando usuario admin:', err);
                    process.exit(1);
                }

                console.log('✅ Usuario admin creado exitosamente!');
                console.log('📧 Email:', adminData.usuario_mail);
                console.log('🔑 Password:', plainPassword);
                console.log('👤 ID:', results.insertId);

                connection.end();
                process.exit(0);
            }
        );

    } catch (error) {
        console.error('Error:', error);
        process.exit(1);
    }
}

// Ejecutar
createAdminUser();
