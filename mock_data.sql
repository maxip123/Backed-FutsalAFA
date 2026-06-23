-- --------------------------------------------------------
-- Mock Data: 10 divisiones con torneos en curso simulados
-- 5 masculinas + 5 femeninas, 4 equipos c/u
-- Partidos jugados, clasificaciones consistentes, goles y tarjetas
-- --------------------------------------------------------

INSERT INTO sede (id_sede, nombre_sede, direccion, google_maps, activo_sede) VALUES (9000, 'Polideportivo Municipal', 'Av. San Martín 1500', NULL, 1);
INSERT INTO sede (id_sede, nombre_sede, direccion, google_maps, activo_sede) VALUES (9001, 'Club Atlético Futsal', 'Calle Rivadavia 800', NULL, 1);

-- ===================== Division 1: Copa Oro Masculina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2001, 'Copa Oro Masculina', 1, 0, 0, 1, '2025-03-01', '2025-11-30');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2000, 'Halcones FC', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20000, 'Lucas Rodríguez', '44457495', '2004-04-27', 0, 0, 0, 2000, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20001, 'Mateo López', '45944654', '2001-09-11', 0, 0, 0, 2000, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20002, 'Santiago Martínez', '23662730', '2000-03-08', 0, 0, 0, 2000, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20003, 'Nicolás García', '15493801', '1997-03-16', 0, 0, 0, 2000, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20004, 'Facundo Fernández', '33763212', '1998-06-07', 0, 0, 0, 2000, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7000, 'DT Roberto Martínez', '20298299', 0, 0, 2000, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2001, 'Tigres Futsal', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20005, 'Tomás Pérez', '13837732', '2001-10-06', 0, 0, 0, 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20006, 'Agustín Sánchez', '34130325', '2001-07-27', 0, 0, 0, 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20007, 'Joaquín Ramírez', '21609656', '1999-12-26', 0, 0, 0, 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20008, 'Franco Torres', '20363109', '2003-03-02', 0, 0, 0, 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20009, 'Martín Flores', '49952793', '2001-04-12', 0, 0, 0, 2001, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7001, 'DT Carlos Figueroa', '43274765', 0, 0, 2001, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2002, 'Racing Club', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20010, 'Gonzalo Díaz', '29111255', '1999-03-16', 0, 0, 0, 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20011, 'Sebastián Rivera', '49897685', '2005-03-07', 0, 0, 0, 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20012, 'Lautaro Gómez', '33323393', '2001-01-13', 0, 0, 0, 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20013, 'Maximiliano Morales', '27302065', '1995-02-14', 0, 0, 0, 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20014, 'Nahuel Reyes', '34338248', '1999-07-15', 0, 0, 0, 2002, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7002, 'DT Miguel Aguilar', '48648639', 0, 0, 2002, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2003, 'Deportivo Norte', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2001, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20015, 'Federico Cruz', '24486142', '2005-04-01', 0, 0, 0, 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20016, 'Diego Ortiz', '26639821', '2004-08-18', 0, 0, 0, 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20017, 'Ezequiel Gutiérrez', '11038720', '2001-01-14', 0, 0, 0, 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20018, 'Pablo Chávez', '46440714', '2002-06-26', 0, 0, 0, 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20019, 'Ramiro Ramos', '12925411', '2001-02-07', 0, 0, 0, 2003, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7003, 'DT Jorge Figueroa', '41162425', 0, 0, 2003, 1);

-- Partidos de Copa Oro Masculina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5000, '2025-03-01 19:30:00', 9000, 2001, 2003, 0, 4, 2001, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5001, '2025-03-11 17:30:00', 9001, 2002, 2003, 4, 0, 2001, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5002, '2025-03-18 17:00:00', 9000, 2000, 2001, 1, 3, 2001, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5003, '2025-03-25 21:30:00', 9001, 2000, 2002, 0, 0, 2001, 'Fecha 4', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5004, '2025-03-30 19:00:00', 9000, 2000, 2003, 0, 0, 2001, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5005, '2025-04-06 17:00:00', 9001, 2001, 2002, 0, 0, 2001, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Copa Oro Masculina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2000, 2001, 0, 1, 0, 0, 1, 1, 3, -2);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2001, 2001, 3, 2, 1, 0, 1, 3, 5, -2);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2002, 2001, 3, 1, 1, 0, 0, 4, 0, 4);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2003, 2001, 3, 2, 1, 0, 1, 4, 4, 0);

-- Actualizar estadisticas de jugadores de Copa Oro Masculina
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20000;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20001;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20005;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20007;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 0, tarjetas_rojas = 1 WHERE id_jugador = 20009;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20010;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20012;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20013;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20016;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20017;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20018;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20019;


