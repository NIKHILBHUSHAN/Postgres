

select count(*) from users;

select id,username from users order by id desc limit 3;

select username,caption from users join posts on users.id=posts.user_id where users.id=200;

select username,count(*) from users join likes on users.id=likes.user_id group by users.username;

show data_directory;

select oid,datname from pg_database;

select * from pg_class;

select * from likes where created_at <'2013-01-01';

create index on users (username);
--a data structure where it tells where it is stored inn heap fill
drop index users_username_idx;

--without index:0.044 with index=0.33
explain analyze select * from users where username='Emil30';

select pg_size_pretty(pg_relation_size('users'));

--parser
--rewrite
--planner
--execute

--explain : build a query plan and display info about it
--explain analyze: build a query plan , run it, and info about it

select username,contents from users join comments on users.id=comments.user_id where username='Alyson14';
explain select username,contents from users join comments on users.id=comments.user_id where username='Alyson14';
explain analyze select username,contents from users join comments on users.id=comments.user_id where username='Alyson14';

select * from pg_stats where tablename='users';

explain select * from pg_stats where tablename='users';

select * from likes where created_at<'2013-01-01';
select count(*) from likes where created_at<'2013-01-01';

explain select * from likes where created_at<'2013-01-01';
--postgress decides heap scan

select * from likes where created_at>'2013-01-01';
select count(*) from likes where created_at>'2013-01-01';
explain select * from likes where created_at>'2013-01-01';
--postgres decides sequnetial scan

create index likes_created_at_idx on likes(created_at);

select users.username ,tags.created_at  from users 
join ( select user_id,created_at from caption_tags
	union all 
	select user_id,created_at from photo_tags
) as tags on tags.user_id=users.id where tags.created_at<'2010-01-07';

explain select users.username ,tags.created_at  from users 
join ( select user_id,created_at from caption_tags
	union all 
	select user_id,created_at from photo_tags
) as tags on tags.user_id=users.id where tags.created_at<'2010-01-07';

--rewriting the above expression as common table expression[CTE]
with tags as(
	select user_id,created_at from caption_tags
	union all 
	select user_id,created_at from photo_tags
)
select username,tags.created_at from users join tags 
on tags.user_id=users.id where tags.created_at<'2010-01-07';

explain with tags as(
	select user_id,created_at from caption_tags
	union all 
	select user_id,created_at from photo_tags
)
select username,tags.created_at from users join tags 
on tags.user_id=users.id where tags.created_at<'2010-01-07';

with recursive countdown(val) as(
	select 3 as val --intial
	union 
	select val-1 from countdown where val>1 --recursive
) 
select * from countdown;

with recursive suggestions(leader_id,follower_id,depth) as(
	select leader_id,follower_id ,1 as depth
	from followers
	where follower_id=1000
	union
	select followers.leader_id,followers.follower_id,depth+1
	from followers
	join suggestions on suggestions.leader_id=followers.follower_id
	where depth<3
)
select distinct users.id,users.username from suggestions 
join users on users.id=suggestions.leader_id where depth>1 limit 30;

select username,count(*)
from users join(
	select user_id from photo_tags union all select user_id from caption_tags
) as tags on tags.user_id=users.id
group by username order by count(*) desc;


create view tags as(
	select id,created_at,user_id,post_id,'photo_tag' as type from photo_tags
	union all
	select id,created_at,user_id,post_id,'caption_tag' as type from caption_tags
);

select * from tags;

select username,count(*)
from users join tags on tags.user_id=users.id
group by username order by count(*) desc;

create view recent_posts as (
	select * from posts order by created_at desc
);

select * from recent_posts;

create or replace view recent_posts as (
	select * from posts order by created_at desc limit 10
);

select username from recent_posts join users on  users.id=recent_posts.user_id;

drop view recent_posts;

select   *
from likes left join posts on posts.id=likes.post_id
left join comments on comments.id=likes.comment_id;

select  date_trunc('week',coalesce(posts.created_at,comments.created_at)) as week,
count(posts.id) as num_likes_for_posts,
count(comments.id) as num_likes_for_comments
from likes left join posts on posts.id=likes.post_id
left join comments on comments.id=likes.comment_id
group by week order by week;


--materialized view
create materialized view weekly_likes as(
select  date_trunc('week',coalesce(posts.created_at,comments.created_at)) as week,
count(posts.id) as num_likes_for_posts,
count(comments.id) as num_likes_for_comments
from likes left join posts on posts.id=likes.post_id
left join comments on comments.id=likes.comment_id
group by week order by week
)with data;

select * from weekly_likes;

delete from posts where created_at<'2010-02-01';

refresh materialized view weekly_likes;