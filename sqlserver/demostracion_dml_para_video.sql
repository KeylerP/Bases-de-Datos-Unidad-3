-- Demostración DML en SQL Server, CEA Bibliografía.
-- EJECUTAR POR BLOQUES en SSMS para mostrar las evidencias.
-- NO sustituye la resolución de los 69 ejercicios del documento.
USE [cea_bibliografia];
GO

-- Mantener abierta la transacción durante la demostración.
BEGIN TRANSACTION;
GO

-- INSERT 1
INSERT INTO dbo.investigador (nombre, apellido, correo)
VALUES (N'Prueba', N'Uno', N'video_prueba_1@example.org');
GO

-- INSERT 2
INSERT INTO dbo.investigador (nombre, apellido, correo)
VALUES (N'Prueba', N'Dos', N'video_prueba_2@example.org');
GO

SELECT id_investigador, nombre, apellido, correo
FROM dbo.investigador
WHERE correo LIKE 'video_prueba_%@example.org';
GO

-- UPDATE 1
UPDATE dbo.investigador
SET apellido = N'Actualizado Uno'
WHERE correo = N'video_prueba_1@example.org';
GO

-- UPDATE 2
UPDATE dbo.investigador
SET apellido = N'Actualizado Dos'
WHERE correo = N'video_prueba_2@example.org';
GO

SELECT id_investigador, nombre, apellido, correo
FROM dbo.investigador
WHERE correo LIKE 'video_prueba_%@example.org';
GO

-- DELETE 1
DELETE FROM dbo.investigador
WHERE correo = N'video_prueba_1@example.org';
GO

-- DELETE 2
DELETE FROM dbo.investigador
WHERE correo = N'video_prueba_2@example.org';
GO

SELECT id_investigador, nombre, apellido, correo
FROM dbo.investigador
WHERE correo LIKE 'video_prueba_%@example.org';
GO

-- Termina sin alterar permanentemente los datos del CEA.
ROLLBACK TRANSACTION;
GO
