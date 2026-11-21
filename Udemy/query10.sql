create table posts(
	id serial primary key,
	url varchar(45),
	lat numeric,
	lng numeric
);
alter table posts add column loc point;

select * from posts;

begin;
update posts set lat=2 where id=1;
commit;

update posts set loc=point(lng,lat) where loc is null;

alter table posts drop column lat,drop column lng;

create table users(
	id serial primary key,
	created_at timestamp with time zone default current_timestamp,
	updated_at timestamp with time zone default current_timestamp,
	bio varchar(30),
	username varchar(30) not null
);