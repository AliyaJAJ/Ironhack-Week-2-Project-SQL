SELECT * 
FROM schoolsdata.comments;

SELECT * 
FROM schoolsdata.location;

SELECT * 
FROM schoolsdata.badges;

SELECT * 
FROM schoolsdata.courses;

ALTER TABLE schoolsdata.comments
ADD PRIMARY KEY (id);

SELECT * 
FROM schoolsdata.comments 
INNER JOIN schoolsdata.location
ON schoolsdata.comments.school = schoolsdata.location.school;

SELECT * 
FROM schoolsdata.location
INNER JOIN schoolsdata.courses
ON schoolsdata.location.school = schoolsdata.courses.school;

SELECT * 
FROM schoolsdata.courses
INNER JOIN schoolsdata.comments
ON schoolsdata.courses.school = schoolsdata.comments.school;

ALTER TABLE schoolsdata.badges
MODIFY COLUMN school VARCHAR(50);

ALTER TABLE schoolsdata.comments
MODIFY COLUMN school VARCHAR(50);

ALTER TABLE schoolsdata.courses
MODIFY COLUMN school VARCHAR(50);

ALTER TABLE schoolsdata.location
MODIFY COLUMN school VARCHAR(50);

ALTER TABLE schoolsdata.comments
ADD CONSTRAINT foreign_1
FOREIGN KEY (school)
REFERENCES schools.badges(school);

ALTER TABLE schoolsdata.comments
ADD CONSTRAINT foreign_4
FOREIGN KEY (school)
REFERENCES schools.courses(school);

ALTER TABLE schoolsdata.comments
ADD CONSTRAINT foreign_5
FOREIGN KEY (school)
REFERENCES schools.location(school);

ALTER TABLE schoolsdata.courses
ADD CONSTRAINT foreign_2
FOREIGN KEY (school)
REFERENCES schools.badges(school);

ALTER TABLE schoolsdata.courses
ADD CONSTRAINT foreign_3
FOREIGN KEY (school)
REFERENCES schools.location(school);

ALTER TABLE schoolsdata.courses
ADD CONSTRAINT foreign_6
FOREIGN KEY (school)
REFERENCES schools.comments(school);

ALTER TABLE schoolsdata.location
ADD CONSTRAINT foreign_7
FOREIGN KEY (school)
REFERENCES schools.comments(school);

ALTER TABLE schoolsdata.location
ADD CONSTRAINT foreign_8
FOREIGN KEY (school)
REFERENCES schools.courses(school);

ALTER TABLE schoolsdata.location
ADD CONSTRAINT foreign_9
FOREIGN KEY (school)
REFERENCES schools.badges(school);

/**/


#SCHOOLS
SELECT distinct school
FROM schoolsdata.courses;

#AVERAGE OVERALL SCORES FOR EACH SCHOOL, RANKED FROM HIGHEST
SELECT school, AVG(overallScore)
FROM schoolsdata.comments
GROUP BY school
ORDER BY AVG(overallScore) DESC;

#AVERAGE OVERALL SCORES FOR DATA ANALYTICS PROGRAM
SELECT school,  AVG(overallScore)
FROM schoolsdata.comments
WHERE program LIKE 'Data An%'
GROUP BY school
ORDER BY AVG(overallScore) DESC;

#LOCATION OPTIONS (INCLUDING ONLINE) FOR EACH SCHOOL
SELECT school, COUNT(CONCAT(city_name, ', ' ,country_name)) AS location
FROM schoolsdata.location
GROUP BY school
ORDER BY location DESC;

#CHANGE IN SCORE FOR THE DATA ANALYTICS PROGRAM AT IRONHACK IN 2023
SELECT queryDate as year_of_query, AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'ironhack' and queryDate LIKE '2023%' and program LIKE 'Data An%'
GROUP BY year_of_query;

#AVERAGE OVERALLSCORE FOR THE DATA ANALYTICS PROGRAM FOR ALL SCHOOLS IN 2023

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'ironhack' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2023-01-01' AND '2023-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'springboard' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2023-01-01' AND '2023-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'brainstation' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2023-01-01' AND '2023-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'udacity' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2023-01-01' AND '2023-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'general-assembly' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2023-01-01' AND '2023-12-31';


#AVERAGE OVERALLSCORE FOR THE DATA ANALYTICS PROGRAM FOR ALL SCHOOLS IN 2023

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'ironhack' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2022-01-01' AND '2022-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'springboard' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2022-01-01' AND '2022-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'brainstation' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2022-01-01' AND '2022-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'udacity' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2022-01-01' AND '2022-12-31';

SELECT AVG(overallScore) AS avg_score 
FROM schools.comments 
WHERE school LIKE 'general-assembly' 
AND program LIKE 'Data An%' 
AND queryDate BETWEEN '2022-01-01' AND '2022-12-31';


#NUMBER OF REVIEWS FOR DATA ANALYTICS PROGRAM FOR EACH SCHOOL

SELECT program, count(*) AS total_reviews_program
FROM schools.comments
where program LIKE 'Data An%'
AND school = 'ironhack'
GROUP BY program
ORDER BY total_reviews_program;

SELECT program, count(*) AS total_reviews_program
FROM schools.comments
where program LIKE 'Data An%'
AND school = 'app-academy'
GROUP BY program
ORDER BY total_reviews_program;

SELECT program, count(*) AS total_reviews_program
FROM schools.comments
where program LIKE 'Data An%'
AND school = 'springboard'
GROUP BY program
ORDER BY total_reviews_program;

SELECT program, count(*) AS total_reviews_program
FROM schools.comments
where program LIKE 'Data An%'
AND school = 'brainstation'
GROUP BY program
ORDER BY total_reviews_program;

SELECT program, count(*) AS total_reviews_program
FROM schools.comments
where program LIKE 'Data An%'
AND school = 'udacity'
GROUP BY program
ORDER BY total_reviews_program;

SELECT program, count(*) AS total_reviews_program
FROM schools.comments
where program LIKE 'Data An%'
AND school = 'general-assembly'
GROUP BY program
ORDER BY total_reviews_program;
