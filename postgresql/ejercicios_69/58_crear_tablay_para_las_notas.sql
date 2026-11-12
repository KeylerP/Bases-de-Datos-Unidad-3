-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 58/69: Crear TablaY para las notas
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 79.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- REVISION: Confirma la tabla destino y las precisiones NUMERIC frente a tu esquema en producción.

-- SQL del informe:
CREATE TABLE IF NOT EXISTS TablaY (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha TIMESTAMP,
    nombre VARCHAR(80),
    apellidos VARCHAR(80),
    asignatura VARCHAR(120),
    nota1 NUMERIC(5,2),
    nota2 NUMERIC(5,2),
    nota3 NUMERIC(5,2),
    nota_definitiva NUMERIC(6,3),
    promedio NUMERIC(6,3),
    mensaje TEXT
);
