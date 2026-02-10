const nodemailer = require('nodemailer');
const dotenv = require('dotenv');
dotenv.config();

const transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: 587,
    secure: false,
    auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASSWORD
    }
});


const recoverPasswordEmail = async (email, token) => {
    const frontend = process.env.FRONTEND_URL || 'http://localhost:5173';
    const resetLink = `${frontend.replace(/\/$/, '')}/reset-password?token=${encodeURIComponent(token)}`;
    const htmltemplate = `
        <h1>Recuperación de Contraseña</h1>
        <p>Haz clic en el siguiente enlace para restablecer tu contraseña:</p>
        <a href="${resetLink}">Restablecer Contraseña</a>
        <p>Si no solicitaste este cambio, ignora este correo.</p>
    `;
    try {
        // transporter.sendMail devuelve una Promise si no pasamos callback
        const info = await transporter.sendMail({
                from: `"Futsal AFA" <${process.env.SMTP_USER}>`,
                to: email,
                subject: 'Recuperación de Contraseña',
                html: htmltemplate
            });
            return info;
        } catch (error) {
            console.error('Error al enviar correo de recuperación:', error);
            throw error;
        }
};

module.exports = {
    recoverPasswordEmail
};