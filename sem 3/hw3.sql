use lesson_3;
CREATE TABLE SALESPEOPLE (
snum INT AUTO_INCREMENT PRIMARY KEY,
sname VARCHAR(15),
city VARCHAR(15),
comm float
);

-- Наполнение данными
INSERT INTO SALESPEOPLE (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', 0.12);

INSERT INTO SALESPEOPLE (sname, city, comm)
VALUES
('Serres', 'San Jose', 0.13),
('Motika', 'London', 0.11),
('Rifkin', 'Barcelona', 0.15),
('Axelrod', 'New York', 0.10);

CREATE TABLE CUSTOMERS (
cnum INT AUTO_INCREMENT PRIMARY KEY,
cname VARCHAR(15),
city VARCHAR(15),
rating INT,
snum INT
);

INSERT INTO CUSTOMERS (cnum, cname, city, rating, snum)
VALUES
(2001, 'Hoffman', 'London', 100, 1001);

INSERT INTO CUSTOMERS (cname, city, rating, snum)
VALUES
('Giovanni', 'Rome', 200, 1003),
('Liu', 'SanJose', 200, 1002),
('Grass', 'Berlin', 300, 1002),
('Clemens', 'London', 100, 1001),
('Cisneros', 'SanJose', 300, 1007),
('Pereira', 'Rome', 100, 1004);

CREATE TABLE ORDERS (
onum INT PRIMARY KEY,
amt float,
odate VARCHAR(15),
cnum INT,
snum INT
);
INSERT INTO ORDERS (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '10/03/1990', 2008, 1007),
(3003, 767.19, '10/03/1990', 2001, 1001),
(3002, 1900.10, '10/03/1990', 2007, 1004),
(3005, 5160.45, '10/03/1990', 2003, 1002),
(3006, 1098.16, '10/03/1990', 2008, 1007),
(3009, 1713.23, '10/04/1990', 2002, 1003),
(3007, 75.75, '10/04/1990', 2004, 1002),
(3008, 4723.00, '10/05/1990', 2006, 1001),
(3010, 1309.95, '10/06/1990', 2004, 1002),
(3011, 9891.88, '10/06/1990', 2006, 1001);

/* 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
*/
-- 1
select city, sname, snum, comm from SALESPEOPLE;

-- 2
select cname, rating from CUSTOMERS where city = 'SanJose';

-- 3
select distinct(snum) from ORDERS;

-- 4
select * from CUSTOMERS
where cname like 'G%' ;

-- 5
select * from ORDERS
where amt > 1000;

-- 6
select min(amt) from ORDERS;

-- 7
select cname from CUSTOMERS
where rating > 100 and city != 'Rome';

CREATE TABLE spisok (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(15),
surname VARCHAR(15),
specialty VARCHAR(15),
seniority INT,
salary INT,
age INT
);
INSERT INTO spisok (name, surname, specialty, seniority, salary, age)
VALUES
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Каткина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськинф', 'уборщик', 10, 10000, 49);

-- 8.
select * from spisok
order by salary desc;
-- 8.1.
select salary from spisok
order by salary;
-- 9
(select salary from spisok
order by salary desc LIMIT 5)order by salary;

-- 10
select specialty, sum(salary) as sum from spisok
group by specialty having sum > 100000;
