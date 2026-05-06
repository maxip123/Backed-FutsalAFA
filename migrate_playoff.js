const { connection } = require('./config/database');

const runMigration = async () => {
    try {
        console.log('Iniciando migración de la tabla llave_playoff...');

        // 1. Drop foreign key to partido if exists (MySQL generates a name like llave_playoff_ibfk_x)
        // First, we need to find the exact FK name. This can be tricky. Let's just drop the column if we can.
        // Wait, dropping a column with a foreign key constraint might fail.
        
        // Let's use a workaround to drop the foreign key dynamically.
        const queryFK = `
            SELECT CONSTRAINT_NAME 
            FROM information_schema.KEY_COLUMN_USAGE 
            WHERE TABLE_NAME = 'llave_playoff' 
              AND COLUMN_NAME = 'id_partido' 
              AND TABLE_SCHEMA = DATABASE();
        `;
        
        connection.query(queryFK, (err, results) => {
            if (err) throw err;
            if (results && results.length > 0) {
                const fkName = results[0].CONSTRAINT_NAME;
                console.log(`Eliminando foreign key: ${fkName}`);
                connection.query(`ALTER TABLE llave_playoff DROP FOREIGN KEY ${fkName};`, (err2) => {
                    if (err2) console.error('Error al dropear FK:', err2);
                    alterColumns();
                });
            } else {
                alterColumns();
            }
        });

        function alterColumns() {
            // 2. Drop id_partido and add new columns
            const queryAlter = `
                ALTER TABLE llave_playoff
                DROP COLUMN id_partido,
                ADD COLUMN goles_local INT DEFAULT NULL,
                ADD COLUMN goles_visitante INT DEFAULT NULL,
                ADD COLUMN estado_partido INT DEFAULT 0;
            `;
            connection.query(queryAlter, (err) => {
                if (err) {
                    console.error('Error alterando columnas. Puede que ya hayan sido alteradas:', err.message);
                } else {
                    console.log('Columnas alteradas correctamente.');
                }
                process.exit(0);
            });
        }
    } catch (err) {
        console.error('Error fatal:', err);
        process.exit(1);
    }
};

runMigration();
