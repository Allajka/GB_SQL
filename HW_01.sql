-- Задание 1 Создайте таблицу

create database hw_01_mobile;

create table mobile_phones
(
	id int primary key auto_increment,
    product_name varchar(50) not null unique,
    manufacturer varchar(50)not null,
    product_count int,
    price int unsigned
);

use hw_01_mobile;

insert into mobile_phones
values
(1, 'iPhone X', 'Apple', 3, 76000);

insert into mobile_phones(product_name, manufacturer, product_count, price)
values
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- Задание 2 Выведите название, производителя и цену для товаров, количество которых превышает 2
select product_name, manufacturer, price 
from mobile_phones
where product_count > 2;

-- Задание 3 Выведите весь ассортимент товаров марки “Samsung”
select * from mobile_phones
where manufacturer = 'Samsung';

-- Задание 4.1 Товары, в которых есть упоминание 'Iphone'
select * from mobile_phones
where product_name like '%Iphone%';

-- Задание 4.2 Товары, в которых есть упоминание 'Samsung'
select * from mobile_phones
where manufacturer like '%Samsung%';

-- Задание 4.3 Товары, в которых есть цифры
select * from mobile_phones
where product_name regexp '[0-9]';

-- Задание 4.4 Товары, в которых есть цифра 8
select * from mobile_phones
where product_name like '%8%';

