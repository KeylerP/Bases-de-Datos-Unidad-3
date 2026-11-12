-- CEA bibliografico | SQL Server 2025 Express
-- Adaptacion del esquema de 13 tablas usado en PostgreSQL.
-- No elimina ni modifica datos existentes.

USE [cea_bibliografia];
GO

IF OBJECT_ID(N'dbo.investigador', N'U') IS NULL
CREATE TABLE dbo.investigador (
  id_investigador INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(80) NOT NULL,
  apellido NVARCHAR(80) NOT NULL,
  correo NVARCHAR(150) NOT NULL UNIQUE
);
GO

IF OBJECT_ID(N'dbo.autor', N'U') IS NULL
CREATE TABLE dbo.autor (
  id_investigador INT PRIMARY KEY,
  CONSTRAINT fk_autor_investigador FOREIGN KEY (id_investigador)
  REFERENCES dbo.investigador(id_investigador)
  ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

IF OBJECT_ID(N'dbo.colaborador', N'U') IS NULL
CREATE TABLE dbo.colaborador (
  id_investigador INT PRIMARY KEY,
  CONSTRAINT fk_colaborador_investigador FOREIGN KEY (id_investigador)
  REFERENCES dbo.investigador(id_investigador)
  ON UPDATE CASCADE ON DELETE CASCADE
);
GO

IF OBJECT_ID(N'dbo.tema_interes', N'U') IS NULL
CREATE TABLE dbo.tema_interes (
  id_investigador INT NOT NULL,
  tema NVARCHAR(150) NOT NULL,
  PRIMARY KEY (id_investigador, tema),
  CONSTRAINT fk_tema_interes_investigador FOREIGN KEY (id_investigador)
  REFERENCES dbo.investigador(id_investigador)
  ON UPDATE CASCADE ON DELETE CASCADE
);
GO

IF OBJECT_ID(N'dbo.articulo', N'U') IS NULL
CREATE TABLE dbo.articulo (
  id_articulo INT IDENTITY(1,1) PRIMARY KEY,
  titulo NVARCHAR(220) NOT NULL,
  anio_publicacion INT NULL
);
GO

IF OBJECT_ID(N'dbo.palabra_clave', N'U') IS NULL
CREATE TABLE dbo.palabra_clave (
  id_articulo INT NOT NULL,
  palabra NVARCHAR(100) NOT NULL,
  PRIMARY KEY (id_articulo, palabra),
  CONSTRAINT fk_palabra_clave_articulo FOREIGN KEY (id_articulo)
  REFERENCES dbo.articulo(id_articulo)
  ON UPDATE CASCADE ON DELETE CASCADE
);
GO

IF OBJECT_ID(N'dbo.articulo_autor', N'U') IS NULL
CREATE TABLE dbo.articulo_autor (
  id_articulo INT NOT NULL,
  id_investigador INT NOT NULL,
  PRIMARY KEY (id_articulo, id_investigador),
  CONSTRAINT fk_articulo_autor_articulo FOREIGN KEY (id_articulo)
  REFERENCES dbo.articulo(id_articulo)
  ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_articulo_autor_autor FOREIGN KEY (id_investigador)
  REFERENCES dbo.autor(id_investigador)
  ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

IF OBJECT_ID(N'dbo.ubicacion_copia', N'U') IS NULL
CREATE TABLE dbo.ubicacion_copia (
  id_articulo INT NOT NULL,
  lugar NVARCHAR(200) NOT NULL,
  PRIMARY KEY (id_articulo, lugar),
  CONSTRAINT fk_ubicacion_copia_articulo FOREIGN KEY (id_articulo)
  REFERENCES dbo.articulo(id_articulo)
  ON UPDATE CASCADE ON DELETE CASCADE
);
GO

IF OBJECT_ID(N'dbo.congreso', N'U') IS NULL
CREATE TABLE dbo.congreso (
  id_congreso INT IDENTITY(1,1) PRIMARY KEY,
  tipo NVARCHAR(20) NOT NULL,
  pais NVARCHAR(80) NULL,
  CONSTRAINT ck_congreso_tipo CHECK (tipo IN (N'NACIONAL', N'INTERNACIONAL')),
  CONSTRAINT ck_congreso_pais CHECK (
    (tipo = N'NACIONAL' AND pais IS NULL) OR
    (tipo = N'INTERNACIONAL' AND pais IS NOT NULL)
  )
);
GO

IF OBJECT_ID(N'dbo.revista', N'U') IS NULL
CREATE TABLE dbo.revista (
  id_revista INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(160) NOT NULL
);
GO

IF OBJECT_ID(N'dbo.informe_tecnico', N'U') IS NULL
CREATE TABLE dbo.informe_tecnico (
  id_articulo INT PRIMARY KEY,
  numero_id NVARCHAR(30) NOT NULL UNIQUE,
  centro_publicacion NVARCHAR(160) NULL,
  CONSTRAINT fk_informe_tecnico_articulo FOREIGN KEY (id_articulo)
  REFERENCES dbo.articulo(id_articulo)
  ON UPDATE CASCADE ON DELETE CASCADE
);
GO

IF OBJECT_ID(N'dbo.acta_congreso', N'U') IS NULL
CREATE TABLE dbo.acta_congreso (
  id_articulo INT PRIMARY KEY,
  id_congreso INT NOT NULL,
  CONSTRAINT fk_acta_congreso_articulo FOREIGN KEY (id_articulo)
  REFERENCES dbo.articulo(id_articulo)
  ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_acta_congreso_congreso FOREIGN KEY (id_congreso)
  REFERENCES dbo.congreso(id_congreso)
  ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

IF OBJECT_ID(N'dbo.articulo_revista', N'U') IS NULL
CREATE TABLE dbo.articulo_revista (
  id_articulo INT PRIMARY KEY,
  numero_revista INT NOT NULL,
  id_revista INT NOT NULL,
  CONSTRAINT fk_articulo_revista_articulo FOREIGN KEY (id_articulo)
  REFERENCES dbo.articulo(id_articulo)
  ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_articulo_revista_revista FOREIGN KEY (id_revista)
  REFERENCES dbo.revista(id_revista)
  ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

-- Comprobaciones
SELECT TABLE_NAME AS tabla
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
SELECT COUNT(*) AS total_tablas
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE';
GO
