-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 44/69: Actualizar por desigualdad de una fecha
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 65.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE articulo
SET titulo = titulo || ' - fecha diferente',
    anio_publicacion = COALESCE(anio_publicacion, 2023) + 1
WHERE fecha_registro <> DATE '2023-06-21'
RETURNING *;
