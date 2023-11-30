select * from dbo.athlete_events


-- How many olympics games have been held?
select count (distinct games) from dbo.athlete_events

-- List down all Olympics games held so far.

select distinct games from dbo.athlete_events
order by games

-- Mention the total no of nations who participated in each olympics game?

select distinct games, count ( distinct noc) from dbo.athlete_events
group by games
order by games 

-- Identify the sport which was played in all summer olympics.

WITH t1 AS (
    SELECT COUNT(DISTINCT games) AS total_summer_games
    FROM dbo.events
    WHERE season = 'Summer'
),
t2 AS (
    SELECT DISTINCT sport, games
    FROM dbo.events
    WHERE season = 'Summer'
),
t3 AS (
    SELECT sport, COUNT(games) AS no_of_games
    FROM t2
    GROUP BY sport
)
SELECT *
FROM t3
JOIN t1 ON t1.total_summer_games = t3.no_of_games;



-- Fetch the top 5 athletes who have won the most gold medals.

with t1 as (
    select TOP 5 name, count (medal) as gold_medal
    from dbo.events
    where medal = 'Gold'
    group by name 
    order by count(medal) desc),
t2 as 
    (select *, dense_rank() over(order by gold_medal desc) as rnk 
    from t1)
select *
from t2

-- Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).

select name, count(medal)
from new_schema.athlete_events
where medal IN ('Gold', 'Silver', 'Bronze')
group by name 
order by count(medal) desc
LIMIT 5

-- Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.

select team, count(medal)
from dbo.events
where medal IN ('Gold', 'Silver', 'Bronze')
group by team 
order by count(medal) desc
LIMIT 5


-- In which Sport/event, India has won highest medals.

select * from dbo.events

Break down all olympic games where india won medal for select * from dbo.events
Hockey and how many medals in each olympic games.


--Retrieve all columns for the athlete with ID 1.

select name, age, team, games, year, season, sport, medal
from new_schema.athlete_events
where ID = 1

-- List the distinct names of all male athletes

select distinct name from new_schema.athlete_events
where sex = 'M'

-- Count the number of female athletes.

select count(distinct name) 
from new_schema.athlete_events
where sex = 'F'

-- Find the average age of all athletes.

alter table new_schema.athlete_events
alter column Age int

UPDATE new_schema.athlete_events
SET Age = 0
WHERE Age = 'NA';

select AVG(age)
from new_schema.athlete_events


-- Retrieve all gold medalists.

select * from new_schema.athlete_events

select distinct name, medal
from new_schema.athlete_events
where medal = 'Gold'

-- List the unique teams in the dataset.

select distinct team 
from new_schema.athlete_events

-- Count the number of athletes in the 1992 Summer Olympics.

select count(distinct name)
from new_schema.athlete_events
where games = '1992 Summer'


-- List the cities where the Winter Olympics were held.

select * from dbo.events

select distinct city
from new_schema.athlete_events
where season = 'Winter'

-- Find the tallest athlete.
select name, team, sport, MAX(height) as MaxHeight
from new_schema.athlete_events
where height <> 'NA'
group by name, team, sport
order by MaxHeight DESC


-- Retrieve athletes who participated in Basketball.

select distinct name, sport, year
from new_schema.athlete_events
where sport = 'Basketball'
group by year, sport, name


-- Count the total number of medals.
select * from new_schema.athlete_events

select count(medal)
from new_schema.athlete_events
where medal <> 'NA'


-- List the different sports in the dataset.

select distinct sport 
from new_schema.athlete_events


-- Find the athlete with the most medals.

select * from new_schema.athlete_events

select name, count(medal)
from new_schema.athlete_events
where medal <> 'NA'
group by name
order by count(medal) desc

-- Count the number of athletes from China.

select count(distinct name), team
from new_schema.athlete_events
where team = 'China'

-- List all unique combinations of season and year.

select distinct year, season
from new_schema.athlete_events
group by year, season
order by year 

-- Retrieve the names of athletes who won a gold medal.
select distinct name, medal
from new_schema.athlete_events
where medal = 'Gold'


-- Calculate the average age of male and female athletes separately.

select * from new_schema.athlete_events

