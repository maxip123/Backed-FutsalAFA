-- ============================================================
-- Migración: Eliminar historial_torneo y consolidar en division
-- ============================================================
-- Ejecutar este script ANTES de desplegar el nuevo backend.
-- No hay datos que migrar — se aplican solo los cambios estructurales.
-- ============================================================

USE futsalAfaDB;

-- PASO 1: Agregar columnas de snapshot a la tabla division
ALTER TABLE division
  ADD COLUMN nombre_campeon           VARCHAR(100) DEFAULT NULL,
  ADD COLUMN logo_campeon             VARCHAR(250) DEFAULT NULL,
  ADD COLUMN id_equipo_campeon        INT          DEFAULT NULL,
  ADD COLUMN nombre_goleador          VARCHAR(100) DEFAULT NULL,
  ADD COLUMN goles_goleador           INT          DEFAULT NULL,
  ADD COLUMN nombre_equipo_goleador   VARCHAR(100) DEFAULT NULL,
  ADD COLUMN id_jugador_goleador      INT          DEFAULT NULL,
  ADD COLUMN anio_torneo              YEAR         DEFAULT NULL;

-- PASO 2: Eliminar tabla historial_torneo
-- (sus índices se eliminan automáticamente junto con la tabla)
DROP TABLE IF EXISTS historial_torneo;