-- ===================== Division 2: Liga Premier Masculina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2002, 'Liga Premier Masculina', 1, 0, 0, 1, '2025-04-15', '2025-12-15');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2004, 'Boca Juniors FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20020, 'Bruno Romero', '11512341', '2004-05-12', 0, 0, 0, 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20021, 'Iván Herrera', '37733621', '2000-03-13', 0, 0, 0, 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20022, 'Andrés Medina', '22344723', '1999-12-20', 0, 0, 0, 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20023, 'Cristian Aguilar', '46229988', '2005-08-08', 0, 0, 0, 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20024, 'Leandro Vargas', '46686019', '1995-06-04', 0, 0, 0, 2004, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7004, 'DT Sergio Cabrera', '16583734', 0, 0, 2004, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2005, 'River Plate FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20025, 'Emiliano Castro', '37451658', '2002-05-04', 0, 0, 0, 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20026, 'Damián Rojas', '10022136', '1999-11-16', 0, 0, 0, 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20027, 'Darío Mendoza', '31679332', '2000-05-12', 0, 0, 0, 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20028, 'Gastón Jiménez', '16604481', '1997-08-17', 0, 0, 0, 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20029, 'Hernán Silva', '31291169', '2000-05-07', 0, 0, 0, 2005, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7005, 'DT Ricardo Cabrera', '22142544', 0, 0, 2005, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2006, 'San Lorenzo FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20030, 'Julián Alvarez', '12426446', '1995-12-14', 0, 0, 0, 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20031, 'Manuel Acosta', '24133213', '2005-07-12', 0, 0, 0, 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20032, 'Carlos Molina', '29588375', '1997-09-24', 0, 0, 0, 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20033, 'Marcos Suárez', '42481883', '1999-10-15', 0, 0, 0, 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20034, 'Daniel Cabrera', '11697873', '2002-05-21', 0, 0, 0, 2006, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7006, 'DT Fernando Alvarez', '11582464', 0, 0, 2006, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2007, 'Independiente FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2002, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20035, 'Alan Vega', '38793542', '2003-07-10', 0, 0, 0, 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20036, 'Brian Ríos', '48031556', '2002-02-24', 0, 0, 0, 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20037, 'Kevin Sosa', '27418649', '1996-08-19', 0, 0, 0, 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20038, 'Alexis Figueroa', '18737561', '1997-05-01', 0, 0, 0, 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20039, 'Leonardo González', '40335856', '1995-10-28', 0, 0, 0, 2007, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7007, 'DT Marcelo Silva', '23068677', 0, 0, 2007, 1);

-- Partidos de Liga Premier Masculina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5006, '2025-04-17 17:00:00', 9000, 2004, 2007, 2, 2, 2002, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5007, '2025-04-23 19:00:00', 9001, 2004, 2006, 0, 1, 2002, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5008, '2025-05-02 17:30:00', 9000, 2005, 2006, 3, 1, 2002, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5009, '2025-05-08 20:30:00', 9001, 2004, 2005, 1, 5, 2002, 'Fecha 4', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5010, '2025-05-13 20:00:00', 9000, 2005, 2007, 0, 0, 2002, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5011, '2025-05-20 20:30:00', 9001, 2006, 2007, 0, 0, 2002, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Liga Premier Masculina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2004, 2002, 1, 3, 0, 1, 2, 3, 8, -5);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2005, 2002, 6, 2, 2, 0, 0, 8, 2, 6);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2006, 2002, 3, 2, 1, 0, 1, 2, 3, -1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2007, 2002, 1, 1, 0, 1, 0, 2, 2, 0);

-- Actualizar estadisticas de jugadores de Liga Premier Masculina
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20020;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 1 WHERE id_jugador = 20022;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20023;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20024;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20025;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20026;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20027;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20028;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20029;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20030;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20031;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20032;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20033;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20036;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20037;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20038;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7006;


-- ===================== Division 3: Torneo Apertura Masculino =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2003, 'Torneo Apertura Masculino', 1, 0, 0, 1, '2025-05-01', '2025-11-15');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2008, 'Ferro Futsal', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20040, 'Thiago Rodríguez', '27364468', '2003-06-23', 0, 0, 0, 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20041, 'Benjamín López', '43781723', '1997-10-21', 0, 0, 0, 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20042, 'Valentín Martínez', '35705730', '1999-05-15', 0, 0, 0, 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20043, 'Ignacio García', '41674574', '1996-06-04', 0, 0, 0, 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20044, 'Elías Fernández', '26480199', '1998-11-24', 0, 0, 0, 2008, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7008, 'DT Gustavo Gómez', '10883165', 0, 0, 2008, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2009, 'Atlanta FC', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20045, 'Matías Pérez', '42199977', '2001-01-21', 0, 0, 0, 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20046, 'Juan Sánchez', '22447170', '2002-08-10', 0, 0, 0, 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20047, 'Pedro Ramírez', '10437941', '2002-09-20', 0, 0, 0, 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20048, 'Gabriel Torres', '24141707', '2000-04-26', 0, 0, 0, 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20049, 'Rafael Flores', '41804597', '1997-07-07', 0, 0, 0, 2009, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7009, 'DT Daniel Sosa', '23416635', 0, 0, 2009, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2010, 'Platense FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20050, 'Emanuel Díaz', '14297914', '2005-07-12', 0, 0, 0, 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20051, 'Mauricio Rivera', '46733444', '2001-02-21', 0, 0, 0, 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20052, 'Ariel Gómez', '26051788', '1998-01-18', 0, 0, 0, 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20053, 'Rodrigo Morales', '30378685', '1995-06-27', 0, 0, 0, 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20054, 'Sergio Reyes', '18195125', '1996-09-22', 0, 0, 0, 2010, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7010, 'DT Roberto Figueroa', '34455802', 0, 0, 2010, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2011, 'Chacarita FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2003, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20055, 'Claudio Cruz', '11613840', '1999-09-12', 0, 0, 0, 2011, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20056, 'Fernando Ortiz', '34460353', '2002-10-16', 0, 0, 0, 2011, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20057, 'Gustavo Gutiérrez', '13522570', '2001-08-05', 0, 0, 0, 2011, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20058, 'Jorge Chávez', '36353093', '2001-09-06', 0, 0, 0, 2011, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20059, 'Oscar Ramos', '10572209', '2002-03-23', 0, 0, 0, 2011, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7011, 'DT Carlos Ríos', '33213146', 0, 0, 2011, 1);

