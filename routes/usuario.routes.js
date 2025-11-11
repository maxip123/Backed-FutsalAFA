const express = require('express');
const router = express.Router();

const { GetAllUsuarios, GetUsuarioById, CreateUsuario, UpdateUsuario, deleteUsuario } = require('../controllers/usuario.controller');


router.get('/', GetAllUsuarios);
router.get('/:id', GetUsuarioById);
router.post('/', CreateUsuario);
router.put('/:id', UpdateUsuario);
router.delete('/:id', deleteUsuario);

module.exports = router;
