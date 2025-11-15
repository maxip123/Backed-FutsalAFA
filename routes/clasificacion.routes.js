const express = require('express');
const router = express.Router();
const { GetAllClasificaciones, GetClasificacionById, GetClasificacionByDivision, UpdateClasificacion, deleteClasificacion } = require('../controllers/clasificacion.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');

router.get('/', GetAllClasificaciones);
router.get('/:id', GetClasificacionById);
router.get('/division/:id_division', GetClasificacionByDivision);
router.put('/:id', autenticarToken, UpdateClasificacion);


module.exports = router;