-- Partidos de Torneo Apertura Masculino
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5012, '2025-05-02 20:00:00', 9000, 2008, 2010, 3, 5, 2003, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5013, '2025-05-09 20:00:00', 9001, 2009, 2011, 1, 5, 2003, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5014, '2025-05-15 20:00:00', 9000, 2008, 2009, 5, 5, 2003, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5015, '2025-05-23 17:00:00', 9001, 2010, 2011, 1, 4, 2003, 'Fecha 4', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5016, '2025-05-31 20:00:00', 9000, 2009, 2010, 4, 0, 2003, 'Fecha 5', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5017, '2025-06-06 21:30:00', 9001, 2008, 2011, 0, 0, 2003, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Torneo Apertura Masculino
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2008, 2003, 1, 2, 0, 1, 1, 8, 10, -2);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2009, 2003, 4, 3, 1, 1, 1, 10, 10, 0);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2010, 2003, 3, 3, 1, 0, 2, 6, 11, -5);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2011, 2003, 6, 2, 2, 0, 0, 9, 2, 7);

-- Actualizar estadisticas de jugadores de Torneo Apertura Masculino
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20040;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20041;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 1 WHERE id_jugador = 20042;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20043;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20044;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20045;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20046;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 0, tarjetas_rojas = 1 WHERE id_jugador = 20047;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20048;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20049;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20051;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 1, tarjetas_rojas = 1 WHERE id_jugador = 20052;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20054;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20055;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20056;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 1 WHERE id_jugador = 20057;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20059;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 3, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7009;


-- ===================== Division 4: Copa Ciudad Masculina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2004, 'Copa Ciudad Masculina', 1, 0, 0, 1, '2025-06-01', '2025-12-01');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2012, 'Barracas Central', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20060, 'Roberto Romero', '23045466', '2001-02-27', 0, 0, 0, 2012, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20061, 'Alberto Herrera', '45028388', '1996-09-06', 0, 0, 0, 2012, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20062, 'Hugo Medina', '37417006', '1996-02-11', 0, 0, 0, 2012, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20063, 'Miguel Aguilar', '38511264', '2002-05-16', 0, 0, 0, 2012, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20064, 'Eduardo Vargas', '38798742', '2000-12-18', 0, 0, 0, 2012, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7012, 'DT Miguel Morales', '38035499', 0, 0, 2012, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2013, 'Dock Sud FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20065, 'Alfredo Castro', '44892080', '1999-10-12', 0, 0, 0, 2013, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20066, 'Raúl Rojas', '35399298', '2003-07-27', 0, 0, 0, 2013, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20067, 'Antonio Mendoza', '23687707', '2002-01-14', 0, 0, 0, 2013, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20068, 'Francisco Jiménez', '16719533', '1999-08-18', 0, 0, 0, 2013, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20069, 'Esteban Silva', '37811649', '1997-09-16', 0, 0, 0, 2013, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7013, 'DT Jorge Medina', '40356331', 0, 0, 2013, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2014, 'Lanus FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20070, 'Adrián Alvarez', '27337340', '2004-05-23', 0, 0, 0, 2014, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20071, 'Gerardo Acosta', '43853081', '2003-11-14', 0, 0, 0, 2014, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20072, 'Marcelo Molina', '47910647', '1996-09-15', 0, 0, 0, 2014, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20073, 'Nelson Suárez', '16569586', '1995-01-06', 0, 0, 0, 2014, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20074, 'Rubén Cabrera', '47920699', '1998-12-25', 0, 0, 0, 2014, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7014, 'DT Sergio Rojas', '15020205', 0, 0, 2014, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2015, 'Banfield FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2004, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20075, 'Walter Vega', '16573117', '1999-07-03', 0, 0, 0, 2015, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20076, 'Héctor Ríos', '31215068', '1995-02-20', 0, 0, 0, 2015, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20077, 'Omar Sosa', '42762564', '2004-03-09', 0, 0, 0, 2015, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20078, 'Luis Figueroa', '39318144', '2003-09-13', 0, 0, 0, 2015, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20079, 'César González', '37437307', '2000-02-26', 0, 0, 0, 2015, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7015, 'DT Ricardo Martínez', '35697966', 0, 0, 2015, 1);

-- Partidos de Copa Ciudad Masculina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5018, '2025-06-04 21:00:00', 9000, 2012, 2015, 1, 2, 2004, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5019, '2025-06-09 17:30:00', 9001, 2013, 2014, 3, 5, 2004, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5020, '2025-06-17 17:30:00', 9000, 2013, 2015, 0, 1, 2004, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5021, '2025-06-25 19:30:00', 9001, 2014, 2015, 0, 0, 2004, 'Fecha 4', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5022, '2025-06-29 17:30:00', 9000, 2012, 2013, 0, 0, 2004, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5023, '2025-07-06 21:30:00', 9001, 2012, 2014, 0, 0, 2004, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Copa Ciudad Masculina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2012, 2004, 0, 1, 0, 0, 1, 1, 2, -1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2013, 2004, 0, 2, 0, 0, 2, 3, 6, -3);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2014, 2004, 3, 1, 1, 0, 0, 5, 3, 2);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2015, 2004, 6, 2, 2, 0, 0, 3, 1, 2);

