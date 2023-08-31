DROP DATABASE IF EXISTS DZ_Seminar5;
CREATE DATABASE DZ_Seminar5;
USE DZ_Seminar5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    car_name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000

CREATE VIEW CheapCars 
  AS SELECT car_name, cost 
       FROM cars 
      WHERE cost<25000;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) ALTER VIEW CheapCars AS SELECT Name FROM CarsWHERE Cost<30000

ALTER VIEW CheapCars 
 AS SELECT car_name, cost 
      FROM cars
	 WHERE cost < 30000;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично) 

CREATE VIEW SkodaAudi 
  AS SELECT car_name, cost 
       FROM cars 
      WHERE car_name IN ('Skoda', 'Audi');
      
      
/*Есть таблица анализов Analysis: 
an_id — ID анализа; 
an_name — название анализа; 
an_cost — себестоимость анализа; 
an_price — розничная цена анализа; 
an_group — группа анализов. 

Есть таблица групп анализов Groups: 
gr_id — ID группы; 
gr_name — название группы; 
gr_temp — температурный режим хранения. 

Есть таблица заказов Orders: 
ord_id — ID заказа; 
ord_datetime — дата и время заказа; 
ord_an — ID анализа.

Вывести название и цену для всех анализов, 
которые продавались 5 февраля 2020 и всю следующую неделю.*/


DROP TABLE IF EXISTS Analysis;
CREATE TABLE Analysis
(
	an_id INT NOT NULL PRIMARY KEY,
    an_name VARCHAR(45),
    an_cost INT,
    an_price INT,
    an_group INT
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
	ord_id INT NOT NULL PRIMARY KEY,  
	ord_datetime DATETIME, 
	ord_an INT
);

SELECT an_name, an_price
  FROM Analysis
  JOIN Orders ON an_id = ord_an
 WHERE ord_datetime BETWEEN'2020-02-05' AND '2020-02-12';