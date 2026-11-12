-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 62/69: Calcular definitiva y promedio
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 83.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
UPDATE TablaY
SET nota_definitiva = ROUND(
    COALESCE(nota1, 0) * 0.20 +
    COALESCE(nota2, 0) * 0.20 +
    COALESCE(nota3, 0) * 0.60, 3),
    promedio = ROUND((
    COALESCE(nota1, 0) +
    COALESCE(nota2, 0) +
    COALESCE(nota3, 0)) / 3.0, 3)
RETURNING *;