-- Actualizar estadisticas de jugadores de Copa Ciudad Masculina
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20064;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20066;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20067;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20068;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20069;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20070;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20071;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20073;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20074;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20075;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20078;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7012;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7014;


-- ===================== Division 5: Liga Nacional Masculina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2005, 'Liga Nacional Masculina', 1, 0, 0, 1, '2025-07-01', '2025-12-30');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2016, 'Defensa y Justicia', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20080, 'Fabián Rodríguez', '38411777', '1997-08-08', 0, 0, 0, 2016, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20081, 'Néstor López', '48530199', '2000-06-22', 0, 0, 0, 2016, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20082, 'Osvaldo Martínez', '38283756', '2002-11-23', 0, 0, 0, 2016, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20083, 'Ricardo García', '34151367', '1997-09-16', 0, 0, 0, 2016, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20084, 'Víctor Fernández', '18963936', '2004-02-18', 0, 0, 0, 2016, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7016, 'DT Fernando Gómez', '16616202', 0, 0, 2016, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2017, 'Temperley FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20085, 'Ernesto Pérez', '47171577', '1998-04-07', 0, 0, 0, 2017, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20086, 'Julio Sánchez', '39059630', '2000-05-04', 0, 0, 0, 2017, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20087, 'Abel Ramírez', '47120147', '1999-11-27', 0, 0, 0, 2017, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20088, 'Ángel Torres', '21550452', '2003-06-11', 0, 0, 0, 2017, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20089, 'Horacio Flores', '18102495', '1995-02-09', 0, 0, 0, 2017, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7017, 'DT Marcelo Romero', '22866864', 0, 0, 2017, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2018, 'Quilmes FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20090, 'Ismael Díaz', '25103730', '1998-02-20', 0, 0, 0, 2018, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20091, 'Mariano Rivera', '37753879', '1996-10-10', 0, 0, 0, 2018, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20092, 'Rolando Gómez', '37621416', '2003-06-14', 0, 0, 0, 2018, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20093, 'Silvio Morales', '18847087', '2001-03-19', 0, 0, 0, 2018, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20094, 'Dante Reyes', '14386521', '2000-05-01', 0, 0, 0, 2018, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7018, 'DT Gustavo Mendoza', '46526949', 0, 0, 2018, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2019, 'Avellaneda FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2005, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20095, 'Germán Cruz', '19905597', '1997-11-21', 0, 0, 0, 2019, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20096, 'Lorenzo Ortiz', '42074440', '2005-05-04', 0, 0, 0, 2019, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20097, 'Máximo Gutiérrez', '20820839', '2003-05-09', 0, 0, 0, 2019, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20098, 'Simón Chávez', '14552304', '1995-03-28', 0, 0, 0, 2019, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20099, 'Tobías Ramos', '22904524', '2003-04-24', 0, 0, 0, 2019, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7019, 'DT Daniel Sosa', '11035140', 0, 0, 2019, 1);

-- Partidos de Liga Nacional Masculina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5024, '2025-07-04 19:30:00', 9000, 2018, 2019, 3, 0, 2005, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5025, '2025-07-08 21:30:00', 9001, 2016, 2019, 4, 4, 2005, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5026, '2025-07-18 17:30:00', 9000, 2017, 2018, 1, 2, 2005, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5027, '2025-07-23 17:00:00', 9001, 2017, 2019, 0, 1, 2005, 'Fecha 4', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5028, '2025-07-29 17:30:00', 9000, 2016, 2017, 0, 0, 2005, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5029, '2025-08-08 20:30:00', 9001, 2016, 2018, 0, 0, 2005, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Liga Nacional Masculina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2016, 2005, 1, 1, 0, 1, 0, 4, 4, 0);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2017, 2005, 0, 2, 0, 0, 2, 1, 3, -2);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2018, 2005, 6, 2, 2, 0, 0, 5, 1, 4);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2019, 2005, 4, 3, 1, 1, 1, 5, 7, -2);

-- Actualizar estadisticas de jugadores de Liga Nacional Masculina
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20081;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20083;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20084;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 1 WHERE id_jugador = 20085;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20086;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20090;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20092;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20093;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20095;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 1 WHERE id_jugador = 20096;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20097;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20099;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7017;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7019;


