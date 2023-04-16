use lesson_2;
create table sales(
id serial primary key,
order_date date not null,
count_product int not null
);
INSERT INTO sales(order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
SELECT * FROM sales;

select id,
	case
		when  count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
		WHEN count_product > 300 THEN "Большой заказ"
end as "Тип заказа"
from sales;