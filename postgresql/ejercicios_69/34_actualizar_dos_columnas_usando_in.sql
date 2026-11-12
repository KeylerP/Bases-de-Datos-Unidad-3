-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 34/69: Actualizar dos columnas usando IN
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 55.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = 'Actualizado IN ' || id_articulo,
    anio_publicacion = 2029
WHERE id_articulo IN (3, 4, 5, 6, 7)
RETURNING *;
