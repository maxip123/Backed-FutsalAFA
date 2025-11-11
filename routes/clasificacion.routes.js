const express = require('express');
const router = express.Router();
const { GetAllClasificaciones, GetClasificacionById, GetClasificacionByDivision, CreateClasificacion, UpdateClasificacion, deleteClasificacion } = require('../controllers/clasificacion.controller');

router.get('/', GetAllClasificaciones);
router.get('/:id', GetClasificacionById);
router.get('/division/:id_division', GetClasificacionByDivision);
router.post('/', CreateClasificacion);
router.put('/:id', UpdateClasificacion);
router.delete('/:id', deleteClasificacion);

module.exports = router;
