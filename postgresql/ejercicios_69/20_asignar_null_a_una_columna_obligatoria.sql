-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 20/69: Asignar NULL a una columna obligatoria
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 38.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- ATENCION: Prueba intencional: intenta asignar NULL a titulo NOT NULL.

-- SQL del informe:
UPDATE articulo SET titulo = NULL WHERE id_articulo = 3;
