-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 38/69: Probar una condición con AND
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 59.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = 'Actualizado AND',
    anio_publicacion = 2031
WHERE id_articulo = 3 AND id_articulo = 4
RETURNING *;
