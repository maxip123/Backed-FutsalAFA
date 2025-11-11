const express = require('express');
const router = express.Router();

const {GetAllDivisions, GetDivisionById, CreateDivision, UpdateDivision, deleteDivision} = require('../controllers/division.controller');

router.get('/', GetAllDivisions);
router.get('/:id', GetDivisionById);
router.post('/', CreateDivision);
router.put('/:id', UpdateDivision);
router.delete('/:id', deleteDivision);

module.exports = router;
