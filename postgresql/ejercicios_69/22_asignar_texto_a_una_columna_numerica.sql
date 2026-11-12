-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 22/69: Asignar texto a una columna numérica
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 40.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- ATENCION: Prueba intencional: texto no convertible a número.

-- SQL del informe:
UPDATE articulo SET anio_publicacion = 'texto_invalido' WHERE id_articulo = 3;
