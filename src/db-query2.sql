select * from award_categories

select * from genres_types

select * from nominees

insert into nominees values (7, 'Christopher', 'Nolan', null, '')
  
select * from films  

select * from academy_awards
 
insert into films
values(1, 'Inception', to_date('2010', 'YYYY'), 7, 8.8, 87, 'true', 'false', 'false', 'false',
	   1, 2, 3, null, null, null, null, null
	  )

insert into academy_awards
 values('2010', 7, 1, 7, 'True', '')
	  

select aa.year, aa.category_id, ac.category_name, ac.subcategory_name, aa.winner,
	   aa.film_id, fl.film_name, fl.release_date, 
	   fl.nominee_id director_id, nm2.first_name director_first_name, nm2.last_name director_last_name,
	   fl.imdb_score, fl.rotten_tomatoes_score,
	   fl.service1 netflix_service, fl.service2 hulu_service,
	   fl.service3 prime_video_service, fl.service4 disnep_service,
	   aa.nominee_id, nm.first_name, nm.last_name,
	   fl.first_genre, fl.second_genre, fl.third_genre, fl.fourth_genre, fl.fifth_genre, fl.sixth_genre, 
	   fl.seventh_genre, fl.eigth_genre
  from academy_awards aa left join award_categories ac on aa.category_id = ac.category_id
  						 left join nominees nm on aa.nominee_id = nm.nominee_id
  	   					 left join films fl on aa.film_id = fl.film_id  
						 left join nominees nm2 on fl.nominee_id = nm2.nominee_id
where fl.film_id = 1



insert into genres_types 
values (3, 'Sci-Fi')


insert into academy_awards 
values('2014', 5, 2, null, False, '')

insert into award_categories
values (6, 'COSTUME DESIGN', '', '')

insert into films 
values(2, 'How to Train Your Dragon 2', null)

insert into nominees 
values (5, 'Meryl', 'Streep', null, '')
 