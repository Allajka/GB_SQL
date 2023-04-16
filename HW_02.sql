/* 1. Используя операторы языка SQL, создайте таблицу “ sales” . Заполните ее данными. */

CREATE DATABASE hw_02_order;

USE hw_02_order;

CREATE TABLE sales
(
	id_sales INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product MEDIUMINT NOT NULL 
);

INSERT INTO sales(order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

/* 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
- меньше 100 - Маленький заказ
- от 100 до 300 - Средний заказ
- больше 300 - Большой заказ */

SELECT id_sales AS 'id заказа',
CASE
	WHEN count_product < 100
		THEN 'Маленький заказ'
	WHEN count_product > 100 AND count_product < 300
		THEN 'Средний заказ'
	ELSE 'Большой заказ'
    END AS 'Тип заказа'
FROM sales;

/* 3.1 Создайте таблицу “ orders” , заполните ее значениями*/

CREATE TABLE orders
(
	id_orders INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    employee_id VARCHAR(20) NOT NULL,
    amount DECIMAL(6, 2) NOT NULL,
    order_status VARCHAR(12)
);

INSERT INTO orders(employee_id, amount, order_status)
VALUES 
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    
/*3.1 Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
- OPEN – «Order is in open state» ; 
- CLOSED - «Order is closed»; 
- CANCELLED - «Order is cancelled»*/

SELECT id_orders,
CASE 
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'Order is cancelled'
	ELSE 'Other'
    END AS 'full_order_status'
FROM orders;

/*4. NULL и 0 отличая

0 - это число, которое обозначает отсутствие какого-либо значения. Оно может использоваться в математических операциях и сравнениях.

NULL - это специальное значение, которое обозначает отсутствие значения или неопределенность. Оно используется в базах данных и программах 
для обозначения отсутствия данных или ошибок. NULL не является числом и не может использоваться в математических операциях или сравнениях.

Таким образом, 0 и NULL имеют разное значение и используются в разных контекстах.*/