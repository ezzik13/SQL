use lesson_2;
create table movies(
id serial primary key,
title varchar(50) not null,
titje_eng varchar(50),
year_movie year not null,
count_min int,
storyline text
);
INSERT INTO movies(title, title_eng, year_movie, count_min, storyline)
VALUES
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);

SELECT * FROM movies;
create table genres(
id serial primary key,
name varchar(50) not null);
create table actors(
id serial primary key,
firstname varchar(50) not null,
lastname varchar(50) not null);
/*
1. Переименовать сущность movies в cinema.
2. Добавить сущности cinema новый атрибут status_active (тип BIT) и атрибут genre_id после атрибута title_eng.
3. Удалить атрибут status_active сущности cinema.
4. Удалить сущность actors из базы данных
5. Добавить внешний ключ на атрибут genre_id сущности cinema и направить его на атрибут id сущности genres.
6. Очистить сущность genres от данных и обнулить автоинкрементное поле.

*/
-- 1.
rename table movies to cinema;	
-- 2.
alter table cinema
add column status_active bit default b'1', 
add genre_id int after title_eng;
SELECT * FROM cinema;
-- 3.
alter table cinema
drop column status_active;
SELECT * FROM cinema;

-- 4.
drop table actors;

-- 5.
alter table cinema
modify column genre_id bigint unsigned;
alter table cinema
add foreign key(genre_id) references genres(id);

show create table cinema;

-- 6.
truncate table genres;

/*Задача 3. Выведите id, название фильма 
и категорию фильма, согласно следующего 
перечня: 
Д- Детская, П – Подростковая, 
В – Взрослая, Не указана   */
alter table cinema
add column age_category varchar(1);

update cinema set age_category = 'п' where id = 1;
UPDATE cinema SET age_category = 'Д' WHERE id = 4;
UPDATE cinema SET age_category = 'В' WHERE id = 5;
select * from cinema;

select id, title,
	case age_category
		when 'Д' then 'Детская'
		when 'П' then 'Подростковая'
		when 'В' then 'Взрослая'
	else 'Не указана'
end as "Категория"
from cinema;
/*
Задача 4. Выведите id, название фильма, продолжительность, 
тип в зависимости от продолжительности (с использованием CASE).
До 50 минут - Короткометражный фильм
От 50 минут до 100 минут - Среднеметражный фильм
Более 100 минут - Полнометражный фильм
Иначе - Не определено
*/
UPDATE cinema SET count_min = 88 WHERE id = 2;
UPDATE cinema SET count_min = NULL WHERE id = 3;
UPDATE cinema SET count_min = 34 WHERE id = 4;

select id, title, count_min,
	case 
		when  count_min < 50 THEN "Короткометражный фильм"
		WHEN count_min BETWEEN 50 AND 100 THEN "Среднеметражный фильм"
		WHEN count_min > 100 THEN "Полнометражный фильм"
	ELSE "Не определено"
END AS 'Тип'

FROM cinema;

SELECT id, title, count_min,
	IF(count_min < 50, "Короткометражный фильм",
		IF(count_min BETWEEN 50 AND 100, "Среднеметражный фильм",
			IF(count_min > 100, "Полнометражный фильм", "Не определено"))) AS 'Тип'
FROM cinema;


