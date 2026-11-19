select count(*) from users;

select id,username from users order by id desc limit 3;

select username,caption from users join posts on users.id=posts.user_id where users.id=200;

select username,count(*) from users join likes on users.id=likes.user_id group by users.username;

show data_directory;

select oid,datname from pg_database;

select * from pg_class;