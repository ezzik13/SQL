use lesson_4;
CREATE TABLE members
(
member_id INT AUTO_INCREMENT,
name VARCHAR (100) ,
PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
committee_id INT AUTO_INCREMENT,
name VARCHAR (100),
PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES("John"), ("Jane"), ("wary"), ("David"), ("2melia");
INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelial"), ("Joe");
/* Задание:
Выведите участников, которые также являются членами комитета, 
используйте INNER JOIN (пересечение 2 таблиц по имени);
*/
select * from members inner join committees on members.name = committees.name;
-- ==
select * from members inner join committees using(name);

-- Выведите участников, которые не являются членами комитета
SELECT * FROM committees LEFT JOIN members USING(name) WHERE members.name IS NULL;
-- 1. Найти членов комитета, которых нет в members с помощью RIGHT JOIN
-- 2. Выполнить RIGHT JOIN между 2 таблицами по полю “Имя”
-- 4. Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
-- 5. Получить список пользователей и клиентов. Дубликаты удалять не нужно
-- 1
SELECT * FROM members right JOIN committees USING(name) WHERE members.name IS NULL;

-- 2
SELECT * FROM members right JOIN committees USING(name);

--  3 cross join
select * from members cross JOIN committees;

-- 4
select * from members union select * from committees;
-- 5
select * from members union all  select * from committees;

/* Задание:
Выведите FULL JOIN
*/
CREATE TABLE products (
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category INT NULL,
product_name VARCHAR(100) NOT NULL
);

-- Создание таблицы с категориями
CREATE TABLE categories (
category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
);

-- Добавление данных в таблицу с товарами
INSERT INTO products(category, product_name)
VALUES (1, 'Системный блок'),
(1, 'Монитор'),
(2, 'Холодильник'),
(2, 'Телевизор'),
(NULL, 'Операционная система');

-- Добавление данных в таблицу с категориями
INSERT INTO categories (category_name)
VALUES ('Комплектующие компьютера'),
('Бытовая техника'),
('Мобильные устройства');
SELECT p.product_name, c.category_name

FROM products p
LEFT JOIN categories c
ON p.category = c.category_id
UNION
SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c
ON p.category = c.category_id;


CREATE TABLE t1(
id INT PRIMARY KEY
);

CREATE TABLE t2(
id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);
-- UNION
SELECT id FROM t1
UNION
SELECT id FROM t2;

-- UNION all
SELECT id FROM t1
UNION all
SELECT id FROM t2;

-- 4. Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
-- 5. Получить список пользователей и клиентов. Дубликаты удалять не нужно
-- 4
select * from clients union select * from users;
-- 5
select * from clients union all  select * from users;
/*
Проверьте, присутствует ли буква “А” в последовательности 'A', 'B', 'C', 'D'
Проверьте, присутствует ли буква “Z” в последовательности 'A', 'B', 'C', 'D'
Получить столбцы из таблицы “clients” , в которых первое имя является набором значений.
Выберите все логины из таблицы “users”, кроме “Mikle”.
*/
SELECT "A" IN ('A', 'B', 'C', 'D' );

SELECT "Z" IN ('A', 'B', 'C', 'D' );

SELECT * FROM clients
WHERE login IN ('Mikle', 'Tom', 'Masha');

SELECT * FROM clients
WHERE login not IN ('Mikle');
/*
1. Получите из таблицы "Сотрудники" только тех сотрудников, которые в данный момент работают над любым из активных проектов.
2. Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.
*/
-- 1
select * from employee inner join projects 
on employee.id = projects.EmployeeId;
-- или
SELECT * FROM Employee
WHERE EXISTS (SELECT * FROM Projects
WHERE Employee.id = Projects.EmployeeID);
-- 2
select 1004 in (select id from employee);
-- или
SELECT EXISTS (SELECT * FROM Employee WHERE id = 1004) AS res;