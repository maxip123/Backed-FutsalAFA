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


dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));
app.use(cors());
app.use(helmet());
app.use('/api/clasificacion',routeClasificacion);
app.use('/api/cuerpo_tecnico',routeCuerpoTecnico);
app.use('/api/division',routeDivision);
app.use('/api/jugador',routeJugador);
app.use('/api/partido',routePartido);
app.use('/api/sede',routeSede);
app.use('/api/usuario',routeUsuario);

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