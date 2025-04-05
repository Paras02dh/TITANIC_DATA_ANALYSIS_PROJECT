CREATE DATABASE titanic;
USE titanic;

CREATE table titanic(PassengerId INT PRIMARY KEY,
Survived INT,
passenger_class VARCHAR(20),
Name VARCHAR(100),
Sex VARCHAR(20),
Age INT,
SibSp INT,
Parch INT,
Ticket VARCHAR(50),
Fare FLOAT,
Embarked CHAR,
FamilySize INT,
AgeGroup VARCHAR(20)
);

-- select all data
SELECT*FROM titanic;

-- count total number of passengers
SELECT COUNT(*) AS total_passeneger 
FROM titanic;

-- Count the Number of Passengers by Survival Status
SELECT 
  CASE 
    WHEN survived = 1 THEN 'Survived'
    WHEN survived = 0 THEN 'Not Survived'
  END AS survival_status,
  COUNT(*) AS passenger_count
FROM titanic
GROUP BY survived;

-- Find the Average Age of Passengers
SELECT AVG(age) AS average_age
FROM titanic;

-- Find the Total Number of Passengers by Class
SELECT 
  CASE
      WHEN passenger_class="First class" THEN "First class"
      WHEN passenger_class="Second class" THEN "Second class"
      WHEN passenger_class="Third class" THEN "Third class"
	  END AS passenger_class,
       COUNT(*) AS passenger_count
FROM titanic
GROUP BY passenger_class;

/* Find the Number of Passengers Survived 
and Not Survived by Gender */
SELECT sex, survived,COUNT(*) AS passenger_survived
FROM titanic
GROUP BY sex,survived
ORDER BY sex;

--  Find the Maximum, Minimum, and Average Age of Passengers
SELECT MAX(age) AS max_age,MIN(age) AS min_age,AVG(age) AS avg_age
FROM titanic;

-- Find Passengers Who Are Older Than 60
SELECT * 
FROM titanic
WHERE age > 60;

/* Find the Number of Passengers Who Didn't Survive
 and Were in First Class */
SELECT COUNT(*) as passenger_count
FROM titanic
WHERE survived = 0 AND passenger_class = 1;

/* Find the Passengers Who Were Onboard and
 Paid the Highest Fare */
 SELECT *
 FROM titanic
 WHERE fare= (SELECT MAX(fare)
 FROM titanic);
 
 -- Find the Average Fare by Class
SELECT passenger_class,AVG(fare) AS avg_fare
FROM titanic
GROUP BY passenger_class;

--  Find the Number of Passengers by Embarked Location
SELECT 
      CASE
          WHEN embarked="S" THEN "S"
          WHEN embarked="Q" THEN "Q"
          WHEN embarked="C" THEN "C"
	  END AS embarked,
		COUNT(*) AS passenger_count
FROM titanic
GROUP BY embarked;

--  List the Names of Passengers Who Survived
SELECT name AS passenger_name
FROM titanic
WHERE survived=1;

-- Find Passengers Who Were Below 18 Years Old and Survived
SELECT name AS passenger_name,age,survived
FROM titanic
WHERE age<18 AND survived=1;

-- Get the Top 5 Passengers Who Paid the Most Fare
SELECT name,fare
FROM titanic
ORDER BY fare desc
LIMIT 5;

-- Find the Most Common Age (Mode) of Passengers
SELECT age, COUNT(*) as frequency
FROM titanic
GROUP BY age
ORDER BY frequency DESC
LIMIT 1;

-- Find the Number of Passengers Who Survived Based on Age Group
SELECT CASE 
           WHEN age < 18 THEN 'Under 18'
           WHEN age BETWEEN 18 AND 30 THEN '18-30'
           WHEN age BETWEEN 31 AND 50 THEN '31-50'
           WHEN age > 50 THEN 'Above 50'
       END as age_group,
       COUNT(*) as passenger_count
FROM titanic
WHERE survived=1
GROUP BY age_group, survived;

-- Find the Number of Passengers Who Not Survived Based on Age Group
SELECT CASE 
           WHEN age < 18 THEN 'Under 18'
           WHEN age BETWEEN 18 AND 30 THEN '18-30'
           WHEN age BETWEEN 31 AND 50 THEN '31-50'
           WHEN age > 50 THEN 'Above 50'
       END as age_group,
	   COUNT(*) as passenger_count
FROM titanic
WHERE survived=0
GROUP BY age_group, survived;

-- Find the Average Age and Fare by Gender
SELECT sex,AVG(age) AS avg_age,AVG(fare) AS avg_fare
FROM titanic
GROUP BY sex;



-- Find all female name and age from first class
SELECT name,age
FROM titanic
WHERE sex='female' and passenger_class='first class';

-- Count passengers by gender and class
SELECT passenger_class,sex,COUNT(*) AS passenger_count
FROM titanic
GROUP BY passenger_class,sex
ORDER BY passenger_class;

-- Age distribution in ranges
SELECT 
  CASE 
    WHEN age < 10 THEN '0-9'
    WHEN age BETWEEN 10 AND 19 THEN '10-19'
    WHEN age BETWEEN 20 AND 29 THEN '20-29'
    WHEN age BETWEEN 30 AND 39 THEN '30-39'
    WHEN age BETWEEN 40 AND 49 THEN '40-49'
    WHEN age BETWEEN 50 AND 59 THEN '50-59'
    WHEN age >= 60 THEN '60+'
    ELSE 'Unknown'
  END AS age_group,
  COUNT(*) AS passenger_count
FROM titanic
GROUP BY age_group
ORDER BY age_group;

-- Survival rate by class
SELECT passenger_class,
ROUND(AVG(survived) * 100, 2) AS survival_rate_percent
FROM titanic
GROUP BY passenger_class;

-- Survival rate by gender
SELECT sex,
ROUND(AVG(survived) * 100, 2) AS survival_rate_percent
FROM titanic
GROUP BY sex;

-- Passengers who paid more than 100 fare units and survived
SELECT name, fare, passenger_class, survived
FROM titanic
WHERE fare > 100 AND survived = 1
ORDER BY fare DESC;

-- Count of unique ticket numbers
SELECT COUNT(DISTINCT ticket) AS unique_ticket_count
FROM titanic;

-- Check if there are duplicate names
SELECT name, COUNT(*) AS occurrences
FROM titanic
GROUP BY name
HAVING COUNT(*) > 1;




