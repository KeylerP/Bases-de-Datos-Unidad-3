-- BASES DE DATOS 1 | Unidad 3 | CEA bibliografico | PostgreSQL
-- Base esperada: cea_bibliografia (seleccionarla en Query Tool)
-- Requisitos: ya ejecutaste todas las inserciones y las primeras 7 actualizaciones.
-- Ejecuta CADA BLOQUE por separado (selecciona el bloque y F5).
-- Las sentencias RETURNING muestran el resultado directo de cada cambio.
-- Guarda una captura de pantalla por bloque donde se vean SQL y resultado.
-- ATENCION: los DELETE / TRUNCATE son destructivos. Haz respaldo antes.
-- Los ejercicios de restriccion (RESTRICT) aparecen comentados intencionalmente.
-- No cambies de base de datos a 'xyz' mientras ejecutas este archivo.

SELECT current_database() AS base_de_datos;

-- ==========================================================
-- 4.2 | Seis actualizaciones restantes (tablas 8 a 13)
-- ==========================================================

-- U08 - ubicacion_copia - UPDATE con subconsulta
UPDATE ubicacion_copia
SET lugar = (
  SELECT 'Despacho de ' || nombre
  FROM investigador
  WHERE id_investigador = 1
)
WHERE id_articulo = 1
RETURNING *;

-- U08b - ubicacion_copia - UPDATE individual
UPDATE ubicacion_copia
SET lugar = 'Estanteria sala 2'
WHERE id_articulo = 2
RETURNING *;

-- U09 - congreso - UPDATE condicional compatible con CHECK
UPDATE congreso
SET pais = 'Portugal'
WHERE id_congreso = 1 AND tipo = 'INTERNACIONAL'
RETURNING *;

-- U10 - revista - UPDATE masivo
UPDATE revista
SET nombre = nombre || ' - Edicion digital'
RETURNING *;

-- U11 - informe_tecnico - UPDATE individual
UPDATE informe_tecnico
SET centro_publicacion = 'Universidad de Cartagena - Ingenieria'
WHERE numero_id = 'IT-001'
RETURNING *;

-- U12 - acta_congreso - reasignar congreso 1 por congreso 3
UPDATE acta_congreso
SET id_congreso = 3
WHERE id_articulo = 2
RETURNING *;

-- U13 - articulo_revista - UPDATE ... FROM con otra tabla
UPDATE articulo_revista AS ar
SET numero_revista = ar.numero_revista + 1
FROM revista AS r
WHERE ar.id_revista = r.id_revista
  AND r.nombre LIKE 'Revista de Ingenieria%'
RETURNING ar.id_articulo, ar.numero_revista, ar.id_revista;

-- ==========================================================
-- 4.3 | Eliminaciones en las 13 tablas
-- ==========================================================

-- D00 - comprobar relaciones antes de borrar (solo SELECT)
SELECT a.id_articulo, a.id_investigador
FROM articulo_autor a
ORDER BY a.id_articulo;
SELECT * FROM acta_congreso ORDER BY id_articulo;

-- D01 - palabra_clave - DELETE parcial (4 registros si se siguio el guion)
DELETE FROM palabra_clave
WHERE palabra LIKE 'postgresql%'
RETURNING *;

-- D02 - tema_interes - DELETE parcial
DELETE FROM tema_interes
WHERE id_investigador = 4
RETURNING *;

-- D03 - ubicacion_copia - DELETE parcial
DELETE FROM ubicacion_copia
WHERE id_articulo = 3
RETURNING *;

-- D04 - informe_tecnico - DELETE parcial
DELETE FROM informe_tecnico
WHERE numero_id = 'IT-001'
RETURNING *;

-- D05 - acta_congreso - DELETE parcial, deja el articulo 2 en congreso 3
DELETE FROM acta_congreso
WHERE id_articulo = 3
RETURNING *;

