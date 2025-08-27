CREATE DATABASE IF NOT EXISTS `restaurant_db`;
USE `restaurant_db`;

-- Crear la tabla clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

-- Crear la tabla pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    fecha DATE,
    total INT, 
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Insertar cinco nuevos clientes 
INSERT INTO clientes (id, nombre, direccion, telefono) VALUES
(1, 'Juan Pérez', 'Calle 1, Santiago', '1234567890'),
(2, 'María González', 'Calle 2, Valparaíso', '2345678901'),
(3, 'Luisa Martínez', 'Calle 3, Concepción', '3456789012'),
(4, 'Pedro Rodríguez', 'Calle 4, La Serena', '4567890123'),
(5, 'Ana Sánchez', 'Calle 5, Antofagasta', '5678901234');

-- Insertar diez nuevos pedidos 
INSERT INTO pedidos (id, cliente_id, fecha, total) VALUES
(1, 1, '2025-01-01', 10000),
(2, 1, '2025-01-02', 15000),
(3, 2, '2025-01-03', 20000),
(4, 3, '2025-01-04', 25000),
(5, 4, '2025-01-05', 30000),
(6, 5, '2025-01-06', 35000),
(7, 1, '2025-01-07', 40000),
(8, 2, '2025-01-08', 45000),
(9, 3, '2025-01-09', 50000),
(10, 4, '2025-01-10', 55000);

-- Proyectar todos los clientes y sus respectivos pedidos
SELECT c.id AS cliente_id, c.nombre, c.direccion, c.telefono, p.id AS pedido_id, p.fecha, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id; -- Incluir clientes sin pedidos

-- Proyectar todos los pedidos realizados por un cliente específico 
SELECT p.id AS pedido_id, p.fecha, p.total
FROM pedidos p
WHERE p.cliente_id = 1; -- Filtrar por el cliente específico

-- Calcular el total de todos los pedidos para cada cliente
SELECT c.id AS cliente_id, c.nombre, SUM(p.total) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre;

-- Actualizar la dirección de un cliente dado su id 
UPDATE clientes
SET direccion = 'Calle 6, Coquimbo'
WHERE id = 1;

-- Eliminar un cliente específico y todos sus pedidos asociados (por ejemplo, cliente con id = 5)
-- Primero elimina los pedidos asociados y luego el cliente
DELETE FROM pedidos
WHERE cliente_id = 5;

DELETE FROM clientes
WHERE id = 5;

-- Verificar que el cliente y sus pedidos han sido eliminados
SELECT * FROM clientes WHERE id = 5;
SELECT * FROM pedidos WHERE cliente_id = 5;

-- Proyectar los tres clientes que han realizado más pedidos, 
--ordenados de forma descendente por el número de pedidos
SELECT c.id AS cliente_id, c.nombre, COUNT(p.id) AS numero_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
ORDER BY numero_pedidos DESC
LIMIT 3;



