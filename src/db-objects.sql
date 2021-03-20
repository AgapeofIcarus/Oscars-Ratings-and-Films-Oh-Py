create database ohpydb
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8';
 
--create tables under ohpydb schema

create table award_categories(
	category_id serial not null primary key,
	category_name varchar(100) not null,
	subcategory_name varchar(100),
	description varchar(200),
	constraint award_categories_uk unique (category_name, subcategory_name)
);

create table nominees(
	nominee_id serial not null primary key ,
	first_name varchar(100) not null,
	last_name varchar(100),
	date_of_birth date,
	description varchar(100)
);

create table genres_types (
	type_id serial not null primary key,
	genres varchar(100), 
	constraint genres_types_u1 unique (genres)
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
	first_genre int,
	second_genre int,
	third_genre int,
	fourth_genre int,
	fifth_genre int,
	sixth_genre int,
	seventh_genre int,
	eigth_genre int,
    constraint film_fk1 foreign key(nominee_id) references nominees(nominee_id),	
    constraint film_fk2 foreign key(first_genre) references genres_types(type_id),		
    constraint film_fk3 foreign key(second_genre) references genres_types(type_id),	
	constraint film_fk4 foreign key(third_genre) references genres_types(type_id),	
	constraint film_fk5 foreign key(fourth_genre) references genres_types(type_id),	
	constraint film_fk6 foreign key(fifth_genre) references genres_types(type_id),	
	constraint film_fk7 foreign key(sixth_genre) references genres_types(type_id),	
	constraint film_fk8 foreign key(seventh_genre) references genres_types(type_id)	,
	constraint film_fk9 foreign key(eigth_genre) references genres_types(type_id)	 
);
 
create table academy_awards(
 year varchar(5) not null,
 category_id int not null,
 film_id int, --not null,
 nominee_id int,
 winner boolean default 'N',
 description varchar(100),
 constraint awards_fk1 foreign key(category_id) references award_categories(category_id),
 constraint awards_fk2 foreign key(film_id) references films(film_id),	 
 constraint awards_fk3 foreign key(nominee_id) references nominees(nominee_id)	
);
  