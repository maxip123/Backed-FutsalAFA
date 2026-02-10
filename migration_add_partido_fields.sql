-- Script de migración: Agregar campos nombre_partido y afecta_clasificacion
-- Sistema de gestión de torneos de fútbol sala

USE futsalAfaDB;

-- Agregar campo nombre_partido (opcional, para identificar partidos como "Fecha 19", "Semifinal", etc.)
ALTER TABLE partido 
ADD COLUMN nombre_partido VARCHAR(100) DEFAULT NULL AFTER id_division;

-- Agregar campo afecta_clasificacion (controla si el partido suma puntos a la tabla)
ALTER TABLE partido 
ADD COLUMN afecta_clasificacion BOOLEAN DEFAULT 1 AFTER nombre_partido;

-- Verificar cambios
DESCRIBE partido;
