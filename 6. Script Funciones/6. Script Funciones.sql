USE RYU_TECHNOLOGY;

DROP FUNCTION IF EXISTS FN_CONSULTA_MARCA;
DELIMITER $$
CREATE FUNCTION FN_CONSULTA_MARCA(MARCAS VARCHAR(20))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN 
DECLARE CANTIDADES INT;
DECLARE ARTICULOS INT;
SELECT SUM(CANTIDAD) INTO CANTIDADES FROM PRODUCTO
WHERE MARCA = MARCAS ;
SELECT COUNT(NOMBRE) INTO ARTICULOS FROM PRODUCTO
WHERE MARCA = MARCAS ;
RETURN CONCAT('LA MARCA CONSULTADA: ', MARCAS,' TIENE DISPONIBLES: ', CANTIDADES, ' ARTICULOS, DISTRIBUIDOS ENTRE: ',ARTICULOS, ' ARTICULOS');
END$$
DELIMITER ;



DROP FUNCTION IF EXISTS FN_IVA_POR_CATEGORIA_COMPRA;
DELIMITER $$
CREATE FUNCTION FN_IVA_POR_CATEGORIA_COMPRA(CATEGORY VARCHAR(20), IVA DECIMAL(4,2))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN 
DECLARE CONSULTA_CATEGORIA INT;
DECLARE ARTICULOS INT;
DECLARE RESPUESTA INT;
SELECT ID_CATEGORIA INTO CONSULTA_CATEGORIA FROM CATEGORIA
WHERE NOMBRE_CATEGORIA = CATEGORY;
SELECT SUM(CANTIDAD_COMPRADA*PRECIO) INTO ARTICULOS FROM COMPRA
WHERE CATEGORIA = CONSULTA_CATEGORIA;
SET RESPUESTA = ARTICULOS*(IVA*0.01) + ARTICULOS;
RETURN RESPUESTA;

END$$
DELIMITER ;
