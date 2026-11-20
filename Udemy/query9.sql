create table account(
	id serial primary key,
	name varchar(20) not null,
	balance integer not null
);

insert into account(name,balance) values
('Gia',100),('alyson',100);

select * from account;

begin;
update account set balance=balance-50 where name ='alyson';
select * from account;
commit;


update account set balance=100;

begin;
update account set balance=balance-50 where name ='alyson';
select * from account;
--if any error in session postgres won't commit it automatically rollback 

begin;
select * from nwoghwighuwr;
select * from account;
rollback;
select * from account;
