const express = require('express');
const router = express.Router();

const { GetAllHistorial, GetHistorialById, CreateHistorial, DeleteHistorial } = require('../controllers/historial.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');

router.get('/', GetAllHistorial);
router.get('/:id', GetHistorialById);
router.post('/', autenticarToken, CreateHistorial);
router.delete('/:id', autenticarToken, DeleteHistorial);

module.exports = router;
