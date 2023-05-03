use lesson_6;
/*
1.
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
2.
Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/


-- 1
DELIMITER //
CREATE FUNCTION func1(n INT)

RETURNS VARCHAR(100)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
DECLARE seconds INT DEFAULT 0;
DECLARE minutes INT DEFAULT 0;
DECLARE hours INT DEFAULT 0;
DECLARE days INT DEFAULT 0;
DECLARE res VARCHAR(255) DEFAULT '';

SET minutes = n / 60;
if minutes*60 > n then
	SET minutes = minutes - 1;
end if;
SET seconds = n - (minutes * 60);
SET hours = minutes / 60;
if hours * 60 > minutes then
	SET hours = hours - 1;
end if;
SET minutes = minutes - (hours * 60);
SET days = hours / 24;
if days * 24 > hours then
	SET days = days - 1;
end if;
SET hours = hours - (days * 24);

if days > 0 then
	SET res = CONCAT(res, days, ' days');
END IF;
if hours > 0 then
	SET res = CONCAT(res, hours, ' hours');
END IF;
if minutes > 0 then
	SET res = CONCAT(res, minutes, ' minutes');
END IF;
if seconds > 0 then
	SET res = CONCAT(res, seconds, ' seconds');
END IF;
RETURN res;

END //
DELIMITER ;
select func1(123456);
-- 2
DELIMITER //
CREATE FUNCTION func2(n INT)

RETURNS VARCHAR(100)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
DECLARE n1 INT DEFAULT 2;
DECLARE res VARCHAR(255) DEFAULT '2';

WHILE n1 < n DO
SET n1 = n1 + 2;
SET res = CONCAT(res, ', ', n1);
END WHILE;

RETURN res;
END //
DELIMITER ;
select func2(10);