-- ===================== Division 6: Copa Oro Femenina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2006, 'Copa Oro Femenina', 0, 1, 0, 1, '2025-03-15', '2025-11-15');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2020, 'Las Leonas FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20100, 'Lucía Romero', '18245550', '1995-09-23', 0, 0, 0, 2020, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20101, 'Valentina Herrera', '21013445', '1995-09-04', 0, 0, 0, 2020, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20102, 'Sofía Medina', '15677005', '1999-03-06', 0, 0, 0, 2020, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20103, 'Martina Aguilar', '38974027', '2002-01-01', 0, 0, 0, 2020, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20104, 'Catalina Vargas', '36185078', '2004-11-19', 0, 0, 0, 2020, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7020, 'DTA Claudia Fernández', '30258360', 0, 0, 2020, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2021, 'Panteras FC', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20105, 'Julieta Castro', '27985185', '1995-02-25', 0, 0, 0, 2021, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20106, 'Florencia Rojas', '25980446', '2003-07-17', 0, 0, 0, 2021, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20107, 'Camila Mendoza', '45088451', '2002-01-15', 0, 0, 0, 2021, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20108, 'Micaela Jiménez', '42907016', '2001-03-16', 0, 0, 0, 2021, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20109, 'Abril Silva', '34071703', '2001-09-24', 0, 0, 0, 2021, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7021, 'DTA Patricia Mendoza', '33847150', 0, 0, 2021, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2022, 'Aguilas FS', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20110, 'Agustina Alvarez', '41735162', '2001-12-15', 0, 0, 0, 2022, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20111, 'Candela Acosta', '23278070', '1998-10-16', 0, 0, 0, 2022, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20112, 'Delfina Molina', '37940457', '2000-10-04', 0, 0, 0, 2022, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20113, 'Emilia Suárez', '47514397', '2000-06-23', 0, 0, 0, 2022, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20114, 'Mía Cabrera', '12051526', '2000-02-14', 0, 0, 0, 2022, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7022, 'DTA Silvina Cruz', '29193812', 0, 0, 2022, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2023, 'Mariposas FC', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2006, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20115, 'Pilar Vega', '27312364', '1997-02-19', 0, 0, 0, 2023, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20116, 'Renata Ríos', '36221764', '2005-09-12', 0, 0, 0, 2023, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20117, 'Victoria Sosa', '37460056', '2002-02-19', 0, 0, 0, 2023, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20118, 'Zoe Figueroa', '49403389', '2001-10-08', 0, 0, 0, 2023, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20119, 'Alma González', '39822616', '1997-06-05', 0, 0, 0, 2023, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7023, 'DTA Lorena Gómez', '29729174', 0, 0, 2023, 1);

-- Partidos de Copa Oro Femenina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5030, '2025-03-16 18:00:00', 9000, 2022, 2023, 1, 0, 2006, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5031, '2025-03-23 18:00:00', 9001, 2021, 2023, 4, 5, 2006, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5032, '2025-04-01 17:00:00', 9000, 2020, 2023, 4, 3, 2006, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5033, '2025-04-06 21:00:00', 9001, 2020, 2021, 4, 4, 2006, 'Fecha 4', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5034, '2025-04-13 21:30:00', 9000, 2021, 2022, 0, 0, 2006, 'Fecha 5', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5035, '2025-04-22 20:00:00', 9001, 2020, 2022, 0, 0, 2006, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Copa Oro Femenina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2020, 2006, 4, 2, 1, 1, 0, 8, 7, 1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2021, 2006, 2, 3, 0, 2, 1, 8, 9, -1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2022, 2006, 4, 2, 1, 1, 0, 1, 0, 1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2023, 2006, 3, 3, 1, 0, 2, 8, 9, -1);

-- Actualizar estadisticas de jugadores de Copa Oro Femenina
UPDATE jugador SET goles = 3, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20100;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20101;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 1 WHERE id_jugador = 20102;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20103;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20104;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20105;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20106;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20107;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20108;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20109;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20110;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20113;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20115;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20116;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20117;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20118;
UPDATE jugador SET goles = 4, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20119;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7021;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7023;


-- ===================== Division 7: Liga Premier Femenina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2007, 'Liga Premier Femenina', 0, 1, 0, 1, '2025-04-01', '2025-12-01');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2024, 'Boca Femenino', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20120, 'Milagros Rodríguez', '16594057', '2004-02-03', 0, 0, 0, 2024, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20121, 'Celeste López', '41915723', '1999-06-16', 0, 0, 0, 2024, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20122, 'Brisa Martínez', '15055881', '1998-02-03', 0, 0, 0, 2024, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20123, 'Rocío García', '19021661', '2001-06-07', 0, 0, 0, 2024, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20124, 'Romina Fernández', '39985291', '1995-10-06', 0, 0, 0, 2024, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7024, 'DTA Andrea Torres', '33267632', 0, 0, 2024, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2025, 'River Femenino', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20125, 'Carolina Pérez', '47528613', '2003-06-28', 0, 0, 0, 2025, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20126, 'Andrea Sánchez', '35487131', '2002-11-17', 0, 0, 0, 2025, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20127, 'Lorena Ramírez', '45673194', '2003-11-07', 0, 0, 0, 2025, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20128, 'Natalia Torres', '10380919', '1996-12-12', 0, 0, 0, 2025, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20129, 'Valeria Flores', '14510637', '2002-07-21', 0, 0, 0, 2025, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7025, 'DTA Carolina Reyes', '15360028', 0, 0, 2025, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2026, 'San Lorenzo Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20130, 'Daniela Díaz', '26600201', '2002-01-24', 0, 0, 0, 2026, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20131, 'Mariana Rivera', '25119286', '1997-12-16', 0, 0, 0, 2026, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20132, 'Gabriela Gómez', '48395536', '2000-03-21', 0, 0, 0, 2026, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20133, 'Fernanda Morales', '20240085', '1996-03-25', 0, 0, 0, 2026, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20134, 'Patricia Reyes', '33344694', '1995-03-17', 0, 0, 0, 2026, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7026, 'DTA Natalia López', '15829656', 0, 0, 2026, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2027, 'Racing Femenino', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2007, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20135, 'Cecilia Cruz', '22863993', '2002-04-28', 0, 0, 0, 2027, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20136, 'Verónica Ortiz', '42792666', '2004-09-25', 0, 0, 0, 2027, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20137, 'Silvina Gutiérrez', '33320361', '2000-02-21', 0, 0, 0, 2027, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20138, 'Analía Chávez', '22922897', '1999-01-20', 0, 0, 0, 2027, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20139, 'Soledad Ramos', '24636706', '2004-07-04', 0, 0, 0, 2027, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7027, 'DTA Gabriela Sosa', '35158105', 0, 0, 2027, 1);

