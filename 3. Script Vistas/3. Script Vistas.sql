USE RYU_TECHNOLOGY;

-- CREACION DE LAS 5 VISTAS
-- PRE-COMPRA MUESTRA EN CONTENIDO DEL CARRITO CON EL CONTENIDO DEL WISHLIST
DROP VIEW IF EXISTS VW_PRE_COMPRA;
CREATE VIEW VW_PRE_COMPRA AS
SELECT C.ID_PRODUCTO, C.NOMBRE, C.MARCA, W.ID_PRODUCTO_WISHLIST FROM `CARRITO` AS C
LEFT OUTER JOIN `WISHLIST` AS W ON C.ID_PRODUCTO_WISHLIST = W.ID_PRODUCTO_WISHLIST
UNION
SELECT C.ID_PRODUCTO, C.NOMBRE, C.MARCA, W.ID_PRODUCTO_WISHLIST FROM CARRITO AS C
RIGHT OUTER JOIN WISHLIST AS W ON C.ID_PRODUCTO_WISHLIST = W.ID_PRODUCTO_WISHLIST;

-- FACTURA DETALLES MUESTRA LOS ARTICULOS COMPRADOS CON LOS DATOS DEL CLIENTE
DROP VIEW IF EXISTS VW_FACTURA_DETALLES;
CREATE VIEW VW_FACTURA_DETALLES AS
SELECT CO.ID_COMPRA, CO.ID_PRODUCTO_AGREGADO, CA.NOMBRE, CO.CANTIDAD_COMPRADA, CO.MARCA, CO.PRECIO, F.ID_FACTURACION, U.NOMBRE AS CLIENTE, U.APELLIDO, F.FECHA_COMPRA
FROM COMPRA AS CO
INNER JOIN CARRITO AS CA ON CO.ID_PRODUCTO_AGREGADO = CA.ID_PRODUCTO_AGREGADO
INNER JOIN FACTURACION AS F ON CO.ID_COMPRA = F.ID_COMPRA
INNER JOIN USUARIO AS U ON U.ID_USUARIO = F.ID_USUARIO;

-- FACTURA POR USUARIO MUESTRA LOS DATOS DEL USUARIO Y EL ID DE LAS FACTURAS QUE ESTE TENGA REGISTRADAS
DROP VIEW IF EXISTS VW_FACTURA_POR_USUARIO;
CREATE VIEW VW_FACTURA_POR_USUARIO AS
SELECT U.ID_USUARIO, U.NOMBRE, U.APELLIDO, C.CANTIDAD_COMPRADA*C.PRECIO AS MONTO_TOTAL_PRODUCTO, F.ID_FACTURACION, F.FECHA_COMPRA
FROM USUARIO AS U
INNER JOIN FACTURACION AS F ON U.ID_USUARIO = F.ID_USUARIO
INNER JOIN COMPRA AS C ON C.ID_COMPRA = F.ID_COMPRA;

-- CARD_DE_PRODUCTO MUESTRA LOS DATOS POR ARTICULOS QUE SE VISUALIZARAN EN LA WEB
DROP VIEW IF EXISTS VW_CARD_DE_PRODUCTO;
CREATE VIEW VW_CARD_DE_PRODUCTO AS
SELECT IMAGEN, NOMBRE, MARCA, PRECIO, CATEGORIA
FROM PRODUCTO;

-- PRECIO TOTAL MUESTRA LOS ARTICULOS SON SU PRECIO BASE MAS EL PRECIO CON IVA
DROP VIEW IF EXISTS VW_PRECIO_TOTAL;
CREATE VIEW VW_PRECIO_TOTAL AS
SELECT NOMBRE, PRECIO, PRECIO*0.21+PRECIO AS COSTO_TOTAL, CANTIDAD AS STOCK
FROM PRODUCTO;

/*
SELECT * FROM VW_PRE_COMPRA;
SELECT * FROM VW_FACTURA_DETALLES;
SELECT * FROM VW_FACTURA_POR_USUARIO;
SELECT * FROM VW_CARD_DE_PRODUCTO;
SELECT * FROM VW_PRECIO_TOTAL;
*/
