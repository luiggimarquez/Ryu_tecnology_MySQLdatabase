-- CREATE USER nos permite crear los usuarios en la tabla MYSQL

DROP USER IF EXISTS usuario1@localhost; -- Por prevención eliminamos si existe antes un usuario igual
CREATE USER IF NOT EXISTS usuario1@localhost IDENTIFIED BY 'ejemplo123'; -- Creamos el usuario1 y le colocamos password, para la parte 1 del desafio

DROP USER IF EXISTS usuario2@localhost;
CREATE USER IF NOT EXISTS usuario2@localhost identified by 'example123'; -- Creamos el usuario2 y le colocamos password, para la parte 2 del desafio

DROP USER IF EXISTS usuarioprueba@localhost;
CREATE USER IF NOT EXISTS superuser@localhost identified by 'abc123'; -- usuario extra al desafio, para otras demostraciones

DROP USER IF EXISTS usuarioprueba2@localhost;
CREATE USER IF NOT EXISTS usuarioprueba2@localhost identified by 'abc123'; -- usuario extra al desafio, para otras demostraciones


-- Asignación de permisos

GRANT SELECT ON ryu_technology.* TO usuario1@localhost; -- Asignamos al usuario1 acceso de lectura - Select- en todo nuestro schema Ryu_Technology
SHOW GRANTS FOR usuario1@localhost; -- Mostramos por pantalla los permisos que el usuario tiene

GRANT SELECT,INSERT, UPDATE ON ryu_technology.* TO usuario2@localhost; -- Asignamos a usuario2 los permisos de lectura, inserción y modificación - Select, Insert, Update - en todas las tablas de nuestro esquema
SHOW GRANTS FOR usuario2@localhost;  -- Mostramos por pantalla los permisos que el usuario tiene

-- Otras pruebas

ALTER USER superuser@localhost identified by 'password123'; -- cambiamos el password del usuario
RENAME USER superuser@localhost TO usuarioprueba@localhost; -- cambiamos el nombre del usuario
GRANT ALL ON ryu_technology.* TO usuarioprueba@localhost; -- da permisos a todas las tablas el schema Ryu_technology con todos los atributos
GRANT ALL ON *.* TO usuarioprueba2@localhost; -- da permisos a todos los schemas con todas sus tablas y atributos
FLUSH PRIVILEGES; -- Actualiza la tabla de privilegios

SHOW GRANTS FOR usuarioprueba@localhost; -- Muestra permisos Usuarioprueba
SHOW GRANTS FOR usuarioprueba2@localhost; -- Muestra permisos Usuarioprueba2


REVOKE ALL PRIVILEGES, GRANT OPTION -- para quitar todos los permisos sin borrar el usuarioprueba
FROM usuarioprueba@localhost;
SHOW GRANTS FOR usuarioprueba@localhost;


