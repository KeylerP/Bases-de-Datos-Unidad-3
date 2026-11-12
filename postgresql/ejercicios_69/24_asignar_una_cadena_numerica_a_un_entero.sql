-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 24/69: Asignar una cadena numérica a un entero
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 42.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo SET anio_publicacion = '2028' WHERE id_articulo = 3 RETURNING *;
