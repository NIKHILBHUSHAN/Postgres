CREATE TABLE city (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);
INSERT INTO city VALUES('Delhi','India',2000000,2500);
INSERT INTO city VALUES('Newyork','Us',240000,1500);
INSERT INTO city VALUES('Paris','Europe',100000,10000);
INSERT INTO city VALUES('Dubai','Europe',2000000,2900);

SELECT * FROM city;

SELECT name,country FROM city;

SELECT name,population/area AS populationdensity FROM city;

SELECT name ||', '|| country AS location FROM city;

SELECT CONCAT(name,',',country) AS location FROM city;

SELECT CONCAT(UPPER(name),',',LOWER(country)) AS location FROM city;

SELECT name,area FROm city where area>2000;

SELECT name,area FROm city where area=2500;

SELECT name,area FROm city where area!=2500;

SELECT name,area FROm city where area<2000;

SELECT name,area FROm city where area BETWEEN 2000 AND 4000;

SELECT name,area FROm city where name IN ('Delhi','Dubai');


