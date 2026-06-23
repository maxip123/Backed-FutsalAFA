-- Migración: agregar fecha_inicio y fecha_fin a la tabla division
-- Ejecutar SOLO si ya tenés la base de datos creada y no querés recrearla desde schema.sql
-- Si vas a importar el schema.sql desde cero, este archivo NO es necesario.

ALTER TABLE division
  ADD COLUMN fecha_inicio DATE DEFAULT NULL,
  ADD COLUMN fecha_fin    DATE DEFAULT NULL;
