-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 32/69: Actualizar dos columnas filtrando una clave concreta
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 53.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = 'Actualizado por clave',
    anio_publicacion = 2029
WHERE id_articulo = 3
RETURNING *;