select AVG(age), sex
from new_schema.athlete_events
group by sex

-- Find the athlete with the most gold medals.

select name, Count(*) as most_gold_medals
from new_schema.athlete_events
where medal = 'Gold'
group by name, medal
order by most_gold_medals desc
LIMIT 1


-- List the athletes who participated in both the Summer and Winter Olympics.

select * from new_schema.athlete_events

select name
from new_schema.athlete_events
where season IN('Winter','Summer')
group by name
HAVING count(distinct season) = 2


-- Calculate the total number of medals won by each team.

select team, count(*) as total_medals
from new_schema.athlete_events
where medal is not null
group by team 
order by total_medals desc

-- Retrieve the athletes who won medals in Basketball in the 1992 Summer Olympics.

select distinct name
from new_schema.athlete_events
where games = '1992 Summer' and sport = 'Basketball' and medal IN ('Gold', 'Siver', 'Bronze')


-- Find the teams that won medals in Football.

select distinct team, sport, medal
from new_schema.athlete_events
where sport = 'Football' and medal in('Gold', 'Silver', 'Bronze')


-- List the athletes who won medals in events with "Skating" in the name.

select * from new_schema.athlete_events

select name, year, event, medal
from new_schema.athlete_events
where sport like '%Skating%' and medal in ('Gold', 'Silver', 'Bronze')


-- Calculate the average height and weight of athletes who won gold medals.

select AVG(height), AVG(weight)
from new_schema.athlete_events
where medal = 'Gold'


-- Retrieve the athletes who participated in the most number of Olympics.

WITH AthleteOlympicsCount AS (
    SELECT name, COUNT(DISTINCT CONCAT(year, season)) AS olympics_count
    FROM new_schema.athlete_events
    GROUP BY name
)

SELECT name, olympics_count
FROM AthleteOlympicsCount
WHERE olympics_count = (SELECT MAX(olympics_count) FROM AthleteOlympicsCount);


-- Find the teams with the most medals in the Summer Olympics.

select * from new_schema.athlete_events

select team, count(medal) as most_medals
from new_schema.athlete_events
where season = 'Summer'
group by team
order by most_medals desc

-- List the athletes who won medals in the 1920 Summer Olympics in Antwerpen.

select name, medal as medalists
from new_schema.athlete_events
where games = '1920 Summer' AND city = 'Antwerpen' AND medal <> 'NA'


-- Calculate the average age of medalists.

select AVG(age)
from new_schema.athlete_events
where medal <> 'NA'

-- Find the athletes who won a medal in the most recent Olympics.

with t1 as (select distinct name, medal, year, games
from new_schema.athlete_events
where medal IN ('Gold', 'Silver', 'Bronze') and games = '2016 Summer'
order by year desc),

t2 as (select count(*) from t1)

select * from t2

-- List the athletes who participated in the most number of different sports.

WITH AthleteSportCount AS (
    SELECT name, COUNT(DISTINCT sport) AS sport_count
    FROM new_schema.athlete_events
    GROUP BY name
)

SELECT name, sport_count
FROM AthleteSportCount
WHERE sport_count = (SELECT MAX(sport_count) FROM AthleteSportCount);


-- List the top 10 teams with the most gold medals.

select * from new_schema.athlete_events

select team, count(medal) as medals
from new_schema.athlete_events
group by team
order by medals desc
LIMIT 10

-- Retrieve the cities where the Winter Olympics were held between 1960 and 1980.

select distinct year, season, city
from new_schema.athlete_events
where year between 1960 and 1980 AND season = 'Winter'
order by year desc

-- Find the athlete who has participated in the most Olympic events.

WITH AthleteEventCount AS (
    SELECT name, COUNT(DISTINCT CONCAT(year, season, sport, event)) AS event_count
    FROM new_schema.athlete_events
    GROUP BY name
)

SELECT name, event_count
FROM AthleteEventCount
WHERE event_count = (SELECT MAX(event_count) FROM AthleteEventCount);


-- Calculate the average age of male and female athletes who won gold medals.

select * from new_schema.athlete_events

select AVG(age)
from new_schema.athlete_events
where medal = 'Gold'
group by sex




