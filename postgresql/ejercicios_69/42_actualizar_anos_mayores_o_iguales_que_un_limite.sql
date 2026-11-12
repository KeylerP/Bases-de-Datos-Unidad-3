-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 42/69: Actualizar años mayores o iguales que un límite
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 63.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = titulo || ' - mayor o igual',
    anio_publicacion = anio_publicacion + 1
WHERE anio_publicacion >= 2026
RETURNING *;
