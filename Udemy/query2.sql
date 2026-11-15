create table users(
  id serial primary key,
  username varchar(50)
);
insert into users(username) values('nikhil'),('akhil'),('ajay'),('vikram');
select * from users;

create table photos(
  id serial primary key,
  url varchar(20),
  --user_id integer references users(id) on delete cascade
  --user_id integer references users(id) on delete set NULL
  user_id integer references users(id) on delete set default 

);

insert into photos(url,user_id) 
values('http:/one.jpg', 4),
('http:/two.jpg', 1),
('http:/25.jpg', 1),
('http:/36.jpg', 1),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);
select * from photos;

select * from photos where user_id=2;

select * from photos join users on users.id=photos.user_id;
select url,username from photos join users on users.id=photos.user_id;

insert into photos(url,user_id) 
values('one.jpg',NULL);

select * from photos;



delete from users where id=4;

select * from photos;