-- Partidos de Liga Premier Femenina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5036, '2025-04-02 19:00:00', 9000, 2024, 2026, 4, 3, 2007, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5037, '2025-04-09 17:00:00', 9001, 2026, 2027, 0, 5, 2007, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5038, '2025-04-18 20:00:00', 9000, 2024, 2025, 2, 2, 2007, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5039, '2025-04-25 19:00:00', 9001, 2024, 2027, 0, 0, 2007, 'Fecha 4', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5040, '2025-04-30 18:30:00', 9000, 2025, 2026, 0, 0, 2007, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5041, '2025-05-08 20:30:00', 9001, 2025, 2027, 0, 0, 2007, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Liga Premier Femenina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2024, 2007, 4, 2, 1, 1, 0, 6, 5, 1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2025, 2007, 1, 1, 0, 1, 0, 2, 2, 0);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2026, 2007, 0, 2, 0, 0, 2, 3, 9, -6);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2027, 2007, 3, 1, 1, 0, 0, 5, 0, 5);

-- Actualizar estadisticas de jugadores de Liga Premier Femenina
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20121;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20122;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20123;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20124;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20128;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20129;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20130;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20132;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20133;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20134;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20135;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20136;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20139;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7025;


-- ===================== Division 8: Torneo Apertura Femenino =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2008, 'Torneo Apertura Femenino', 0, 1, 0, 1, '2025-05-15', '2025-11-30');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2028, 'Ferro Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20140, 'Jimena Romero', '35909447', '1998-11-15', 0, 0, 0, 2028, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20141, 'Tamara Herrera', '30012140', '2000-10-21', 0, 0, 0, 2028, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20142, 'Yanina Medina', '38356931', '2002-07-12', 0, 0, 0, 2028, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20143, 'Belén Aguilar', '42517897', '1998-12-03', 0, 0, 0, 2028, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20144, 'Mercedes Vargas', '42816598', '2005-04-25', 0, 0, 0, 2028, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7028, 'DTA Cecilia Gómez', '14625123', 0, 0, 2028, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2029, 'Atlanta Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20145, 'Lara Castro', '34994962', '2000-06-12', 0, 0, 0, 2029, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20146, 'Bianca Rojas', '34566992', '2005-05-13', 0, 0, 0, 2029, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20147, 'Jazmín Mendoza', '48312649', '2001-11-18', 0, 0, 0, 2029, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20148, 'Priscila Jiménez', '21210842', '2004-09-28', 0, 0, 0, 2029, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20149, 'Antonella Silva', '32673941', '2005-01-13', 0, 0, 0, 2029, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7029, 'DTA Valeria Medina', '26298449', 0, 0, 2029, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2030, 'Platense Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20150, 'Macarena Alvarez', '44194409', '2005-05-27', 0, 0, 0, 2030, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20151, 'Dolores Acosta', '22165403', '1996-07-23', 0, 0, 0, 2030, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20152, 'Inés Molina', '48553818', '1998-10-15', 0, 0, 0, 2030, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20153, 'Clara Suárez', '44949935', '1999-11-08', 0, 0, 0, 2030, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20154, 'Paula Cabrera', '42533738', '2004-08-04', 0, 0, 0, 2030, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7030, 'DTA Claudia Reyes', '35072356', 0, 0, 2030, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2031, 'Chacarita Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2008, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20155, 'Elena Vega', '22500401', '2001-07-25', 0, 0, 0, 2031, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20156, 'Laura Ríos', '33999826', '2003-11-13', 0, 0, 0, 2031, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20157, 'Ana Sosa', '26459522', '2000-07-07', 0, 0, 0, 2031, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20158, 'María Figueroa', '10612375', '2000-06-03', 0, 0, 0, 2031, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20159, 'Sara González', '16096322', '2004-09-05', 0, 0, 0, 2031, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7031, 'DTA Patricia Ramos', '33463460', 0, 0, 2031, 1);

-- Partidos de Torneo Apertura Femenino
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5042, '2025-05-15 17:00:00', 9000, 2030, 2031, 5, 5, 2008, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5043, '2025-05-23 21:30:00', 9001, 2029, 2031, 3, 2, 2008, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5044, '2025-05-30 18:30:00', 9000, 2028, 2031, 4, 4, 2008, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5045, '2025-06-05 19:00:00', 9001, 2029, 2030, 5, 2, 2008, 'Fecha 4', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5046, '2025-06-15 19:00:00', 9000, 2028, 2030, 0, 0, 2008, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5047, '2025-06-19 18:00:00', 9001, 2028, 2029, 0, 0, 2008, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Torneo Apertura Femenino
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2028, 2008, 1, 1, 0, 1, 0, 4, 4, 0);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2029, 2008, 6, 2, 2, 0, 0, 8, 4, 4);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2030, 2008, 1, 2, 0, 1, 1, 7, 10, -3);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2031, 2008, 2, 3, 0, 2, 1, 11, 12, -1);

