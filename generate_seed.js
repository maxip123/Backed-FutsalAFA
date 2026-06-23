const fs = require('fs');
const logoUrl = 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png';
let sql = '';
// Variables
const numDivisions = 2;
const teamsPerDiv = 10;
const playersPerTeam = 8;
const staffPerTeam = 2;
// Set IDs
let divIdStart = 1000;
let teamIdStart = 1000;
let playerIdStart = 10000;
let staffIdStart = 5000;
sql += '-- --------------------------------------------------------\n';
sql += '-- Script de Mocks generados para Futsal AFA\n';
sql += '-- --------------------------------------------------------\n\n';
for (let d = 1; d <= numDivisions; d++) {
    const divId = divIdStart + d;
    const divName = `División Mock ${d}`;
    sql += `INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division) VALUES (${divId}, '${divName}', 1, 0, 0, 1);\n`;
    for (let t = 1; t <= teamsPerDiv; t++) {
        const teamId = teamIdStart++;
        const teamName = `Equipo M${d}-${t}`;
        sql += `INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (${teamId}, '${teamName}', '${logoUrl}', ${divId}, 1);\n`;
        sql += `INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (${teamId}, ${divId}, 0, 0, 0, 0, 0, 0, 0, 0);\n`;
        for (let p = 1; p <= playersPerTeam; p++) {
            const playerId = playerIdStart++;
            const playerName = `Jugador ${t}-${p} (Div ${d})`;
            const dni = `11${d}${t}${p}00`;
            sql += `INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (${playerId}, '${playerName}', '${dni}', '2000-01-01', 0, 0, 0, ${teamId}, 1);\n`;
        }
        for (let s = 1; s <= staffPerTeam; s++) {
            const staffId = staffIdStart++;
            const staffName = `Cuerpo Técnico ${t}-${s} (Div ${d})`;
            const dni = `22${d}${t}${s}00`;
            sql += `INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (${staffId}, '${staffName}', '${dni}', 0, 0, ${teamId}, 1);\n`;
        }
        sql += '\n';
    }
}
fs.writeFileSync('mock_data.sql', sql);
console.log('mock_data.sql generated successfully.');
