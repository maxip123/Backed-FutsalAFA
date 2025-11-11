const express = require('express');
const router = express.Router();
const { GetAllPartidos, GetPartidoById, CreatePartido, UpdatePartido, deletePartido } = require('../controllers/partido.controller');

router.get('/', GetAllPartidos);
router.get('/:id', GetPartidoById);
router.post('/', CreatePartido);
router.put('/:id', UpdatePartido);
router.delete('/:id', deletePartido);

module.exports = router;
