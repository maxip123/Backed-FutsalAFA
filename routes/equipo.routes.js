const express = require('express');
const router = express.Router();
const { GetAllEquipos, GetEquipoById, CreateEquipo, UpdateEquipo, deleteEquipo } = require('../controllers/equipo.controller');

router.get('/', GetAllEquipos);
router.get('/:id', GetEquipoById);
router.post('/', CreateEquipo);
router.put('/:id', UpdateEquipo);
router.delete('/:id', deleteEquipo);

module.exports = router;
