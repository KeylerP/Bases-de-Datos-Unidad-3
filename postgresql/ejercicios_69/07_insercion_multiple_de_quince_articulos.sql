-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 07/69: Inserción múltiple de quince artículos
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 25.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
INSERT INTO articulo (titulo, anio_publicacion) VALUES
('Introduccion a los sistemas de informacion', 2010),
('Diseno de bases de datos', 2011),
('Modelos entidad relacion', 2012),
('Fundamentos de SQL', 2013),
('Gestion de informacion', 2014),
('Normalizacion de datos', 2015),
('Consultas avanzadas', 2016),
('Integridad referencial', 2017),
('Administracion de servidores', 2018),
('Seguridad en bases de datos', 2019),
('Optimizacion de consultas', 2020),
('Transacciones SQL', 2021),
('Procedimientos almacenados', 2022),
('Indices y rendimiento', 2023),
('Respaldo y recuperacion de datos', 2024)
RETURNING *;
