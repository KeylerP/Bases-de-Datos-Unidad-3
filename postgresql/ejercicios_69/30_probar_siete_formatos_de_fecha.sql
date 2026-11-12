-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 30/69: Probar siete formatos de fecha
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 48.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- ATENCION: Siete pruebas de fecha documentadas en el informe; ejecutar CADA INSERT por separado. Algunos fallan intencionadamente.

-- SQL del informe:
-- EJECUTA SOLO UNA SENTENCIA POR VEZ. En el informe algunas fallaron.
-- Pruebas realizadas por separado; algunas producen error:
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha A', 2023, '23-12-10');
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha B', 2023, '01/14/2023');
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha C', 2023, '-10/08/2023');
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha D', 2023, '12/30-2023');
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha E', 2023, '12-30-2023');
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha F', 2023, '2023-50-20');
INSERT INTO articulo (titulo, anio_publicacion, fecha_registro)
VALUES ('Prueba fecha G', 2023, '2023-06-21');