-- D06 - articulo_revista - DELETE con USING (equivalente a JOIN en MySQL)
DELETE FROM articulo_revista AS ar
USING revista AS r
WHERE ar.id_revista = r.id_revista
  AND r.nombre LIKE 'Revista Colombiana%'
RETURNING ar.id_articulo, ar.numero_revista, ar.id_revista;

-- D07 - colaborador - DELETE con subconsulta
DELETE FROM colaborador
WHERE id_investigador IN (
  SELECT id_investigador
  FROM investigador
  WHERE id_investigador = 7
)
RETURNING *;

-- D08 - Demostraciones opcionales de RESTRICT:
-- EJECUTA CADA DELETE POR SEPARADO SOLO SI DESEAS CAPTURAR LA RESTRICCION.
-- Es normal que fallen; si queda transaccion abortada, ejecuta ROLLBACK.
--
-- DELETE FROM autor WHERE id_investigador = 1;
-- (referenciado por articulo_autor del articulo 1)
--
-- DELETE FROM congreso WHERE id_congreso = 3;
-- (referenciado por acta_congreso del articulo 2)

-- D09 - articulo - DELETE que causa cascada a tablas hijas
DELETE FROM articulo
WHERE id_articulo = 1
RETURNING *;
-- Evidencias despues de la cascada:
SELECT * FROM palabra_clave WHERE id_articulo = 1;
SELECT * FROM ubicacion_copia WHERE id_articulo = 1;
SELECT * FROM articulo_autor WHERE id_articulo = 1;

-- D10 - autor - tras borrar articulo 1, queda sin articulos referenciados
DELETE FROM autor
WHERE id_investigador = 1
RETURNING *;

-- D11 - investigador - cascada hacia colaborador (id 6)
SELECT * FROM colaborador WHERE id_investigador = 6;
DELETE FROM investigador
WHERE id_investigador = 6
RETURNING *;
SELECT * FROM colaborador WHERE id_investigador = 6;

-- D12 - congreso - queda sin actas vinculadas (id 1)
DELETE FROM congreso
WHERE id_congreso = 1
RETURNING *;

-- D13 - revista - tras D06, id 1 no tiene articulos de revista vinculados
DELETE FROM revista
WHERE id_revista = 1
RETURNING *;

-- D14 - articulo_autor - DELETE total, mantiene la estructura de la tabla
DELETE FROM articulo_autor
RETURNING *;
SELECT COUNT(*) AS total_articulo_autor FROM articulo_autor;

-- D15 - vaciado eficiente de dos tablas hijas, sin cascada fuera de ellas
TRUNCATE TABLE articulo_revista, tema_interes RESTART IDENTITY;
SELECT COUNT(*) AS total_articulo_revista FROM articulo_revista;
SELECT COUNT(*) AS total_tema_interes FROM tema_interes;

-- D16 - recuento final: se conservan registros en otras tablas
SELECT 'investigador' AS tabla, COUNT(*) AS registros FROM investigador
UNION ALL SELECT 'autor', COUNT(*) FROM autor
UNION ALL SELECT 'colaborador', COUNT(*) FROM colaborador
UNION ALL SELECT 'tema_interes', COUNT(*) FROM tema_interes
UNION ALL SELECT 'articulo', COUNT(*) FROM articulo
UNION ALL SELECT 'palabra_clave', COUNT(*) FROM palabra_clave
UNION ALL SELECT 'articulo_autor', COUNT(*) FROM articulo_autor
UNION ALL SELECT 'ubicacion_copia', COUNT(*) FROM ubicacion_copia
UNION ALL SELECT 'congreso', COUNT(*) FROM congreso
UNION ALL SELECT 'revista', COUNT(*) FROM revista
UNION ALL SELECT 'informe_tecnico', COUNT(*) FROM informe_tecnico
UNION ALL SELECT 'acta_congreso', COUNT(*) FROM acta_congreso
UNION ALL SELECT 'articulo_revista', COUNT(*) FROM articulo_revista
ORDER BY tabla;
