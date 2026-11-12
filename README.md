# Bases de Datos I — Unidad 3: DML multimotor

**Universidad de Cartagena · Ingeniería del Software**  
**Estudiante:** Keyler David Porto Contreras  
**Asignatura:** Bases de Datos I  
**Actividad:** *Dominio de Sentencias DML: Guía práctica de manipulación de datos en entornos multimotor*

## Descripción

Repositorio académico que organiza los scripts del Caso de Estudio Asignado (CEA):
**bibliografía de un grupo de investigación**. El modelo relacional original contiene
**13 tablas**. La tercera unidad aplica `INSERT`, `SELECT`, `UPDATE` y `DELETE`;
en los ejercicios 58–65 se añade la tabla `TablaY` para evaluar calificaciones.

En el informe de la Unidad 3, `TablaX = articulo` y `TablaZ = palabra_clave`.
Los **69 ejercicios** del informe se presentan en **69 archivos separados** para
facilitar su revisión sin ejecutar accidentalmente un bloque completo.

## Organización de archivos

| Ruta | Contenido |
|---|---|
| [`postgresql/INDICE_EJERCICIOS.md`](postgresql/INDICE_EJERCICIOS.md) | Índice navegable de los 69 ejercicios. |
| `postgresql/ejercicios_69/` | Ejercicios 01 a 69, reconstruidos del informe PDF de la Unidad 3; uno por archivo. |
| `postgresql/esquema/crear_13_tablas_cea_postgresql.sql` | Adaptación del esquema bibliográfico a PostgreSQL usada durante la práctica. |
| `postgresql/verificar_tablas_y_conexion.sql` | Identidad de la conexión y lista/cantidad de tablas. |
| `postgresql/dml_complementario_cea.sql` | Actualizaciones y eliminaciones complementarias de otra práctica del CEA; revisar antes de usar. |
| `mysql/esquema_13_tablas_cea_mysql.sql` | Reconstrucción del esquema original de la Unidad 2 a partir del documento entregado. |
| `mysql/verificar_13_tablas_y_conexion.sql` | Verificación del modelo MySQL para Workbench o NetBeans. |
| `sqlserver/crear_13_tablas_cea_sqlserver.sql` | Adaptación de las 13 tablas a SQL Server Express. |
| `sqlserver/insertar_datos_ejemplo.sql` | Datos de prueba de SQL Server, con comprobaciones previas. |
| `sqlserver/demostracion_dml_para_video.sql` | Demostración con 2 `INSERT`, 2 `UPDATE` y 2 `DELETE`, concluida con `ROLLBACK`. |
| `sqlserver/verificar_13_tablas_y_conexion.sql` | Verificación del modelo SQL Server. |
| `COMO_SUBIR_A_GITHUB.md` | Instrucciones para publicar este proyecto en tu propia cuenta. |

## Entornos utilizados

- **PostgreSQL 18:** pgAdmin 4 y Visual Studio Code con SQLTools (`cea_bibliografia`).
- **MySQL 8:** MySQL Workbench y Apache NetBeans (`7502520050_21_bibliografia`).
- **SQL Server Express:** SQL Server Management Studio (`cea_bibliografia`).

Los nombres de bases reflejan las prácticas utilizadas. No se incluye contraseña
ni configuración de conexión privada.

## Cómo revisar los ejercicios

1. Abrir pgAdmin y seleccionar **`cea_bibliografia`**.
2. Abrir `postgresql/ejercicios_69/` y elegir el número concreto.
3. Revisar el comentario inicial, la base de datos y el estado requerido.
4. Ejecutar únicamente el ejercicio que corresponda, **en el orden del taller**.
5. Comparar el resultado con las capturas y el documento de la actividad.

**Precauciones:** la mayoría de los ejercicios dependen de registros creados en pasos
anteriores. Los ejercicios **11, 13, 17, 20, 22, 28 y 30** incluyen pruebas
que pueden generar errores **intencionados** por restricciones o datos inválidos.
El **09** contiene una adaptación explícita porque el SQL transcrito en el informe
omitía un valor sin declarar columnas. Los **54 y 56** constan en el informe como
SQL orientativo pendiente de contrastar. Los **66 y 68** son destructivos; **68
está comentado por seguridad**. No ejecutar comandos destructivos contra una base
que contenga datos importantes.

**Diferencias entre motores:** la versión MySQL reproduce el modelo de la Unidad 2;
los otros dos archivos de creación son adaptaciones usadas durante la práctica.
Pueden existir diferencias en longitudes, claves y restricciones; se debe comparar
el diagrama y las claves foráneas antes de afirmar equivalencia exacta.

## Copia de seguridad

En la **Unidad 2** se documentó un respaldo de MySQL con el nombre
`bd_bibliografia.sql`. **Ese archivo real de respaldo no forma parte de este paquete**.
Los scripts de creación incluidos aquí **no son** un respaldo de la base con sus datos.

En la **Unidad 3** se documentó un respaldo y una restauración en SQL Server,
en una base denominada `cea_bibliografia_restaurada`. La entrega debe mantener
las evidencias y el archivo de respaldo que efectivamente se utilizaron.

## Evidencias y vídeo

Las capturas de pantalla, los resultados y las explicaciones se encuentran
en el informe académico. Puedes añadir a este repositorio un directorio
`evidencias/` con imágenes seleccionadas que **no contengan contraseñas**.
En la guía de la Unidad 3, la sustentación solicita mostrar al menos
**2 INSERT, 2 UPDATE, 2 DELETE y un respaldo**.

## GitHub y trazabilidad

Publicar los archivos aquí crea un repositorio y un commit real. **No acredita
automáticamente un `fork`, ramas o Pull Requests**: esos requisitos se cumplen
solo si se realizan efectivamente. Consulta la guía y, si existe un repositorio
base del docente, utiliza su URL para el `fork`.

## Origen del material

Los scripts se organizaron a partir de los documentos académicos aportados
para las **unidades 1, 2 y 3** y de los scripts SQL de preparación utilizados
durante la actividad. El archivo del informe sigue siendo la referencia
para las capturas, el resultado concreto y las explicaciones.
