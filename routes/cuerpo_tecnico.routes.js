const express = require('express');
const router = express.Router();

const { GetAllCuerpoTecnico, GetCuerpoTecnicoById, CreateCuerpoTecnico, UpdateCuerpoTecnico, deleteCuerpoTecnico } = require('../controllers/cuerpo_tecnico.controller');

router.get('/', GetAllCuerpoTecnico);
router.get('/:id', GetCuerpoTecnicoById);
router.post('/', CreateCuerpoTecnico);
router.put('/:id', UpdateCuerpoTecnico);
router.delete('/:id', deleteCuerpoTecnico);

module.exports = router;
