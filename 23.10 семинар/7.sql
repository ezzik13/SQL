CREATE TABLE IF NOT EXISTS task3 (
    order_id int,
    client_id int,
	source text,
	create_date date,
	amount float,
    order_status text,
    payment_type text
);

INSERT INTO task3 VALUES
    (1,2,1, '2018-08-01',50,'Доставлен','Cash'),
    (2,1,1, '2018-08-02',60,'В пути','Card'),
    (3,2,1, '2018-08-03',70,'Отменен','Cash'),
    (4,1,1, '2018-08-04',80,'Доставлен','Card'),
    (5,2,1, '2018-08-05',90,'В пути','Cash'),
	(6,2,1, '2018-08-03',5,'Отменен','Card'),
	(7,2,1, '2018-08-03',10,'Отменен','Card');