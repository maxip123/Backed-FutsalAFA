const express = require('express');
const router = express.Router();

const { GetAllJugadores, GetJugadorById, CreateJugador, UpdateJugador, deleteJugador } = require('../controllers/jugador.controller');

router.get('/', GetAllJugadores);
router.get('/:id', GetJugadorById);
router.post('/', CreateJugador);
router.put('/:id', UpdateJugador);
router.delete('/:id', deleteJugador);

module.exports = router;
