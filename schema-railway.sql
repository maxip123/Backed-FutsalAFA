-- Script adaptado para Railway (ya existe DB 'railway')
-- Solo creamos las tablas

-- Tabla de divisiones
CREATE TABLE IF NOT EXISTS division(
    id_division INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_division VARCHAR(50) NOT NULL,
    activo_division BOOLEAN DEFAULT 1
);

-- Tabla de sedes
CREATE TABLE IF NOT EXISTS sede(
    id_sede INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_sede VARCHAR(100) NOT NULL,
    activo_sede BOOLEAN DEFAULT 1
);

-- Tabla de equipos
CREATE TABLE IF NOT EXISTS equipo(
    id_equipo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_equipo VARCHAR(100) NOT NULL,
    logo_equipo VARCHAR(255),
    id_division INT NOT NULL,
    activo_equipo BOOLEAN DEFAULT 1,
    FOREIGN KEY (id_division) REFERENCES division(id_division)
);

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    usuario_nombre VARCHAR(100) NOT NULL,
    usuario_mail VARCHAR(100) NOT NULL UNIQUE,
    usuario_contrasena VARCHAR(255) NOT NULL,
    administrador BOOLEAN DEFAULT 0,
    activo_usuario BOOLEAN DEFAULT 1
);

-- Tabla de jugadores
CREATE TABLE IF NOT EXISTS jugador(
    id_jugador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    jugador_nombre VARCHAR(100) NOT NULL,
    DNI_jugador INT NOT NULL UNIQUE,
    foto_jugador VARCHAR(255),
    goles INT DEFAULT 0,
    tarjetas_amarillas INT DEFAULT 0,
    tarjetas_rojas INT DEFAULT 0,
    id_equipo INT NOT NULL,
    activo_jugador BOOLEAN DEFAULT 1,
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);

-- Tabla de cuerpo técnico
CREATE TABLE IF NOT EXISTS cuerpo_tecnico(
    id_cuerpo_tecnico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cuerpo_tecnico_nombre VARCHAR(100) NOT NULL,
    DNI_cuerpo_tecnico INT NOT NULL UNIQUE,
    tarjetas_amarillas INT DEFAULT 0,
    tarjetas_rojas INT DEFAULT 0,
    id_equipo INT NOT NULL,
    activo_cuerpo_tecnico BOOLEAN DEFAULT 1,
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);

-- Tabla de partidos
CREATE TABLE IF NOT EXISTS partido(
    id_partido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_partido DATETIME NOT NULL,
    id_sede INT NOT NULL,
    id_equipo_local INT NOT NULL,
    id_equipo_visitante INT NOT NULL,
    goles_local INT DEFAULT 0,
    goles_visitante INT DEFAULT 0,
    id_division INT NOT NULL,
    nombre_partido VARCHAR(100) DEFAULT NULL,
    afecta_clasificacion BOOLEAN DEFAULT 1,
    activo_partido BOOLEAN DEFAULT 1,
    estado_partido INT DEFAULT 0,
    FOREIGN KEY (id_sede) REFERENCES sede(id_sede),
    FOREIGN KEY (id_equipo_local) REFERENCES equipo(id_equipo),
    FOREIGN KEY (id_equipo_visitante) REFERENCES equipo(id_equipo),
    FOREIGN KEY (id_division) REFERENCES division(id_division)
);

-- Índices para partidos
CREATE INDEX idx_jugador_equipo ON jugador(id_equipo);
CREATE INDEX idx_cuerpo_tecnico_equipo ON cuerpo_tecnico(id_equipo);
CREATE INDEX idx_partido_fecha ON partido(fecha_partido);
CREATE INDEX idx_partido_division ON partido(id_division);

-- Tabla de clasificaciones
CREATE TABLE IF NOT EXISTS clasificacion(
    id_clasificacion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_equipo INT NOT NULL,
    id_division INT NOT NULL,
    partidos_jugados INT DEFAULT 0,
    partidos_ganados INT DEFAULT 0,
    partidos_empatados INT DEFAULT 0,
    partidos_perdidos INT DEFAULT 0,
    goles_a_favor INT DEFAULT 0,
    goles_en_contra INT DEFAULT 0,
    diferencia_goles INT DEFAULT 0,
    puntos INT DEFAULT 0,
    activo_clasificacion BOOLEAN DEFAULT 1,
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo),
    FOREIGN KEY (id_division) REFERENCES division(id_division)
);

-- Índices para clasificaciones
CREATE INDEX idx_clasificacion_division ON clasificacion(id_division);
CREATE INDEX idx_clasificacion_puntos ON clasificacion(puntos DESC);
CREATE INDEX idx_usuario_mail ON usuario(usuario_mail);
