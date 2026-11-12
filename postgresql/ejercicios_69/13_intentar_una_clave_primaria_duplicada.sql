-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 13/69: Intentar una clave primaria duplicada
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 31.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- ATENCION: Prueba intencional: clave primaria duplicada; el resultado depende del estado de datos.

-- SQL del informe:
INSERT INTO articulo (id_articulo, titulo, anio_publicacion)
VALUES (2, 'Articulo duplicado', 2026);
