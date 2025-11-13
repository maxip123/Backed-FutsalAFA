const express = require('express');
const router = express.Router();
const { GetAllClasificaciones, GetClasificacionById, GetClasificacionByDivision, UpdateClasificacion, deleteClasificacion } = require('../controllers/clasificacion.controller');

router.get('/', GetAllClasificaciones);
router.get('/:id', GetClasificacionById);
router.get('/division/:id_division', GetClasificacionByDivision);
// POST removido - la clasificación se crea automáticamente con el equipo
router.put('/:id', UpdateClasificacion);
router.delete('/:id', deleteClasificacion);

module.exports = router;
