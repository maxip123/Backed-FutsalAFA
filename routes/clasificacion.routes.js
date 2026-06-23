const express = require('express');
const router = express.Router();
const { GetAllClasificaciones, GetClasificacionById, GetClasificacionByDivision, UpdateClasificacion } = require('../controllers/clasificacion.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');
router.get('/', GetAllClasificaciones);
router.get('/division/:id_division', GetClasificacionByDivision);
router.get('/:id', GetClasificacionById);
router.put('/:id', autenticarToken, UpdateClasificacion);
module.exports = router;
