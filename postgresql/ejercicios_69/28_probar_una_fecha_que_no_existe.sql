-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 28/69: Probar una fecha que no existe
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 46.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- ATENCION: Prueba intencional: fecha 2023-02-29 no existe. ALTER TABLE previo puede completarse.

-- SQL del informe:
ALTER TABLE articulo ADD COLUMN IF NOT EXISTS fecha_registro DATE;
INSERT INTO articulo (id_articulo, titulo, anio_publicacion, fecha_registro)
VALUES (DEFAULT, 'Prueba fecha imposible', 2023, '2023-02-29');
