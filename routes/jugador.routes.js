const express = require('express');
const router = express.Router();

const { GetAllJugadores, GetJugadorById, CreateJugador, UpdateJugador, deleteJugador } = require('../controllers/jugador.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');

router.get('/', GetAllJugadores);
router.get('/:id', GetJugadorById);
router.post('/', autenticarToken, CreateJugador);
router.put('/:id', autenticarToken, UpdateJugador);
router.delete('/:id', autenticarToken, deleteJugador);

module.exports = router;
