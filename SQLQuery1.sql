--Covid-19 Cases/Deaths Table
select *
from [Covid Project].dbo.coviddeaths
order by 3,4
--Covid-19 Vaccinations Table
select * 
from [Covid Project].dbo.covidvaccinations
order by 3,4
--General Overview of Cases and Deaths
select location, date, total_cases, new_cases, total_deaths, population
from [Covid Project].dbo.coviddeaths
order by 1,2
--Percent of Death in the United States if Covid-19 Positive
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
from [Covid Project].dbo.coviddeaths
where location like '%States%' 
order by 1,2
--Percent of Covid-19 Positive Cases in the United States
select location, date, population, total_cases, (total_cases/population)*100 as Cases_Per_Population
from [Covid Project].dbo.coviddeaths
where location like '%States%'
order by 1,2 
--Countries With the Highest Infection Rate Relative to Population
select location, population, max(total_cases) as HighestInfectionCount, max(total_cases/population)*100 as Population_Infection_Rate
from [Covid Project].dbo.coviddeaths
group by location, population
order by 4 desc
--Continents With the Highest Death Count Per Population
select continent, max(cast(total_deaths as int)) as Total_Death_Count
from [Covid Project].dbo.coviddeaths
where continent is not null
group by continent
order by 2 desc
--Global Numbers
select date, sum(new_cases) as Total_Cases, sum(cast(new_deaths as int)) as Total_Deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as New_Death_Percentage
from [Covid Project].dbo.coviddeaths
where continent is not null
group by date
order by 1,2