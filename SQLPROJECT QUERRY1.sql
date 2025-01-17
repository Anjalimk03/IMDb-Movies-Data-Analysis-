-- 1) can you get all data about movies? --  
SELECT * FROM movies;

-- 2) how do you get all data about directors? --
SELECT * FROM directors;

-- 3) check how many movies are present in IMDB --
SELECT COUNT(*) AS TOTALMOVIES FROM movies;

-- 4) find these three directors: James Cameron,Luc Besson,John Woo --
SELECT * FROM directors WHERE NAME IN('James Cameron','Luc Besson','John Woo');

-- 5) find all directors with name starting with s --
SELECT * FROM directors WHERE NAME LIKE 's%';

-- 6) count female directors --
SELECT COUNT(*) AS FEMALEDIRECTORS FROM directors WHERE GENDER=1;

-- 7) find the name of the 10th first women directors? --
SELECT NAME FROM directors WHERE GENDER =1 ORDER BY NAME LIMIT 1 OFFSET 9;

-- 8) what are the 3 most popular movies? --
SELECT ORIGINAL_TITLE, POPULARITY FROM movies ORDER BY POPULARITY DESC LIMIT 3;

-- 9) what are the 3 most bankable movies? --
SELECT ORIGINAL_TITLE, REVENUE FROM movies ORDER BY REVENUE DESC LIMIT 3;

-- 10) what is the most awarded average vote since the jaunuary 1st,2000? --
SELECT ORIGINAL_TITLE, VOTE_AVERAGE, VOTE_COUNT FROM movies WHERE RELEASE_DATE>='2000-01-01' ORDER BY VOTE_AVERAGE DESC, VOTE_COUNT DESC LIMIT 1;

-- 11) which movie(s) were directed by Brenda Chapman? --
SELECT M.ORIGINAL_TITLE FROM movies AS M JOIN directors AS D ON M.DIRECTOR_ID=D.ID WHERE D.NAME='Brenda Chapman';

-- 12) which director made the most movies
SELECT D.NAME,COUNT(M.ID) AS MOVIE_COUNT FROM movies AS M INNER JOIN directors AS D ON M.DIRECTOR_ID=D.ID GROUP BY D.NAME ORDER BY MOVIE_COUNT DESC;

-- 13) which director is most bankable? --
SELECT D.NAME,SUM(M.REVENUE) AS SUM_REVENUE FROM movies AS M INNER JOIN directors AS D ON M.DIRECTOR_ID=D.ID GROUP BY D.NAME ORDER BY SUM_REVENUE DESC LIMIT 1;