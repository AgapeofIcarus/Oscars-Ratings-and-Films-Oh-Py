create database ohpydb
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8';
 
--create tables under ohpydb schema 

create table award_categories(
	category_id serial not null primary key,
	category_name varchar(100) not null,
	subcategory_name varchar(100) 
	constraint award_categories_uk unique (category_name, subcategory_name)
);
 
create table nominees(
	nominee_id serial not null primary key ,
	nominee_name varchar(100) not null 
);
     
create table films(
	film_id serial not null primary key ,
	film_name varchar(100) not null,
	release_date date,
	nominee_id int,  --for director names
	imdb_score int ,
	rotten_tomatoes_score int,
	service1 boolean, --Netflix			
	service2 boolean, --Hulu
	service3 boolean, --Prime Video
	service4 boolean, --Disney+
	first_genre varchar2(100),
	second_genre varchar2(100),
	third_genre varchar2(100),
	fourth_genre varchar2(100),
	fifth_genre varchar2(100),
	sixth_genre varchar2(100),
	seventh_genre varchar2(100),
	eigth_genre varchar2(100)
    --constraint film_fk1 foreign key(nominee_id) references nominees(nominee_id) 
);
  
create table academy_awards(
 year varchar(5) not null,
 category_id int not null,
 film_id int, --not null,
 nominee_id int,
 winner boolean default 'N', 
 constraint awards_fk1 foreign key(category_id) references award_categories(category_id),
 constraint awards_fk2 foreign key(film_id) references films(film_id),	 
 constraint awards_fk3 foreign key(nominee_id) references nominees(nominee_id)	
);
  