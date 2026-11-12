-- PostgreSQL pgAdmin / VS Code SQLTools | consulta sin modificaciones
SELECT current_database() AS base_actual, current_user AS usuario_conectado;
SELECT table_name AS tabla
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
ORDER BY table_name;
SELECT COUNT(*) AS total_tablas
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
-- Modelo original: 13. Si existe TablaY de Unidad 3, normalmente hay 14.
