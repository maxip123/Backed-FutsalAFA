-- 1. Buscamos y eliminamos automáticamente la Foreign Key
DELIMITER $$
CREATE PROCEDURE DropPlayoffFK()
BEGIN
    DECLARE fk_name VARCHAR(100);
    
    SELECT CONSTRAINT_NAME INTO fk_name
    FROM information_schema.KEY_COLUMN_USAGE 
    WHERE TABLE_NAME = 'llave_playoff' 
      AND COLUMN_NAME = 'id_partido' 
      AND TABLE_SCHEMA = DATABASE() LIMIT 1;
      
    IF fk_name IS NOT NULL THEN
        SET @s = CONCAT('ALTER TABLE llave_playoff DROP FOREIGN KEY ', fk_name);
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END $$
DELIMITER ;

CALL DropPlayoffFK();
DROP PROCEDURE DropPlayoffFK();

-- 2. Actualizamos la estructura de la tabla eliminando id_partido y agregando los nuevos campos
ALTER TABLE llave_playoff
DROP COLUMN id_partido,
ADD COLUMN goles_local INT DEFAULT NULL,
ADD COLUMN goles_visitante INT DEFAULT NULL,
ADD COLUMN estado_partido INT DEFAULT 0;
