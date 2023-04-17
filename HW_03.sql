CREATE DATABASE hw_03_staff;

USE hw_03_staff;

-- Создание таблицы staff
CREATE TABLE staff (
    id_staff MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    post VARCHAR(50) NOT NULL,
    seniority TINYINT UNSIGNED,
    salary DECIMAL(8 , 2 ),
    age TINYINT UNSIGNED
);

INSERT INTO staff(firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
	('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    
-- 1.1 Отсортируйте данные по полю заработная плата (salary) в порядке: возрастания
SELECT * 
FROM staff
ORDER BY salary;

-- 1.2 Отсортируйте данные по полю заработная плата (salary) в порядке: убывания
SELECT * 
FROM staff
ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT * 
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каж дойспециальности (роst)
SELECT 
    post,
    SUM(salary) AS total_salary,
    COUNT(*) AS total_worker,
    ROUND(AVG(salary), 2) AS salary_average
FROM
    staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) « Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) AS total_handyman
FROM staff
GROUP BY post
HAVING post = 'Рабочий';

-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS specialties
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) > 30;