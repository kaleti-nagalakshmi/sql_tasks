-- PART-1 CREATE DATA 
CREATE DATABASE TFI_DATABASE;
USE TFI_DATABASE;
-- Part 1 — Create the Database 
create table movies(
movie_id int,
title varchar(20),
release_date date,
language varchar(30),
genre varchar(50),
budget decimal(12,2),
box_office decimal(12,2),
rating decimal(3,1)
);
create table actors(
actor_id int,
actor_name varchar(20),
date_of_birth date,
debut_year year
);
create table producers(
producer_id int,
producer_name varchar(20),
production_house varchar(100)
);
create table genre(
genre_id int,
genre_name varchar(20),
description date

);
create table directors(
director_id int,
director_name varchar(20),
date_of_birth date,
debut_year year
);
-- part-3
alter table movies
add runtime_minutes int;

alter table actors
add phone varbinary(15);

alter table movies
rename column language to movie_language;

alter table movies
modify column rating decimal(4,2);

alter table genre
drop column description;

alter table genre
add awards_count int;

rename tables actors to tfi_actors;
rename tables directors to tfi_directors;

create temporary table test_movies(
movie_id int,
title varchar(100)
);
truncate table test_movies;
drop table test_movies;

-- challenge 1:
-- alter table table_name 
-- rename coiumn movie_details to movies;

-- challenge 2:
-- alter table table_name
-- add music_director varchar(100);
-- challenge  3 :
-- alter table  tfi_actors
-- drop column phone;

-- challenge  4 :
-- drop column test_movies;
























































