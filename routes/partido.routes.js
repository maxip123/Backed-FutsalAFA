const express = require('express');
const router = express.Router();
const { GetAllPartidos, GetPartidoById, GetPartidoByState, CreatePartido, UpdatePartido, deletePartido } = require('../controllers/partido.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');

router.get('/', GetAllPartidos);
router.get('/por-disputarse', GetPartidoByState);
router.get('/:id', GetPartidoById);
router.post('/', autenticarToken, CreatePartido);
router.put('/:id', autenticarToken, UpdatePartido);
router.delete('/:id', autenticarToken, deletePartido);

module.exports = router;
