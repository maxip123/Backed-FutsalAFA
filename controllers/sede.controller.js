const {connection} = require('../config/database');

const GetAllSedes = (req, res) => {
    const query = 'SELECT * FROM sede';
    connection.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({error: 'Error en la consulta de sedes'});
        }
        res.status(200).json(results);
    });
};

module.exports = {
    GetAllSedes
};
