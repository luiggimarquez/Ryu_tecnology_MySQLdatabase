USE RYU_TECHNOLOGY;
SET SQL_SAFE_UPDATES = 0; -- Permite borrar datos en la tabla sin error
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilita el error de borrar datos para FK

-- Primera tabla: Tabla PRODUCTO

/* INSERT INTO `producto` (`id_producto`,`nombre`,`marca`,`tipo`,`categoria`,`precio`,`cantidad`,`imagen`,`id_categoria`) VALUES (30,'Sws14-24','Sonicwall','LAN-Access','4',1500,25,'/Sws14-24.jpg.jpg',4);
INSERT INTO `producto` (`id_producto`,`nombre`,`marca`,`tipo`,`categoria`,`precio`,`cantidad`,`imagen`,`id_categoria`) VALUES (31,'Sws12-10','Sonicwall','LAN-Access','4',1600,25,'/Sws12-10.jpg',4);
INSERT INTO `producto` (`id_producto`,`nombre`,`marca`,`tipo`,`categoria`,`precio`,`cantidad`,`imagen`,`id_categoria`) VALUES (32,'Sws12-24','Sonicwall','LAN-Access','4',2500,25,'/Sws12-24jpg',4);
INSERT INTO `producto` (`id_producto`,`nombre`,`marca`,`tipo`,`categoria`,`precio`,`cantidad`,`imagen`,`id_categoria`) VALUES (33,'Sws12-48','Sonicwall','LAN-Access','4',2500,25,'/Sws12-48.jpg',4); */

SELECT @@autocommit; -- Verificamos el estado del autocommit
SET @@autocommit = 0; -- Deshabilitamos el autocommit
START TRANSACTION; -- comienzo transaction
DELETE FROM RYU_TECHNOLOGY.PRODUCTO -- Borramos 4 elementos de la tabla Producto
WHERE ID_PRODUCTO BETWEEN 30 AND 33;
-- ROLLBACK
COMMIT; -- hacemos commit

-- Segunda tabla: Tabla CATEGORIA

SELECT @@autocommit; -- Verificamos el estado del autocommit
SET @@autocommit = 0; -- Deshabilitamos el autocommit
START TRANSACTION;
INSERT INTO `categoria` (`nombre_categoria`) VALUES ('Laptop');
INSERT INTO `categoria` (`nombre_categoria`) VALUES ('SDWAN Router');
INSERT INTO `categoria` (`nombre_categoria`) VALUES  ('Biometrico');
INSERT INTO `categoria` (`nombre_categoria`) VALUES ('ControlAcceso');
SAVEPOINT SP1;
INSERT INTO `categoria` (`nombre_categoria`) VALUES ('Sensor Prox');
INSERT INTO `categoria` (`nombre_categoria`) VALUES ('PLC');
INSERT INTO `categoria` (`nombre_categoria`) VALUES  ('Automatizacion');
INSERT INTO `categoria` (`nombre_categoria`) VALUES ('Telefonia IP');
SAVEPOINT SP2;
-- RELEASE SAVEPOINT SP1

SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;
