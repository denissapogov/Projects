select * from new_schema.athlete_events

-- List the athletes who have won the most medals in total.

select name, count(medal)
from new_schema.athlete_events
where medal IS NOT NULL
group by name
order by count(medal) desc

-- Calculate the average age of medal-winning athletes in each sport.

select AVG(age), sport
from new_schema.athlete_events
where medal IS NOT NULL
group by sport
order by AVG(age) desc

-- Find the countries with the highest and lowest average athlete ages.

with t1 as (select team, AVG(Age) as average_age
from new_schema.athlete_events
where Age <> 'NA'
group by team
order by average_age desc)

SELECT MAX(average_age) as max_age, MIN(average_age) as min_age from t1

-- List the athletes who won gold medals in multiple events during the same Olympic games.

select distinct sport, name, games, season, count(*)
from new_schema.athlete_events
where medal = 'Gold' 
group by name, games, season, sport
order by count(*) desc

-- Calculate the average height and weight of medal-winning athletes by gender.

select * from new_schema.athlete_events

select AVG(height), AVG(weight)
from new_schema.athlete_events
where medal <> 'NA'
group by sex


-- Find the youngest and oldest athletes to win gold medals.

select MIN(age) as min_age, MAX(age) as max_age
from new_schema.athlete_events
where medal = 'Gold'


-- List the countries that have won at least one medal in every Olympic event they participated in.

WITH MedalCounts AS (
    SELECT
        team,
        COUNT(DISTINCT CONCAT(year, season, sport, event)) AS total_events_participated,
        COUNT(DISTINCT CASE WHEN medal IS NOT NULL THEN CONCAT(year, season, sport, event) END) AS total_events_with_medals
    FROM new_schema.athlete_events
    WHERE medal IS NOT NULL
    GROUP BY team
)

SELECT team
FROM MedalCounts
WHERE total_events_participated = total_events_with_medals;


-- Retrieve the athletes who have won medals in both the Summer and Winter Olympics.

with SummerMedalists as (
		select distinct id, name 
		from new_schema.athlete_events
		where season = 'Summer' and medal IS NOT NULL
),

WinterMedalists as (
		select distinct id, name 
		from new_schema.athlete_events
		where season = 'Winter' and medal IS NOT NULL 
)

select S.id, S.name
from SummerMedalists S
INNER JOIN WinterMedalists W on S.id = W.id


-- List the sports that have had the most ties (events with no medal awarded).

select * from new_schema.athlete_events

select event, count(medal)
from new_schema.athlete_events
where medal = 'NA'
group by event
order by count(medal) desc

-- Calculate the percentage of athletes who have won multiple gold medals.

select * from new_schema.athlete_events

with t1 as (select count(distinct id) as aaa
			from new_schema.athlete_events),
            
t2 as (select count(*) as bbb
	   from new_schema.athlete_events
       where medal = 'Gold'
       having count(medal) > 1
)

select (t2.bbb/t1.aaa)*100 as Percentage_of_athletes
from t1, t2


-- List the countries that have won medals in the most distinct sports.

select count(distinct sport), team, count(medal)
from new_schema.athlete_events
where medal <> 'NA'
group by team
order by count(distinct sport) desc, count(medal) desc
LIMIT 5


-- Find the athletes who have won gold medals in the most distinct sports.

select count(distinct sport), name, count(medal)
from new_schema.athlete_events
where medal = 'Gold'
group by name
order by count(distinct sport) desc, count(medal) desc
LIMIT 5

-- List the countries that have the most female gold medalists.

select count(distinct name), team
from new_schema.athlete_events
where medal = 'Gold' and sex = 'F'
group by team
order by count(distinct name) desc


-- Calculate the average age of gold medalists in different sports over the years.

select AVG(age), sport
from new_schema.athlete_events
where medal = 'Gold'
group by sport 
order by AVG(age) desc