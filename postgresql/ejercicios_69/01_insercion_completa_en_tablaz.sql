-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 01/69: Inserción completa en TablaZ
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 19.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
INSERT INTO palabra_clave VALUES (2, 'actividad_dml_unidad3') RETURNING *;
