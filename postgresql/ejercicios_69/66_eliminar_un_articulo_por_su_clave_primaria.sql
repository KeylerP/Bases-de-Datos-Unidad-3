-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 66/69: Eliminar un artículo por su clave primaria
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 87.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- REVISION: Borrado destructivo; puede cascadar a tablas hijas. Ejecutar solo en copia de práctica.
-- Haz una copia de seguridad antes; no ejecutar en la base de trabajo.

-- SQL del informe:
DELETE FROM articulo WHERE id_articulo = 29 RETURNING *;
