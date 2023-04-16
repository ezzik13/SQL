use lesson_2;
create table orders(
id serial primary key,
employee_id varchar(5) not null,
amount float not null,
order_status varchar(15) not null
);
INSERT INTO orders(employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANSELLED');


select id,
	case order_status
		when 'OPEN' then 'Order is in open state'
		when 'CLOSED' then 'Order is closed'
		when 'CANSELLED' then 'Order is cancelled'
end as "full_order_status"
from orders;