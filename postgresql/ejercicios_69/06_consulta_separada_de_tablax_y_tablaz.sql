-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 06/69: Consulta separada de TablaX y TablaZ
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 24.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
SELECT * FROM articulo ORDER BY id_articulo;
SELECT * FROM palabra_clave ORDER BY id_articulo, palabra;
