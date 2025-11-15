const express = require('express');
const router = express.Router();

const { GetAllCuerpoTecnico, GetCuerpoTecnicoById, CreateCuerpoTecnico, UpdateCuerpoTecnico, deleteCuerpoTecnico } = require('../controllers/cuerpo_tecnico.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');

router.get('/', GetAllCuerpoTecnico);
router.get('/:id', GetCuerpoTecnicoById);
router.post('/', autenticarToken, CreateCuerpoTecnico);
router.put('/:id', autenticarToken, UpdateCuerpoTecnico);
router.delete('/:id', autenticarToken, deleteCuerpoTecnico);

module.exports = router;
