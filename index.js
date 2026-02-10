const express = require('express');
const {connection} = require("./config/database");
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
// Configurar CORS para aceptar únicamente el FRONTEND_URL definido en .env
const FRONTEND_URL = process.env.FRONTEND_URL;
if (!FRONTEND_URL) {
    console.warn('WARN: FRONTEND_URL no definido en .env. CORS quedará restrictivo por defecto.');
}
app.use(cors({
    origin: function(origin, callback) {
        // origin puede ser undefined en herramientas como curl/Postman.
        // Para ser estrictos, rechazamos peticiones sin Origin o con un Origin distinto al configurado.
        if (!origin) return callback(new Error('Origin header requerido'), false);
        if (origin === FRONTEND_URL) return callback(null, true);
        return callback(new Error('Origin no autorizado'), false);
    },
    credentials: true,
    methods: ['GET','POST','PUT','DELETE','OPTIONS'],
    allowedHeaders: ['Content-Type','Authorization']
}));
// Middleware adicional estricto: rechazar peticiones sin Origin o con Origin distinto
app.use((req, res, next) => {
    const origin = req.headers.origin;
    if (!origin) {
        return res.status(403).json({ error: 'Origin header requerido' });
    }
    if (origin !== FRONTEND_URL) {
        return res.status(403).json({ error: 'Origin no autorizado' });
    }
    next();
});
// Preflight es manejado por el middleware CORS configurado arriba.
app.use(helmet());
app.use('/api/clasificacion',routeClasificacion);
app.use('/api/cuerpo_tecnico',routeCuerpoTecnico);
app.use('/api/division',routeDivision);
app.use('/api/jugador',routeJugador);
app.use('/api/partido',routePartido);
app.use('/api/sede',routeSede);
app.use('/api/usuario',routeUsuario);
app.use('/api/login', routeLogin);
app.use('/api/equipo', routerEquipo);
app.use('/api/email', routerEmail);

app.get("/",(req,res)=>{
    res.send(" Backend Futsal AFA funcionando correctamente")
})



const PORT = process.env.PORT || 8000

app.listen(PORT,(err)=>{
    if(err) throw err
    console.log("escuchando en el puerto "+PORT)
})



connection.connect((err)=>{
    if(err) throw err
    console.log("conectado a mi base de datos mysql")
})