-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 17/69: Intentar modificar una clave foránea hacia un valor
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 35.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- ATENCION: Prueba intencional: clave foránea inexistente; debe rechazarla si la fila objetivo existe.

-- SQL del informe:
UPDATE palabra_clave
SET id_articulo = 9999
WHERE id_articulo = 200
  AND palabra = 'normalizacion';
