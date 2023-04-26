use lesson_5;

CREATE TABLE Cars (
id serial auto_increment PRIMARY KEY,
Car_Name VARCHAR(20),
Cost int);

INSERT INTO Cars(Car_Name, Cost) values
('Audi' , 52642),
('Mercedes' , 57127),
('Skoda' , 9000),
('Volvo' , 29000),
('Bentley' , 350000),
('Citroen' , 21000),
('Hummer' , 41400),
('Volkswagen' , 21600);

/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/
-- 1
create view Cars_over_25000 as
select * from Cars where Cost < 25000;

-- 2
alter view Cars_over_25000 as
select * from Cars where Cost < 30000;

-- 3
create view Cars_1 as
select * from Cars where Car_Name = 'Skoda' or Car_Name = 'Audi';

select * from Cars_1;
/*
Вывести название и цену для всех анализов, 
которые продавались 5 февраля 2020 и всю следующую неделю.
*/
CREATE TABLE Analysis (
an_id serial auto_increment PRIMARY KEY not null,
an_name VARCHAR(20) not null,
an_cost int not null,
an_price int not null,
an_group VARCHAR(20) not null);

CREATE TABLE Groups_An (
gr_id int not null,
gr_name VARCHAR(20) not null,
gr_temp int not null);

CREATE TABLE Orders (
ord_id serial auto_increment not null,
ord_datetime datetime not null,
ord_an bigint UNSIGNED,
FOREIGN KEY (ord_an) REFERENCES Analysis (an_id));

INSERT INTO Analysis(an_name, an_cost, an_price, an_group) 
values
('name1' , 10, 12, 'group1'),
('name2' , 15, 20, 'group2'),
('name3' , 14, 18, 'group2'),
('name4' , 8, 11, 'group3'),
('name1' , 10, 12, 'group2'),
('name5' , 20, 32, 'group1'),
('name3' , 14, 18, 'group2'),
('name5' , 20, 32, 'group1'),
('name6' , 9, 12, 'group2');

INSERT INTO Groups_An(gr_id, gr_name, gr_temp) 
values
(1 , 'group1', 5),
(2 , 'group2', -18),
(3 , 'group3', 7);

INSERT INTO Orders(ord_datetime, ord_an) 
values
("2023-02-01 9:00:00", 1),
("2023-02-02 9:00:00", 2),
("2023-02-05 9:00:00", 3),
("2023-02-08 9:00:00", 4),
("2023-02-09 9:00:00", 5),
("2023-02-11 9:00:00", 6),
("2023-02-13 9:00:00", 7),
("2023-02-17 9:00:00", 8),
("2023-02-20 9:00:00", 9);

-- 4
with cte1 as
(select * from Orders where ord_datetime between "2023-02-05 00:00:00" and "2023-02-11 23:59:59")
select an_name, an_price from Analysis right join cte1 on cte1.ord_an=Analysis.an_id;

select an_name, an_price from Analysis 
inner join Orders on Orders.ord_an=Analysis.an_id 
and ord_datetime 
between "2023-02-05 00:00:00" and "2023-02-11 23:59:59";

CREATE TABLE trains (
train_id int not null,
station VARCHAR(20) not null,
station_time Time);

INSERT INTO trains(train_id, station, station_time) 
values
(110, 'San Francisko', "10:00:00"),
(110, 'Redwood City', "10:54:00"),
(110, 'Palo Alto', "11:02:00"),
(110, 'San Jose', "12:35:00"),
(120, 'San Francisko', "11:00:00"),
(120, 'Palo Alto', "12:49:00"),
(120, 'San Jose', "13:30:00");
/*
Добавьте новый столбец под названием «время до следующей станции». 
*/
-- 5
SELECT *,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id), station_time) as time_to_next_station
FROM trains;
-- time(LEAD(station_time) OVER(PARTITION BY train_id) - station_time) as time_to_next_station