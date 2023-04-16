use lesson_1;
select * from phons;
select product_name, manufactured, price from phons
where product_count > 2;
select * from phons
where manufactured = 'Samsung';
select * from phons
where product_name like 'Galaxy%';
select * from phons
where product_name like 'iPhone%';
select * from phons
where product_name like '%8%';
select * from phons
where product_name REGEXP '[0-9]';