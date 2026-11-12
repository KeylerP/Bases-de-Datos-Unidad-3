-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 64/69: Convertir las columnas de texto a mayúsculas
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 85.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE TablaY
SET nombre = UPPER(nombre),
    apellidos = UPPER(apellidos),
    asignatura = UPPER(asignatura),
    mensaje = UPPER(mensaje)
RETURNING *;
