const express = require('express');
const router = express.Router();
const {GetAllSedes, GetSedeById, CreateSede, UpdateSede, deleteSede} = require('../controllers/sede.controller');

// Rutas para Sede
router.get('/', GetAllSedes);
router.get('/:id', GetSedeById);
router.post('/', CreateSede);
router.put('/:id', UpdateSede);
router.delete('/:id', deleteSede);

module.exports = router;
