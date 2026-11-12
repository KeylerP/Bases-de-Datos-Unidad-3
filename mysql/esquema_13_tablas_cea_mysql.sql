-- Unidad 2 / Unidad 3 | Modelo bibliografico original del CEA (MySQL 8)
-- Reconstruido a partir de "Actividad_Unidad2_MySQL_Keyler_Porto.pdf", paginas 20-30.
-- IMPORTANTE: script para una base NUEVA / de pruebas; NO ejecutar sobre
-- la base ya creada, porque los ALTER TABLE de claves foraneas se duplicarian.
-- No contiene datos ni contrasenas.

CREATE DATABASE IF NOT EXISTS `7502520050_21_bibliografia`
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `7502520050_21_bibliografia`;

CREATE TABLE INVESTIGADOR (
  id_investigador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  correo VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE AUTOR (id_investigador INT PRIMARY KEY);
CREATE TABLE COLABORADOR (id_investigador INT PRIMARY KEY);

CREATE TABLE TEMA_INTERES (
  id_investigador INT NOT NULL,
  tema VARCHAR(120) NOT NULL,
  PRIMARY KEY (id_investigador, tema)
);

CREATE TABLE ARTICULO (
  id_articulo INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(250) NOT NULL,
  anio_publicacion SMALLINT
);

CREATE TABLE PALABRA_CLAVE (
  id_articulo INT NOT NULL,
  palabra VARCHAR(80) NOT NULL,
  PRIMARY KEY (id_articulo, palabra)
);

CREATE TABLE ARTICULO_AUTOR (
  id_articulo INT NOT NULL,
  id_investigador INT NOT NULL,
  PRIMARY KEY (id_articulo, id_investigador)
);

CREATE TABLE UBICACION_COPIA (
  id_articulo INT PRIMARY KEY,
  lugar VARCHAR(100) NOT NULL
);

CREATE TABLE CONGRESO (
  id_congreso INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('NACIONAL','INTERNACIONAL') NOT NULL,
  pais VARCHAR(60) NULL,
  CHECK (tipo = 'INTERNACIONAL' OR pais IS NULL)
);

CREATE TABLE REVISTA (
  id_revista INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(200) NOT NULL
);

CREATE TABLE INFORME_TECNICO (
  id_articulo INT PRIMARY KEY,
  numero_id VARCHAR(40) NOT NULL UNIQUE,
  centro_publicacion VARCHAR(120) NOT NULL
);

CREATE TABLE ACTA_CONGRESO (
  id_articulo INT PRIMARY KEY,
  id_congreso INT NOT NULL
);

CREATE TABLE ARTICULO_REVISTA (
  id_articulo INT PRIMARY KEY,
  numero_revista INT NOT NULL,
  id_revista INT NOT NULL
);

-- Indices explicitos presentados en la Unidad 2.
CREATE INDEX idx_artautor_investigador ON ARTICULO_AUTOR (id_investigador);
CREATE INDEX idx_acta_congreso ON ACTA_CONGRESO (id_congreso);
CREATE INDEX idx_artrevista_revista ON ARTICULO_REVISTA (id_revista);

-- Las 12 relaciones del modelo bibliografico documentado.
ALTER TABLE AUTOR ADD CONSTRAINT fk_autor_investigador
  FOREIGN KEY (id_investigador) REFERENCES INVESTIGADOR (id_investigador)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE COLABORADOR ADD CONSTRAINT fk_colab_investigador
  FOREIGN KEY (id_investigador) REFERENCES INVESTIGADOR (id_investigador)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TEMA_INTERES ADD CONSTRAINT fk_tema_investigador
  FOREIGN KEY (id_investigador) REFERENCES INVESTIGADOR (id_investigador)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE PALABRA_CLAVE ADD CONSTRAINT fk_palabra_articulo
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO (id_articulo)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE UBICACION_COPIA ADD CONSTRAINT fk_ubicacion_articulo
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO (id_articulo)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE INFORME_TECNICO ADD CONSTRAINT fk_informe_articulo
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO (id_articulo)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ACTA_CONGRESO ADD CONSTRAINT fk_acta_articulo
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO (id_articulo)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ARTICULO_REVISTA ADD CONSTRAINT fk_artrevista_articulo
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO (id_articulo)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ARTICULO_AUTOR ADD CONSTRAINT fk_artautor_articulo
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO (id_articulo)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ARTICULO_AUTOR ADD CONSTRAINT fk_artautor_autor
  FOREIGN KEY (id_investigador) REFERENCES AUTOR (id_investigador)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE ACTA_CONGRESO ADD CONSTRAINT fk_acta_congreso
  FOREIGN KEY (id_congreso) REFERENCES CONGRESO (id_congreso)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE ARTICULO_REVISTA ADD CONSTRAINT fk_artrevista_revista
  FOREIGN KEY (id_revista) REFERENCES REVISTA (id_revista)
  ON DELETE RESTRICT ON UPDATE CASCADE;

-- Comprobacion del modelo.
SELECT TABLE_NAME
FROM information_schema.tables
WHERE table_schema = DATABASE() AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
