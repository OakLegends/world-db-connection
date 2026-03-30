-- 1. selecteer count van city id where country code like USA
select count(c.ID) as 'aantal usa cities' from city c
where c.CountryCode = 'USA';

-- 2. population and avg life expectancy in argentina (arg)
select c.Population, avg(c.LifeExpectancy) from country c
where c.Code = 'ARG';

-- 3. country highest life expectancy
select c.Name as highestLifeExpectancy from country c
where c.LifeExpectancy is not null
order by c.LifeExpectancy desc
limit 1;

-- 4. capital spain
select c.Capital from country c 
join city c2 on c.Code = c2.CountryCode
where c.Code = 'ESP'
limit 1;

-- 5. languages southeast asia
select c2.Language from country c 
join countrylanguage c2 on c.Code = c2.CountryCode
where c.Region = 'Southeast Asia';

-- 6. lowest gnp africa
select c.gnp from country c
where c.Continent = 'africa'
order by c.GNP asc
limit 1;

-- 7. lowest gnp europe
select c.gnp from country c
where c.Continent = 'europe'
order by c.GNP asc
limit 1;

-- 8. lowest population asia
select c.Population from country c
where c.Continent = 'asia'
order by c.Population asc
limit 1;

-- 9. sum gnp middle east ergion countries
select sum(c.gnp) from country c
where c.Region = 'Middle East';

-- 10. 5 zuid amerika laatst onafhankelijk
select c.Name as land from country c 
where c.Continent = 'South America'
order by c.IndepYear asc
limit 5;

-- 11. 5 eurpese landen laatst onafhankelijk
select c.Name as land from country c 
where c.Continent = 'Europe'
order by c.IndepYear asc
limit 5;

-- 12. all continent countries
select count(c.Continent) from country c
group by c.Continent;

-- 13. meeste inwoners stad spanje buiten madrid, barca, billbao, sevilla, grenada
select c2.name from country c
join city c2 on c.Code = c2.CountryCode
where not c2.Name = 'Madrid' and not c2.Name = 'Barcelona' and not c2.Name = 'Bilbao' and not c2.Name = 'Sevilla' and not c2.Name = 'Grenada'
order by c2.Population desc
limit 1;

-- 14. landen surface kleiner 300 en meer 10000 inwoners OF goter dan 2000000 en minder dan 10000000 inwoners
select * from country c 
where c.SurfaceArea <= 300 and c.Population >= 10000 or c.SurfaceArea >= 2000000 and c.Population <= 10000000;

-- 15. list continenten cities 5 mil +
select c.Continent from country c
join city c2 on c.Code = c2.CountryCode
where c2.Population >= 5000000;

-- 16. list all cities 5 mil+ pop with languages, ordened bij count pop
select c2.Name , c3.Language from country c
join city c2 on c.Code = c2.CountryCode
join countrylanguage c3 on c.Code = c3.CountryCode
where c2.Population >= 5000000
order by c.Population desc;

-- 17. list all government forms without repeat
select distinct(c.GovernmentForm) from country c;

-- 18. SELECT c.Name AS Land, ci.Name AS Hoofdstad, cl.Language, c.GNP, c.Population
select c.GNP, c.GovernmentForm, c.Name from country c
where not C.GovernmentForm = 'peoples republic of china' and c.GovernmentForm = 'Monarchy' or c.GovernmentForm = 'Republic';

-- 19. Maak een lijst van alle landen, met de hoofdstad, de gesproken taal en het GNP. GeOrdend volgens aantal inwoners (kleinste eerst).
select c.Name, c.HeadOfState, c.GNP, c2.language from country c
join countrylanguage c2 on c.Code = c2.CountryCode
order by c.Population asc;

-- 20. Maak een lijst van alle steden met meer dan 100.000 inwoners van landen die over een sultan beschikken.
select * from city c
where c.Population >= 100000; -- sultan?

-- 21. Geef alle landen waarvan Elisabeth II het staatshoofd is?
select c.Name, c.HeadOfState from country c 
where c.HeadOfState = 'Elisabeth II';

-- 22. Wat is het gecombineerd GNP van alle landen waarvan Elisabeth 2 het staatshoofd was?
select SUM(c.GNP) from country c
where c.HeadOfState = 'Elisabeth II';

-- 23. Vergelijk de totale oppervlakte van de landen van Polynesië met deze van Afrika en met deze van Europa.
select c.SurfaceArea, c.Continent from country c
where c.Continent = 'Oceania' or c.Continent = 'Africa' or c.Continent = 'Europe';

-- 24. Geef de 10 steden met het grootste aantal inwoners in de database.
select c2.Name, c.Population from country c
join city c2 on c.Code = c2.CountryCode
order by c.Population desc
limit 10;

-- 25. Alle steden waarvan de naam als 2de letter een E is.
select * from city c 
where c.Name like '_E%';

-- 26. Alle steden waarvan de naam begint met een P en de lengte van de naam minimum 5 characters is.
select * from city c
where c.Name like 'P%' and c.Name like '%_____%';

-- 27. Alle steden waarvan de naam niet begint met een klinker.
select * from city c
where not c.Name like 'A%' and not c.Name like 'E%' and not c.Name like 'I%' and not c.Name like 'O%' and not c.Name like 'U%';

-- 28. Alle steden waarvan de naam begint met een klinker.
select * from city c
where c.Name like 'A%' or c.Name like 'E%' or c.Name like 'I%' or c.Name like 'O%' or c.Name like 'U%';

-- 29. Alle steden waarvan de naam begint met een a,c, d of e.
select * from city c
where c.Name like 'A%' or c.Name like 'E%' or c.Name like 'C%' or c.Name like 'D%';

-- 30. Tel het aantal steden met meer als 1 miljoen inwoners per land (group by)
select count(c.ID) from city c
where c.Population > 1000000
group by c.CountryCode;

-- 31. Tel het aantal landen per continent (group by)
select count(c.Code) from country c
group by c.Continent;

-- 32. Print enkel het aantal continenten met meer dan 20 landen
select count(c.Code) as countity from country c
group by c.Continent
HAVING COUNT(c.Code) > 20;;