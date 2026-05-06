const { connection } = require('../config/database');

// Generar un bracket vacío para una división
const GenerarBracket = (req, res) => {
    const { id_division, cantidad_equipos } = req.body;

    // Verificar si ya existe un bracket para esta división
    const checkQuery = 'SELECT COUNT(*) as count FROM llave_playoff WHERE id_division = ? AND activo_llave = 1';
    connection.query(checkQuery, [id_division], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al verificar el bracket', details: error.message });
        }
        
        if (results[0].count > 0) {
            return res.status(400).json({ error: 'Ya existe un bracket activo para esta división' });
        }

        // Calcular cuántas fases se necesitan
        const numEquipos = parseInt(cantidad_equipos);
        if (![2, 4, 8, 16, 32].includes(numEquipos)) {
            return res.status(400).json({ error: 'La cantidad de equipos debe ser 2, 4, 8, 16 o 32' });
        }

        const llavesACrear = [];
        let numRonda = numEquipos / 2; // Partidos en la primera ronda
        let faseActual = numRonda; // Representa el número de partidos en la fase
        let ordenGlobal = 1;

        // Estructura para recordar los IDs virtuales y enlazarlos luego en la BD
        const rondas = {};

        while (faseActual >= 1) {
            rondas[faseActual] = [];
            let nombreFase = '';
            if (faseActual === 1) nombreFase = 'Final';
            else if (faseActual === 2) nombreFase = 'Semifinal';
            else if (faseActual === 4) nombreFase = 'Cuartos de Final';
            else if (faseActual === 8) nombreFase = 'Octavos de Final';
            else if (faseActual === 16) nombreFase = '16avos de Final';

            for (let i = 0; i < faseActual; i++) {
                rondas[faseActual].push({
                    virtual_id: ordenGlobal,
                    id_division,
                    fase: nombreFase,
                    orden: i + 1,
                    // Si estamos en la final, no hay siguiente. 
                    // Si no, conectamos con la ronda anterior (faseActual / 2)
                    virtual_siguiente: faseActual === 1 ? null : null, 
                    es_local_siguiente: 1 // Por defecto
                });
                ordenGlobal++;
            }
            faseActual = faseActual / 2;
        }

        // Ahora enlazamos matemáticamente los virtuales
        faseActual = numRonda;
        while (faseActual > 1) {
            const partidosEstaRonda = rondas[faseActual];
            const partidosSiguienteRonda = rondas[faseActual / 2];
            
            for (let i = 0; i < partidosEstaRonda.length; i++) {
                const partido = partidosEstaRonda[i];
                const indiceSiguiente = Math.floor(i / 2);
                partido.virtual_siguiente = partidosSiguienteRonda[indiceSiguiente].virtual_id;
                partido.es_local_siguiente = (i % 2 === 0) ? 1 : 0;
            }
            faseActual = faseActual / 2;
        }

        // Aplanar el arreglo
        const llavesFinales = [];
        for (const [key, value] of Object.entries(rondas)) {
            llavesFinales.push(...value);
        }

        // Insertar en base de datos. Como necesitamos los IDs reales para enlazar, 
        // lo mejor es insertarlas desde la Final hacia arriba, para tener el ID real del siguiente.
        // O insertamos todo y luego hacemos un UPDATE. Vamos por insertar todo y luego UPDATE.

        const llavesOrdenadas = llavesFinales.sort((a, b) => a.virtual_id - b.virtual_id);
        
        let insertCount = 0;
        const idsMap = {}; // virtual_id -> real_id

        const insertNext = (index) => {
            if (index >= llavesOrdenadas.length) {
                // Terminan los inserts, ahora los updates
                updateNext(0);
                return;
            }
            
            const l = llavesOrdenadas[index];
            const q = 'INSERT INTO llave_playoff (id_division, fase, orden) VALUES (?, ?, ?)';
            connection.query(q, [l.id_division, l.fase, l.orden], (err, resInsert) => {
                if (err) return res.status(500).json({ error: 'Error al insertar llave', details: err.message });
                idsMap[l.virtual_id] = resInsert.insertId;
                insertNext(index + 1);
            });
        };

        const updateNext = (index) => {
            if (index >= llavesOrdenadas.length) {
                return res.status(201).json({ message: 'Bracket generado correctamente' });
            }

            const l = llavesOrdenadas[index];
            if (l.virtual_siguiente === null) {
                updateNext(index + 1); // Es la final
                return;
            }

            const realId = idsMap[l.virtual_id];
            const nextRealId = idsMap[l.virtual_siguiente];

            const q = 'UPDATE llave_playoff SET id_llave_siguiente = ?, es_local_siguiente = ? WHERE id_llave = ?';
            connection.query(q, [nextRealId, l.es_local_siguiente, realId], (err, resUpdate) => {
                if (err) return res.status(500).json({ error: 'Error al enlazar llaves', details: err.message });
                updateNext(index + 1);
            });
        };

        insertNext(0);
    });
};

