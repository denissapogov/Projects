select * from dbo.CovidDeath
select * from dbo.CovidVaccinations

select location, date, total_cases, new_cases, total_deaths, population
from dbo.CovidDeath
order by 1,2 

-- looking at the total cases vs total deaths
-- showing the likelihood of dying if you contract covid in your country
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from dbo.CovidDeath
where location like '%states%'
order by 1,2 

-- looking at the total cases vs population
-- shows what % of population got Covid
select location, date, total_cases, population, (total_cases/population)*100 as DeathPercentage
from dbo.CovidDeath
where location like '%states%'
order by 1,2 

-- looking at the countries with highest infection rate compared to population

select location, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
from dbo.CovidDeath
--where location like '%states%'
group by location, population
order by PercentPopulationInfected desc

--showing countries with highest death count per population

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from dbo.CovidDeath
--where location like '%states%'
where continent is not null
group by location
order by TotalDeathCount desc

-- let's break things down by continent
-- showing continents with the highest death count

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from dbo.CovidDeath
--where location like '%states%'
where continent is not null
group by continent
order by TotalDeathCount desc

-- GLOBAL NUMBERS

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/ SUM(new_cases)*100 as DeathPercentage
from dbo.CovidDeath
--where location like '%states%'
where continent is not null
-- group by date
order by 1,2 

-- looking at the total population vs vaccinations
-- USE CTE

WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(float, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date) as RollingPeopleVaccinated
FROM dbo.CovidDeath dea
JOIN dbo.CovidVaccinations vac ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
)
SELECT * FROM PopvsVac;

select *, (RollingPeopleVaccinated/Population)*100
from PopvsVac

--creating View to store data for later visualizations

Create View PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(float, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date) as RollingPeopleVaccinated
FROM dbo.CovidDeath dea
JOIN dbo.CovidVaccinations vac ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

select * from PercentPopulationVaccinated