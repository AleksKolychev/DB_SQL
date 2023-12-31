-- 1. Используя операторы языка SQL, создайте таблицу “ sales ”. Заполните ее.


DROP DATABASE IF EXISTS DZ_Seminar2;
CREATE DATABASE IF NOT EXISTS DZ_Seminar2;
USE DZ_Seminar2;
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  count_product INT UNSIGNED
);
INSERT INTO sales (count_product)
VALUES 
  (156),
  (180),
  (21),
  (124),
  (341);
  
SELECT * FROM sales;


/* 2. Для данных таблицы “ sales ” укажите тип заказа в зависимости от кол-ва:
меньше 100 Маленький заказ
от 100 до 300 Средний заказ
больше 300 Большой заказ */


SELECT id, order_date, count_product,
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
    ELSE "Большой заказ"
END AS order_type
FROM sales;

/* 3. Создайте таблицу “ orders ”, заполните ее значениями. Выберите все заказы.
В зависимости от поля order_status выведите столбец full_order_status:
OPEN - « Order is in open state » ; 
CLOSED « Order is closed » ; 
CANCELLED « Order is cancelled » */

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(5),
    amount DOUBLE,
    order_status VARCHAR(10)
);
    
INSERT INTO orders (employee_id, amount, order_status) 
VALUES
  ("e03", "15.00", "OPEN"),
  ("e01", "25.50", "OPEN"),
  ("e05", "100.70", "CLOSED"),
  ("e02", "22.18", "OPEN"),
  ("e04", "9.50", "CANCELLED");
  
SELECT * FROM orders;

SELECT id, employee_id, amount, order_status,
CASE
	WHEN order_status = "OPEN" THEN "Order is in open state"
    WHEN order_status = "CLOSED" THEN "Order is closed"
    WHEN order_status = "CANCELLED" THEN "Order is cancelled"
END AS full_order_status
FROM orders;
    
    
    
	