-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 46/69: Actualizar por intervalo de identificadores
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 67.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = titulo || ' - intervalo',
    anio_publicacion = anio_publicacion + 1
WHERE id_articulo BETWEEN 8 AND 10
RETURNING *;
