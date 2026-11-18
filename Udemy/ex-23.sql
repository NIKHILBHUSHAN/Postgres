select (select max(price) from phones) as max_price,
(select min(price) from phones) as min_price,
(select avg(price) from phones) as avg_price;