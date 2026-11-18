create table products(
	id serial primary key,
	name varchar(40),
	department varchar(40),
	price integer,
	weight integer
);
insert into products(name,department,price,weight)
values('shirt','clothes',20,1);

insert into products(name,department,weight)
values ('pants','clothes',3);

update products set price=9999 where price is null;
alter table products alter column price set not null;

alter table products alter column price set default 999;
insert into products(name,department,weight)
values ('shorts','clothes',3); --default value

insert into products(name,department,price,weight)
values('shirt','clothes',20,1);--same product

alter table products add unique(name);

insert into products(name,department,price,weight)
values('shirt','clothes',20,1);--same product

alter table products drop constraint products_name_key;--delete a constraint

alter table products add unique(name,department);

insert into products (name,department,price,weight)
values('shorts','clothes',25,9);--same name and product

alter table products add check (price>0);
insert into products (name,department,price,weight)
values('saree','clothes',0,9);--violates check

create table orders (
	id serial primary key,
	name varchar(40) not null,
	created_at timestamp not null,
	est_delivery timestamp not null,
	check (created_at<est_delivery)
);
insert into orders(name,created_at,est_delivery)
values('shirt','2000-nov-20 01:00am','2000-nov-20 01:00am');--violates check

insert into orders(name,created_at,est_delivery)
values('shirt','2000-nov-20 01:00am','2000-nov-25 01:00am');






