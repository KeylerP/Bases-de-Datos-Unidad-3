-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 09/69: Inserción sin aportar todos los valores
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 27.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- REVISION: En el PDF la sentencia omite un valor sin lista de columnas; en la tabla de 3 columnas produce error. Se conserva como comentario y se incluye variante válida con columnas explícitas.

-- SQL del informe:
-- INSERT INTO articulo VALUES (DEFAULT, 'Articulo con fecha pendiente') RETURNING *;

-- ADAPTACION REPRODUCIBLE (no identica al PDF; comprobar antes de ejecutar):
INSERT INTO articulo (titulo) VALUES ('Articulo con fecha pendiente') RETURNING *;
