use lesson_6;
/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".
*/
delimiter &&
create procedure hello()
begin
	case
		when curtime() between '06:00:00' and '11:59:59' then
			select 'Доброе утро' as 'Приветствие';
		when curtime() between '12:00:00' and '17:59:59' then
			select 'Добрый день' as 'Приветствие';
		when curtime() between '18:00:00' and '23:59:59' then
			select 'Добрый вечер' as 'Приветствие';
		else
			select 'Доброй ночи' as 'Приветствие';
	end case;
end &&
delimiter ;

call hello();

/*
Выведите первые N чисел Фибоначчи
*/
DELIMITER //
CREATE FUNCTION fib(n INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
DECLARE n0 INT DEFAULT 0;
DECLARE n1 INT DEFAULT 1;
DECLARE n2 INT DEFAULT 0;
DECLARE res VARCHAR(255) DEFAULT '0 1';

IF n = 1 THEN
RETURN n0;
ELSEIF n = 2 THEN
RETURN CONCAT(n0, ' ', n1);
ELSE
WHILE n > 2 DO
SET n2 = n1 + n0;
SET n0 = n1;
SET n1 = n2;
SET n = n - 1;
SET res = CONCAT(res, ' ', n2);
END WHILE;
RETURN res;
END IF;
END //
DELIMITER ;

SELECT fib(5);

CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);
--  Изменим баланс на аккаунтах

START TRANSACTION;
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2';
COMMIT; -- rollback

select * from bankaccounts;

/*
Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
N = 5=>5,4,3,2,1,
*/

DELIMITER $$
CREATE PROCEDURE repeat_proc()
BEGIN
DECLARE n INT DEFAULT 5;
DECLARE res VARCHAR(50) DEFAULT '';

REPEAT
SET res = CONCAT(res, ' ', n);
SET n = n - 1;
UNTIL n < 1
END REPEAT;
SELECT res;
END $$
DELIMITER ;

CALL repeat_proc();