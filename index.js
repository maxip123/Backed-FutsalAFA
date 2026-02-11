const express = require('express');
const { connection } = require("./config/database");
const dotenv = require('dotenv');
const morgan = require('morgan')
const cors = require('cors')
const helmet = require('helmet')
const routeClasificacion = require('./routes/clasificacion.routes');
const routeCuerpoTecnico = require('./routes/cuerpo_tecnico.routes');
const routeDivision = require('./routes/division.routes');
const routeJugador = require('./routes/jugador.routes');
const routePartido = require('./routes/partido.routes');
const routeSede = require('./routes/sede.routes');
const routeUsuario = require('./routes/usuario.routes');
const routeLogin = require('./routes/login.routes');
const routerEquipo = require('./routes/equipo.routes');
const routerEmail = require('./routes/email.routes');

dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));
// Configurar CORS para desarrollo y producción
const FRONTEND_URL = process.env.FRONTEND_URL || 'http://localhost:5173';
const allowedOrigins = [FRONTEND_URL];

// En producción, también permitir variantes como https
if (process.env.NODE_ENV === 'production' && FRONTEND_URL.startsWith('http://')) {
    allowedOrigins.push(FRONTEND_URL.replace('http://', 'https://'));
}

console.log('Allowed origins:', allowedOrigins);

app.use(cors({
    origin: function (origin, callback) {
        // Permitir requests sin origin (e.g., mobile apps, Postman)
        if (!origin) return callback(null, true);

        if (allowedOrigins.includes(origin)) {
            return callback(null, true);
        }

        console.warn('Origin blocked:', origin);
        return callback(new Error('Origin no autorizado'), false);
    },
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

// Remover middleware restrictivo que bloquea requests sin origin
app.use(helmet());
app.use('/api/clasificacion', routeClasificacion);
app.use('/api/cuerpo_tecnico', routeCuerpoTecnico);
app.use('/api/division', routeDivision);
app.use('/api/jugador', routeJugador);
app.use('/api/partido', routePartido);
app.use('/api/sede', routeSede);
app.use('/api/usuario', routeUsuario);
app.use('/api/login', routeLogin);
app.use('/api/equipo', routerEquipo);
app.use('/api/email', routerEmail);

app.get("/", (req, res) => {
    res.send(" Backend Futsal AFA funcionando correctamente")
})



const PORT = process.env.PORT || 8000

app.listen(PORT, (err) => {
    if (err) throw err
    console.log("escuchando en el puerto " + PORT)
})



connection.connect((err) => {
    if (err) throw err
    console.log("conectado a mi base de datos mysql")
})