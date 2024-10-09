SELECT*
FROM [covid19 project]..['CovidDeaths']
where continent is not null
order by 3,4

--SELECT*
--FROM [covid19 project]..['CovidVaccination']
--order by 3,4

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [covid19 project]..['CovidDeaths']
order by 1,2

--Looking at Total deaths vs Total cases
--Likelihood of dying from covid in india

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From [covid19 project]..['CovidDeaths']
where location like '%india%' 
and continent is not null
order by 1,2

--Looking at Total cases vs population

SELECT location, date, population, total_cases,  (total_cases/population)*100 as InfectedPopulationPercentage
From [covid19 project]..['CovidDeaths']
where location like '%india%' 
order by 1,2

-- Looking at countries with Highest infection Rate compared to population

SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as InfectedPopulationPercentage
From [covid19 project]..['CovidDeaths']
--where location like '%india%' 
Group by location, population
order by InfectedPopulationPercentage desc

--Showing Countries with Highest Death Count per Population

SELECT location, max(cast(Total_deaths as int)) as TotalDeathCount
From [covid19 project]..['CovidDeaths']
--where location like '%india%' 
where continent is not null
Group by location 
order by TotalDeathCount desc

--BREAKING THINGS DOWN BY CONTINENT


--Showing continents with highest death count per population

SELECT continent, max(cast(Total_deaths as int)) as TotalDeathCount
From [covid19 project]..['CovidDeaths']
--where location like '%india%' 
where continent is not null
Group by continent 
order by TotalDeathCount desc


--GLOBAL NUMBERS

SELECT sum(new_cases)as Total_cases, sum(cast(new_deaths as int))as Total_deaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
From [covid19 project]..['CovidDeaths']
--where location like '%india%' 
where continent is not null
--group by date
order by 1,2

--Looking at Total Population vs Vaccination

Select dea.continent, dea.location,dea.date,dea.population,vac.new_vaccinations
, SUM(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated,
--,(RollingPeopleVaccinated/population)*100
From [covid19 project]..['CovidDeaths'] dea
Join [covid19 project]..['CovidVaccination'] vac
     on dea.location = vac.location
	 and dea.date = vac.date
where dea.continent is not null
order by 2,3


--- USE CTE

with PopvsVac (Continent, Location, Date, Population,New_Vaccination, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location,dea.date,dea.population,vac.new_vaccinations
, SUM(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100,
From [covid19 project]..['CovidDeaths'] dea
Join [covid19 project]..['CovidVaccination'] vac
     on dea.location = vac.location
	 and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
select*, (RollingPeopleVaccinated/Population)*100
From PopvsVac


--TEMP TABLE
Drop table if exists #PercentPopluationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
insert into #PercentPopulationVaccinated
Select dea.continent, dea.location,dea.date,dea.population,vac.new_vaccinations
, SUM(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100,
From [covid19 project]..['CovidDeaths'] dea
Join [covid19 project]..['CovidVaccination'] vac
     on dea.location = vac.location
	 and dea.date = vac.date
where dea.continent is not null
--order by 2,3
Select*, (RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated




-- Creating view to store data for later visualization

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location,dea.date,dea.population,vac.new_vaccinations
, SUM(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100,
From [covid19 project]..['CovidDeaths'] dea
Join [covid19 project]..['CovidVaccination'] vac
     on dea.location = vac.location
	 and dea.date = vac.date
where dea.continent is not null
--order by 2,3

select *
from PercentPopulationVaccinated

