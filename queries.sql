--D.1--   
SELECT Countryname AS "Country Name",
Row_Number() OVER (PARTITION BY Countryname order by date)-1 AS "Administered Vaccine on Day Number",  
sum(people_vaccinated) OVER (PARTITION BY Countryname ORDER BY date) AS "Total Injected People"
FROM vaccinations
ORDER BY countryname, date;

--D.2--
SELECT
    CountryName AS "Country",
    MAX("Total Injected People") AS "Cumulative Doses"
FROM (
    SELECT
        CountryName,
        ROW_NUMBER() OVER (PARTITION BY CountryName ORDER BY date) - 1 AS "Administered Vaccine on Day Number (DN)",
        SUM(people_vaccinated) OVER (PARTITION BY CountryName ORDER BY date) AS "Total Injected People"
    FROM
        Vaccinations)
GROUP BY
    CountryName
ORDER BY
    "Cumulative Doses" DESC;
    
--D.3--
SELECT 
    vaccine AS "Vaccine Type", 
    CountryName AS "COUNTRY"
FROM 
    vaccination_available_per_country;
    
--D.4--
SELECT (location.source_url) AS "Source URL", 
SUM(vaccinations.people_vaccinated) AS "Largest total Administered Vaccines" 
FROM location 
JOIN vaccinations ON location.CountryName = vaccinations.countryname 
GROUP BY "Source URL" 
ORDER BY "Source URL";


--D.5--       
SELECT
    strftime('%Y-%m', SUBSTR(date, 7, 4) || '-' || SUBSTR(date, 4, 2) || '-' || SUBSTR(date, 1, 2)) AS Month,
    SUM(CASE WHEN CountryName = 'Australia' THEN people_fully_vaccinated ELSE 0 END) AS Australia,
    SUM(CASE WHEN CountryName = 'United States' THEN people_fully_vaccinated ELSE 0 END) AS "United States",
    SUM(CASE WHEN CountryName = 'England' THEN people_fully_vaccinated ELSE 0 END) AS England,
    SUM(CASE WHEN CountryName = 'New Zealand' THEN people_fully_vaccinated ELSE 0 END) AS "New Zealand"
FROM
    vaccination_country_data
WHERE
    SUBSTR(date, 7, 4) = '2022'
GROUP BY
    Month
ORDER BY
    Month;

