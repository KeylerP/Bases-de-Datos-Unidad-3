-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 50/69: Actualizar títulos que terminan en un texto
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 71.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = titulo || ' - final',
    anio_publicacion = anio_publicacion + 1
WHERE titulo LIKE '% - intervalo'
RETURNING *;
