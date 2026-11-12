-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 56/69: Actualizar filas con un dato no nulo
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 77.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- REVISION: El propio informe marca el SQL orientativo pendiente de contrastar con la evidencia final.

-- SQL del informe:
UPDATE articulo
SET titulo = titulo || ' - con fecha',
    anio_publicacion = COALESCE(anio_publicacion, 2023) + 1
WHERE fecha_registro IS NOT NULL
RETURNING *;
