# Oscars,Ratings,and Films-Oh Py!
![img1](Images/Img1.jpg)

## Background

It seems like a bygone activity of yesteryear, but yes people did once go to movie theaters. With the advent of streaming services and, well Covid, most of us have been enjoying films from the comfort of our couch, but there are so many options! How do we know if what we select is “quality” and if something is “quality” is it something that we actually want to watch?

In this project, the team performed ETL on data extracted from an Academy Awards Database and a Streaming Services database to capture information that would enable us to determine: 
e: 

* Do award winning films actually have high user ratings?
* Do awards impact film popularity on streaming services?
* Do award winning directors receive higher ratings?
* Do films with winning soundtracks have higher popularity?

## Extraction  

The first dataset was extracted from Kaggle.com in CSV.  This data included details on movie titles, user ratings, streaming services supporting the film, director, and release year, genres, and runtime. 

The team leveraged DataHub for the second dataset extraction in JSON format.  This data set provided details year, award category, winner (T/F), and winner name.  

Both datasets were downloaded and imported into Python for cleaning. 

* https://www.kaggle.com/ruchi798/movies-on-netflix-prime-video-hulu-and-disney
* https://datahub.io/rufuspollock/oscars-nominees-and-winners

## Transformation

### Summary of Streaming Data Cleanse

* Drop empty columns
* Remove rows that did not contain rating information
* Split First and Second Director, drop any additional director information
* Split Location cell into Primary and Secondary Location, drop other locations
* Split Language into Primary and Secondary Language, drop other languages
* Split Genres into eight separate columns
* Convert streaming services cells to Booleans

### Challenges
The greatest challenge of the Streaming Data was that several cells contained multiple data points separated by commas. Some of these cells were not applicable for the team's analysis, thus the decision was made to drop any additional data elements 
post the primary and secondary listing.  The exception being the genres information which was split and added to eight new genre 
columns.

## Awards Data Cleanse:
* Identify unique fields;
* Combine data with similar music categories;
* Combine data with similar short film categories;
* Combine data with similarities for cinematography, art direction;
* Identify winning actors;
* Remove “year_ceremony” and “ceremony” columns;
* Identify winning best pictures.

### Challenges
This data set had the opposite challenge where there were several columns containing similar categories.  This level of detail was not required for the team’s assessment and therefore the data was merged.  

## Data Joins

As the team progressed through the initial dataset, we found that it would be difficult to join to the other dataset, so a new source file was used which listed film titles. The new data set contained the Academy Award Winners plus the film name for which they were nominated.  This was critical as the data could now be joined on film name.   

The introduction of the third data set with film names as a common identifier allowed for the construction of an ERD to assist relational database table design.

The ERD supported the construction of five tables which were created in PGAdmin.  Primary and Foreign keys established for category_id, nominee_id, film_id. 

These tables would allow an individual to perform the analysis required to answer the team’s original questions by merging and calling the data as required.  

## Load

The data was loaded into a relational database because the team wanted to be able to make comparisons between the two data sources using commonalities such as film name.  The team approached data loading by enhancing the original cleaning code to include loading elements. The original code was then updated to ensure consistency with the PGAdmin tables by renaming headers where appropriate. Indexes were also applied to align to the database tables. Additional Python code was also created to assist in data insert. The combination of these coding elements culminated in successful data insert into the database tables. 


UNCC Data Analytics Bootcamp Project for ETL- Based on the concept of oscars and successful films on streaming services.
