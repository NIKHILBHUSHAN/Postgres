select (2.0::integer);
select (2);
select (2.0);
select (9999::smallint);
select (1.9999::real-1.9998::real);
select (1.9999::decimal-1.9998::decimal);

select ('njivoieurbvqo'::char(3));
select ('a'::char(3));
select ('njivoieurbvqo'::varchar(3));
select ('a'::varchar(3));
select ('feoqiwybfoqwiy'::text);

select ('true'::boolean);
select ('yes'::boolean);
select (1::boolean);
select ('t'::boolean);
select ('on'::boolean);

select ('false'::boolean);
select ('no'::boolean);
select ('0'::boolean);
select ('f'::boolean);
select ('off'::boolean);
select (null::boolean);

select ('Nov-20-1998'::date);
select ('Nov 20 1998'::date);
select ('Nov 20 ,1998'::date);
select ('1998-Nov-20'::date);
select ('1998-November-20'::date);

select ('01:23'::time);
select ('01:23pm'::time);
select ('01:23:55'::time without time zone);
select ('01:23 am ist'::time with time zone);
select ('01:23 am est'::time with time zone);
select ('01:23 am utc'::time with time zone);
select ('Nov-20-1998 1:23 AM utc'::timestamp with time zone);

select ('1 day'::interval);
select ('1 d'::interval);
select ('1 day 10h 30 m 45 s'::interval);
select ('1 day 10h 30 m 45 s'::interval) - ('1d'::interval);
select ('nov-20-1998 1:23 am est'::timestamp with time zone)-('4d'::interval);
select ('nov-20-1998 1:23 am est'::timestamp with time zone)-('nov-10-1998 1:23 am est'::timestamp with time zone);