// Obtener todo el bracket de una división
const GetBracketByDivision = (req, res) => {
    const { id_division } = req.params;
    const query = `
        SELECT l.*,
               el.nombre_equipo AS equipo_local_nombre,
               el.logo AS equipo_local_logo,
               ev.nombre_equipo AS equipo_visitante_nombre,
               ev.logo AS equipo_visitante_logo
        FROM llave_playoff AS l
        LEFT JOIN equipo AS el ON el.id_equipo = l.id_equipo_local
        LEFT JOIN equipo AS ev ON ev.id_equipo = l.id_equipo_visitante
        WHERE l.id_division = ? AND l.activo_llave = 1
        ORDER BY l.id_llave ASC
    `;

    connection.query(query, [id_division], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al obtener el bracket', details: error.message });
        }
        res.status(200).json(results);
    });
};

// Actualizar una llave (equipos, goles, estado)
const UpdateLlave = (req, res) => {
    const { id } = req.params;
    const { id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, estado_partido } = req.body;

    const updates = [];
    const values = [];

    if (id_equipo_local !== undefined) {
        updates.push('id_equipo_local = ?');
        values.push(id_equipo_local || null);
    }
    if (id_equipo_visitante !== undefined) {
        updates.push('id_equipo_visitante = ?');
        values.push(id_equipo_visitante || null);
    }
    if (goles_local !== undefined) {
        updates.push('goles_local = ?');
        values.push(goles_local !== null && goles_local !== '' ? parseInt(goles_local) : null);
    }
    if (goles_visitante !== undefined) {
        updates.push('goles_visitante = ?');
        values.push(goles_visitante !== null && goles_visitante !== '' ? parseInt(goles_visitante) : null);
    }
    if (estado_partido !== undefined) {
        updates.push('estado_partido = ?');
        values.push(estado_partido !== null ? parseInt(estado_partido) : 0);
    }

    if (updates.length === 0) {
        return res.status(400).json({ error: 'No hay datos para actualizar' });
    }

    values.push(id);

    const query = `UPDATE llave_playoff SET ${updates.join(', ')} WHERE id_llave = ?`;
    
    connection.query(query, values, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al actualizar la llave', details: error.message });
        }
        res.status(200).json({ message: 'Llave actualizada correctamente' });
    });
};

// Eliminar (resetear) todo el bracket de una división
const DeleteBracket = (req, res) => {
    const { id_division } = req.params;
    // Se podrían desvincular los id_partido y luego borrar lógicamente las llaves
    const query = 'UPDATE llave_playoff SET activo_llave = 0 WHERE id_division = ?';
    
    connection.query(query, [id_division], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al eliminar el bracket', details: error.message });
        }
        res.status(200).json({ message: 'Bracket eliminado correctamente' });
    });
};

module.exports = {
    GenerarBracket,
    GetBracketByDivision,
    UpdateLlave,
    DeleteBracket
};
