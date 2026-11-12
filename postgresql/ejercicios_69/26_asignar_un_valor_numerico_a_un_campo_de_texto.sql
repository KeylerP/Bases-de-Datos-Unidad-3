-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 26/69: Asignar un valor numérico a un campo de texto
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 44.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo SET titulo = 12345 WHERE id_articulo = 3 RETURNING *;
