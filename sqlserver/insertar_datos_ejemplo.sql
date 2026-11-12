-- CEA bibliografico | Datos de prueba para SQL Server 2025
-- Compatible con las 13 tablas de Crear_13_tablas_CEA_bibliografia_SQL_Server.sql
-- Insercion demostrativa en BD local. No borra ni modifica registros existentes.
-- Si la base ya contiene datos, se omite la carga para prevenir duplicados.
USE [cea_bibliografia];
GO
SET NOCOUNT ON;

IF EXISTS (SELECT 1 FROM dbo.investigador)
   OR EXISTS (SELECT 1 FROM dbo.articulo)
   OR EXISTS (SELECT 1 FROM dbo.congreso)
   OR EXISTS (SELECT 1 FROM dbo.revista)
BEGIN
    PRINT N'Ya hay registros de prueba o datos existentes. No se insertó nada para evitar duplicados.';
END
ELSE
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        SET IDENTITY_INSERT dbo.investigador ON;
        INSERT INTO dbo.investigador (id_investigador, nombre, apellido, correo) VALUES
        (1, N'Andrea', N'Rojas', N'andrea.rojas@example.org'),
        (2, N'Maria', N'Lopez', N'maria.lopez@example.org'),
        (3, N'Jorge', N'Perez', N'jorge.perez@example.org'),
        (4, N'Laura', N'Gomez', N'laura.gomez@example.org'),
        (5, N'Carlos', N'Ruiz', N'carlos.ruiz@example.org'),
        (6, N'Sofia', N'Mejia', N'sofia.mejia@example.org'),
        (7, N'Andres', N'Lopez', N'andres.lopez@example.org');
        SET IDENTITY_INSERT dbo.investigador OFF;

        INSERT INTO dbo.autor (id_investigador) VALUES (1), (2), (3), (4);
        INSERT INTO dbo.colaborador (id_investigador) VALUES (5), (6), (7);
        INSERT INTO dbo.tema_interes (id_investigador, tema) VALUES
        (1, N'Bases de datos'),
        (1, N'Ingenieria de software'),
        (2, N'Inteligencia artificial'),
        (3, N'Redes'),
        (4, N'Seguridad');

        SET IDENTITY_INSERT dbo.articulo ON;
        INSERT INTO dbo.articulo (id_articulo, titulo, anio_publicacion) VALUES
        (1, N'Modelado relacional avanzado', NULL),
        (2, N'Normalizacion en la practica', 2025),
        (3, N'Indices y rendimiento', 2024),
        (4, N'Respaldos en PostgreSQL', 2023),
        (5, N'Triggers y auditoria', 2026);
        SET IDENTITY_INSERT dbo.articulo OFF;

        INSERT INTO dbo.palabra_clave (id_articulo, palabra) VALUES
        (1, N'relacional'),
        (1, N'sql'),
        (2, N'normalizacion'),
        (2, N'postgresql'),
        (3, N'indices'),
        (3, N'postgresql'),
        (4, N'postgresql'),
        (4, N'respaldo'),
        (5, N'disparadores'),
        (5, N'postgresql');

        INSERT INTO dbo.articulo_autor (id_articulo, id_investigador) VALUES
        (1, 1), (2, 2), (3, 3), (4, 4), (5, 1);

        INSERT INTO dbo.ubicacion_copia (id_articulo, lugar) VALUES
        (1, N'Estanteria del laboratorio'),
        (2, N'Despacho de investigacion'),
        (3, N'Biblioteca universitaria');

        SET IDENTITY_INSERT dbo.congreso ON;
        INSERT INTO dbo.congreso (id_congreso, tipo, pais) VALUES
        (1, N'INTERNACIONAL', N'España'),
        (2, N'NACIONAL', NULL),
        (3, N'INTERNACIONAL', N'Mexico');
        SET IDENTITY_INSERT dbo.congreso OFF;

        SET IDENTITY_INSERT dbo.revista ON;
        INSERT INTO dbo.revista (id_revista, nombre) VALUES
        (1, N'Revista Colombiana de Computacion'),
        (2, N'Revista de Ingenieria');
        SET IDENTITY_INSERT dbo.revista OFF;

        INSERT INTO dbo.informe_tecnico (id_articulo, numero_id, centro_publicacion) VALUES
        (1, N'IT-001', N'Universidad de Cartagena');

        INSERT INTO dbo.acta_congreso (id_articulo, id_congreso) VALUES
        (2, 1), (3, 2);

        INSERT INTO dbo.articulo_revista (id_articulo, numero_revista, id_revista) VALUES
        (4, 12, 1), (5, 3, 2);

        COMMIT TRANSACTION;
        PRINT N'Datos de prueba insertados correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

-- Evidencia: numero de registros en cada una de las 13 tablas.
SELECT N'investigador' AS tabla, COUNT(*) AS registros FROM dbo.investigador
UNION ALL SELECT N'autor', COUNT(*) FROM dbo.autor
UNION ALL SELECT N'colaborador', COUNT(*) FROM dbo.colaborador
UNION ALL SELECT N'tema_interes', COUNT(*) FROM dbo.tema_interes
UNION ALL SELECT N'articulo', COUNT(*) FROM dbo.articulo
UNION ALL SELECT N'palabra_clave', COUNT(*) FROM dbo.palabra_clave
UNION ALL SELECT N'articulo_autor', COUNT(*) FROM dbo.articulo_autor
UNION ALL SELECT N'ubicacion_copia', COUNT(*) FROM dbo.ubicacion_copia
UNION ALL SELECT N'congreso', COUNT(*) FROM dbo.congreso
UNION ALL SELECT N'revista', COUNT(*) FROM dbo.revista
UNION ALL SELECT N'informe_tecnico', COUNT(*) FROM dbo.informe_tecnico
UNION ALL SELECT N'acta_congreso', COUNT(*) FROM dbo.acta_congreso
UNION ALL SELECT N'articulo_revista', COUNT(*) FROM dbo.articulo_revista
ORDER BY tabla;
GO

-- Evidencia: consulta relacional con JOIN.
SELECT a.id_articulo, a.titulo, i.nombre, i.apellido
FROM dbo.articulo AS a
INNER JOIN dbo.articulo_autor AS aa ON aa.id_articulo = a.id_articulo
INNER JOIN dbo.investigador AS i ON i.id_investigador = aa.id_investigador
ORDER BY a.id_articulo;
GO