-- Actualizar estadisticas de jugadores de Torneo Apertura Femenino
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20140;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20142;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20143;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20144;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20145;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20146;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20147;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20149;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20150;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20151;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20153;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20154;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20155;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20156;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20157;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20158;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 3, tarjetas_rojas = 0 WHERE id_jugador = 20159;


-- ===================== Division 9: Copa Ciudad Femenina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2009, 'Copa Ciudad Femenina', 0, 1, 0, 1, '2025-06-15', '2025-12-15');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2032, 'UAI Urquiza Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20160, 'Luciana Rodríguez', '44563159', '1999-10-20', 0, 0, 0, 2032, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20161, 'Aldana López', '36081737', '2004-09-16', 0, 0, 0, 2032, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20162, 'Morena Martínez', '17236687', '2001-02-13', 0, 0, 0, 2032, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20163, 'Guadalupe García', '48132773', '1995-01-27', 0, 0, 0, 2032, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20164, 'Luna Fernández', '42961138', '1995-09-02', 0, 0, 0, 2032, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7032, 'DTA Silvina Medina', '24293299', 0, 0, 2032, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2033, 'Def y Justicia Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20165, 'Azul Pérez', '35662415', '1997-09-18', 0, 0, 0, 2033, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20166, 'Sol Sánchez', '17142243', '1998-06-10', 0, 0, 0, 2033, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20167, 'Malena Ramírez', '37876119', '1999-09-25', 0, 0, 0, 2033, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20168, 'Paloma Torres', '22240073', '1995-12-22', 0, 0, 0, 2033, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20169, 'Isabella Flores', '22084101', '2000-10-06', 0, 0, 0, 2033, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7033, 'DTA Lorena Ramírez', '12643291', 0, 0, 2033, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2034, 'Lanus Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20170, 'Amelia Díaz', '41188223', '2004-02-21', 0, 0, 0, 2034, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20171, 'Olivia Rivera', '49292350', '2004-10-23', 0, 0, 0, 2034, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20172, 'Julia Gómez', '20410324', '1996-03-07', 0, 0, 0, 2034, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20173, 'Nadia Morales', '27437144', '1996-09-28', 0, 0, 0, 2034, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20174, 'Karen Reyes', '29030688', '2000-02-22', 0, 0, 0, 2034, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7034, 'DTA Andrea Torres', '42645334', 0, 0, 2034, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2035, 'Banfield Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2009, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20175, 'Cinthia Cruz', '33100027', '2003-06-05', 0, 0, 0, 2035, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20176, 'Gisela Ortiz', '22810053', '2001-12-12', 0, 0, 0, 2035, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20177, 'Noelia Gutiérrez', '10457335', '1996-12-24', 0, 0, 0, 2035, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20178, 'Dahiana Chávez', '42188587', '2002-06-09', 0, 0, 0, 2035, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20179, 'Ludmila Ramos', '18821460', '1999-03-14', 0, 0, 0, 2035, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7035, 'DTA Carolina Acosta', '36460020', 0, 0, 2035, 1);

-- Partidos de Copa Ciudad Femenina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5048, '2025-06-15 20:00:00', 9000, 2032, 2033, 2, 0, 2009, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5049, '2025-06-25 21:00:00', 9001, 2032, 2034, 1, 5, 2009, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5050, '2025-07-02 21:00:00', 9000, 2033, 2034, 3, 4, 2009, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5051, '2025-07-08 21:30:00', 9001, 2032, 2035, 2, 2, 2009, 'Fecha 4', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5052, '2025-07-16 21:00:00', 9000, 2033, 2035, 3, 1, 2009, 'Fecha 5', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5053, '2025-07-22 20:30:00', 9001, 2034, 2035, 0, 0, 2009, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Copa Ciudad Femenina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2032, 2009, 4, 3, 1, 1, 1, 5, 7, -2);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2033, 2009, 3, 3, 1, 0, 2, 6, 7, -1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2034, 2009, 6, 2, 2, 0, 0, 9, 4, 5);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2035, 2009, 1, 2, 0, 1, 1, 3, 5, -2);

-- Actualizar estadisticas de jugadores de Copa Ciudad Femenina
UPDATE jugador SET goles = 2, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20160;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20161;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20162;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 1 WHERE id_jugador = 20164;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20166;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 2, tarjetas_rojas = 1 WHERE id_jugador = 20167;
UPDATE jugador SET goles = 4, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20168;
UPDATE jugador SET goles = 4, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20170;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20171;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20172;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20173;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20174;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 2, tarjetas_rojas = 0 WHERE id_jugador = 20176;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20177;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20179;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7032;


