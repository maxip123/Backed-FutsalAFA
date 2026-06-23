const express = require('express');
const router = express.Router();
const { GenerarBracket, GetBracketByDivision, UpdateLlave, DeleteBracket } = require('../controllers/playoff.controller');
const { autenticarToken } = require('../Middleware/auth.middleware');
router.get('/:id_division', GetBracketByDivision);
router.post('/generar', autenticarToken, GenerarBracket);
router.put('/:id', autenticarToken, UpdateLlave);
router.delete('/:id_division', autenticarToken, DeleteBracket);
module.exports = router;
