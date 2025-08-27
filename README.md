# Proyecto: Base de Datos de Clientes y Pedidos
Por Álvaro Ortega Hamel

## Descripción

Este proyecto implementa una base de datos relacional para gestionar clientes y sus pedidos.  
Incluye la creación de tablas, inserción de datos, consultas de selección, actualización, eliminación y agregación.

La base de datos está diseñada para un restaurante (o negocio similar) donde se registran los clientes y sus compras.

---

## Requerimientos y Consultas Implementadas

1. **Creación de la base de datos y tablas:**
   - Base de datos: `restaurant_db`
   - Tablas: `clientes` y `pedidos` con clave primaria y foránea.

2. **Inserción de datos:**
   - 5 registros en la tabla `clientes`.
   - 10 registros en la tabla `pedidos`, relacionados correctamente con sus clientes.

3. **Consultas realizadas:**
   - Listar todos los clientes junto con sus pedidos (LEFT JOIN).
   - Listar todos los pedidos de un cliente específico por su `id`.
   - Calcular el **total de pedidos por cada cliente** (SUM y GROUP BY).
   - **Actualizar** la dirección de un cliente específico.
   - **Eliminar** un cliente y todos sus pedidos asociados.
   - Listar los **3 clientes con más pedidos**, en orden descendente.

---

## Estructura del Archivo

El archivo `M5_AE3_ABP.sql` incluye las siguientes secciones:

- Creación de la base de datos y uso de la misma.
- Creación de tablas con restricciones.
- Inserción de datos en `clientes` y `pedidos`.
- Consultas para reportes y análisis.
- Actualización y eliminación de registros.
- Consulta de ranking de clientes por número de pedidos.

---

## Ejecución

1. Abrir el archivo `.sql` en tu gestor de base de datos.
2. Ejecutar los comandos en el orden que aparecen en el archivo.
3. Verificar los resultados de las consultas.