-- ===================== Division 10: Liga Nacional Femenina =====================
INSERT INTO division (id_division, Nombre_division, masculino, femenino, terminado, activo_division, fecha_inicio, fecha_fin) VALUES (2010, 'Liga Nacional Femenina', 0, 1, 0, 1, '2025-07-15', '2025-12-30');

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2036, 'Excursionistas Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20180, 'Oriana Romero', '26505605', '2005-06-08', 0, 0, 0, 2036, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20181, 'Melina Herrera', '38835474', '2000-04-24', 0, 0, 0, 2036, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20182, 'Ailín Medina', '44753400', '2000-05-15', 0, 0, 0, 2036, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20183, 'Abigail Aguilar', '28449459', '1998-04-24', 0, 0, 0, 2036, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20184, 'Kiara Vargas', '46221530', '2000-04-22', 0, 0, 0, 2036, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7036, 'DTA Natalia Romero', '24276143', 0, 0, 2036, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2037, 'Temperley Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20185, 'Ayelén Castro', '27747263', '2003-12-13', 0, 0, 0, 2037, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20186, 'Mikaela Rojas', '29758295', '1997-12-12', 0, 0, 0, 2037, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20187, 'Renata Mendoza', '21219797', '1998-08-26', 0, 0, 0, 2037, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20188, 'Ximena Jiménez', '37840212', '1999-07-21', 0, 0, 0, 2037, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20189, 'Ariana Silva', '29381163', '1996-04-20', 0, 0, 0, 2037, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7037, 'DTA Gabriela Molina', '17325318', 0, 0, 2037, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2038, 'Quilmes Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20190, 'Fátima Alvarez', '35839458', '2003-01-09', 0, 0, 0, 2038, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20191, 'Josefina Acosta', '23228103', '1998-01-07', 0, 0, 0, 2038, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20192, 'Delfina Molina', '10289618', '2001-09-26', 0, 0, 0, 2038, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20193, 'Serena Suárez', '43029907', '2000-10-15', 0, 0, 0, 2038, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20194, 'Helena Cabrera', '11597144', '1999-08-22', 0, 0, 0, 2038, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7038, 'DTA Cecilia Vargas', '39682813', 0, 0, 2038, 1);

INSERT INTO equipo (id_equipo, nombre_equipo, logo, id_division, activo_equipo) VALUES (2039, 'Avellaneda Fem', 'https://png.pngtree.com/png-clipart/20240819/original/pngtree-soccer-football-logo-design-png-image_15804023.png', 2010, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20195, 'Amparo Vega', '36131270', '1998-07-21', 0, 0, 0, 2039, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20196, 'Violeta Ríos', '30594956', '1999-05-26', 0, 0, 0, 2039, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20197, 'Aurora Sosa', '18838617', '1997-01-08', 0, 0, 0, 2039, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20198, 'Iris Figueroa', '32309368', '2000-02-02', 0, 0, 0, 2039, 1);
INSERT INTO jugador (id_jugador, jugador_nombre, DNI_jugador, fecha_nac, goles, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_jugador) VALUES (20199, 'Vera González', '48131035', '2001-10-20', 0, 0, 0, 2039, 1);
INSERT INTO cuerpo_tecnico (id_cuerpo_tecnico, cuerpo_tecnico_nombre, DNI_cuerpo_tecnico, tarjetas_amarillas, tarjetas_rojas, id_equipo, activo_cuerpo_tecnico) VALUES (7039, 'DTA Valeria Chávez', '45619323', 0, 0, 2039, 1);

-- Partidos de Liga Nacional Femenina
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5054, '2025-07-17 20:30:00', 9000, 2037, 2038, 4, 3, 2010, 'Fecha 1', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5055, '2025-07-25 21:30:00', 9001, 2036, 2038, 1, 0, 2010, 'Fecha 2', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5056, '2025-07-30 21:00:00', 9000, 2038, 2039, 2, 5, 2010, 'Fecha 3', 1, 1, 2);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5057, '2025-08-07 21:30:00', 9001, 2036, 2039, 0, 0, 2010, 'Fecha 4', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5058, '2025-08-12 20:30:00', 9000, 2036, 2037, 0, 0, 2010, 'Fecha 5', 1, 1, 0);
INSERT INTO partido (id_partido, fecha_partido, id_sede, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, id_division, nombre_partido, afecta_clasificacion, activo_partido, estado_partido) VALUES (5059, '2025-08-19 19:30:00', 9001, 2037, 2039, 0, 0, 2010, 'Fecha 6', 1, 1, 0);

-- Clasificaciones de Liga Nacional Femenina
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2036, 2010, 3, 1, 1, 0, 0, 1, 0, 1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2037, 2010, 3, 1, 1, 0, 0, 4, 3, 1);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2038, 2010, 0, 3, 0, 0, 3, 5, 10, -5);
INSERT INTO clasificacion (id_equipo, id_division, puntos, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, diferencia_goles) VALUES (2039, 2010, 3, 1, 1, 0, 0, 5, 2, 3);

-- Actualizar estadisticas de jugadores de Liga Nacional Femenina
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20183;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20186;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20188;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20190;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20192;
UPDATE jugador SET goles = 0, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20193;
UPDATE jugador SET goles = 3, tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_jugador = 20194;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20195;
UPDATE jugador SET goles = 2, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20197;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20198;
UPDATE jugador SET goles = 1, tarjetas_amarillas = 0, tarjetas_rojas = 0 WHERE id_jugador = 20199;
UPDATE cuerpo_tecnico SET tarjetas_amarillas = 1, tarjetas_rojas = 0 WHERE id_cuerpo_tecnico = 7038;

