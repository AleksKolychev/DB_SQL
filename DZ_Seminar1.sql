SELECT * FROM dz_seminar1.phone_table
/* Выведите название, производителя и цену для товаров, количество которых превышает 2 */
SELECT * FROM dz_seminar1.phone_table WHERE ProductCount > 2;
/* Выведите весь ассортимент товаров марки “Samsung” */
SELECT * FROM dz_seminar1.phone_table WHERE Manufacturer = 'Samsung';
/* Найти товары, в которых есть упоминание "Iphone" */
SELECT * FROM dz_seminar1.phone_table WHERE ProductName LIKE 'iPhone%';
/* Найти товары, в которых есть упоминание "Samsung" */
SELECT * FROM dz_seminar1.phone_table WHERE Manufacturer LIKE 'Samsung%';
/* Товары, в которых есть ЦИФРЫ */
SELECT * FROM dz_seminar1.phone_table WHERE ProductName RLIKE '[0-9]';
/* Товары, в которых есть ЦИФРА "8" */
SELECT * FROM dz_seminar1.phone_table WHERE ProductName LIKE '%8%';