-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 36/69: Actualizar varios registros con OR
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 57.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = 'Actualizado OR ' || id_articulo,
    anio_publicacion = 2030
WHERE id_articulo = 3 OR id_articulo = 4
RETURNING *;
