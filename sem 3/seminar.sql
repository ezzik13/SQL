/* 1.	Выведите все записи, отсортированные по полю "age" по возрастанию

2.	Выведите все записи, отсортированные по полю "name"

3.	Выведите записи полей "name", "surname","age",
отсортированные по полю "name" в алфавитном порядке по убыванию

4.	Выполните сортировку по полям "name" и "age" по убыванию */
use lesson_3;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);
-- 1.
select * from staff
order by age;

-- 2.
select * from staff
order by firstname;
-- 3
select firstname , lastname, age from staff
order by firstname desc;

-- 4.
select * from staff
order by firstname desc, age desc;

/*
1.	Выведите уникальные (неповторяющиеся) значения полей "name"
2.	Выведите первые две первые записи из таблицы

3.	Пропустите  первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)

4*. 	Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие за ними 3 строки (где id=10, id=9, id=8)
*/
-- 1
select distinct (firstname) from staff;

-- 2
select * from staff limit 2;

-- 3
select * from staff limit 4, 3;

-- 4
SELECT * FROM staff ORDER BY id DESC LIMIT 2, 3;

/*
1. Рассчитайте общее количество всех страниц dialy_typing_pages
2. Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)
3. Посчитайте количество записей в таблице
4. Выведите количество имен, которые являются уникальными
5. Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
*/
CREATE TABLE employee_tbl (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
id INT NOT NULL,
name VARCHAR(50) NOT NULL,
work_date DATE,
daily_typing_pages INT
);

-- Наполнение данными
INSERT INTO employee_tbl (id, name, work_date, daily_typing_pages)
VALUES
(1, 'John', '2007-01-24', 250),
(2, 'Ram', '2007-05-27', 220),
(3, 'Jack', '2007-05-06', 170),
(3, 'Jack', '2007-04-06', 100),
(4, 'Jill', '2007-04-06', 220),
(5, 'Zara', '2007-06-06', 300),
(5, 'Zara', '2007-02-06', 350);

-- 1
select sum(daily_typing_pages) as sum from employee_tbl;

-- 2
select name as 'имя', sum(daily_typing_pages) as 'сумма' from employee_tbl group by name;

-- 3

select count(*) as 'кол-во строк' from employee_tbl;

-- 4

select count(distinct name) from employee_tbl;
-- 5
select avg(daily_typing_pages) as 'среднее' from employee_tbl;
-- 5.1
select name as 'имя', round(avg(daily_typing_pages), 0) as 'среднее' from employee_tbl group by name;

/*
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы найдите суммарную зарплату
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную заработную плату внутри группы
*/

CREATE TABLE employee_salary (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
salary INT
);

-- Наполнение данными
INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000),
('Паша', 25, 700);

-- 1
select age, sum(salary) as sum from employee_salary group by age;

-- 2
select age, max(salary) as max from employee_salary group by age;

-- 3
select age, min(salary) as min from employee_salary group by age;
 /*  1. Выведите только те строки, в которых суммарная зарплата больше или равна 1000
2. Выведите только те группы, в которых количество строк меньше или равно двум
3. Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “BETWEEN”
4.* Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “IN”
*/

-- 1
select age, sum(salary) as sum from employee_salary group by age having sum >= 1000;

-- 2
select age, count(*) as count from employee_salary group by age having count <= 2;

-- 3
select age, count(*) as count from employee_salary group by age having count between 0 and 2;

-- 4
select age, count(*) as count from employee_salary group by age having count in (0, 1, 2);