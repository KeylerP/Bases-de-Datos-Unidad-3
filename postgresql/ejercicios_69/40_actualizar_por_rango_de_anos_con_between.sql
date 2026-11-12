-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 40/69: Actualizar por rango de años con BETWEEN
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 61.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = titulo || ' - rango',
    anio_publicacion = anio_publicacion + 1
WHERE anio_publicacion BETWEEN 2020 AND 2024
RETURNING *;
