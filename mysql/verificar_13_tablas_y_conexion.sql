-- MySQL Workbench o NetBeans JDBC | consulta sin modificaciones
SELECT DATABASE() AS base_actual, CURRENT_USER() AS usuario_conectado;
SELECT TABLE_NAME AS tabla
FROM information_schema.tables
WHERE table_schema = '7502520050_21_bibliografia'
  AND table_type = 'BASE TABLE'
ORDER BY TABLE_NAME;
SELECT COUNT(*) AS total_tablas
FROM information_schema.tables
WHERE table_schema = '7502520050_21_bibliografia'
  AND table_type = 'BASE TABLE';
