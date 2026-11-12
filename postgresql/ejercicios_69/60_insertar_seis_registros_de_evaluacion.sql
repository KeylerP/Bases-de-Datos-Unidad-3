-- Universidad de Cartagena | Bases de Datos I | Unidad 3
-- Ejercicio 60/69: Insertar seis registros de evaluación
-- Fuente: Informe_Unidad3_DML.docx.pdf, pagina 81.
-- Motor: PostgreSQL. Base esperada: cea_bibliografia.
-- Ejecutar UNICAMENTE este ejercicio, por separado y en el orden del taller.
-- No se incluyen contrasenas ni credenciales.

-- SQL del informe:
INSERT INTO TablaY
(fecha, nombre, apellidos, asignatura, nota1, nota2, nota3, mensaje)
VALUES
('2023-05-20 00:00:00', 'Persona 1', 'De tal', 'Estructuras de datos', 1, NULL, NULL, 'Prácticamente no hizo nada'),
('2023-06-20 00:00:00', 'Persona 1', 'De tal', 'Estructuras de datos', 1, 1, NULL, 'La actividad es una copia de fragmentos disponibles en internet'),
('2023-07-20 00:00:00', 'Persona 1', 'De tal', 'Estructuras de datos', 1, 1, 1, 'La actividad esta completa pero no pudo sustentar, explicarla y no domina el desarrollo de ninguno de los ejercicios'),
('2023-05-20 00:00:00', 'Persona 3', 'De tal', 'Estructuras de datos', 4, NULL, NULL, 'Actividad al 80%, pero fue desarrollada progresivamente y socializada al docente en cada tutoria'),
('2023-06-20 00:00:00', 'Persona 3', 'De tal', 'Estructuras de datos', 4, 4.5, NULL, 'Actividad completa y entregada una semana antes del cierre, con video y sin documento'),
('2023-07-20 00:00:00', 'Persona 3', 'De tal', 'Estructuras de datos', 4, 4.5, 5, 'Actividad entregada mucho antes del cierre, 100% completa, con documento, video y sustentación');
