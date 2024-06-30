CREATE TABLE Location
(CountryName VARCHAR(20) NOT NULL PRIMARY KEY ,
iso_Code VARCHAR(5) NOT NULL,
source_url TEXT(100) NOT NULL);
 
CREATE TABLE Vaccine
(VaccineName VARCHAR(40) NOT NULL PRIMARY KEY);

CREATE TABLE us_state_vaccination
(date INTEGER NOT NULL,
state TEXT (20) NOT NULL,
total_distributed INTEGER,		
people_vaccinated INTEGER, 
people_fully_vaccinated_per_hundred INTEGER, 
total_vaccinations_per_hundred INTEGER, 
people_fully_vaccinated INTEGER, 
people_vaccinated_per_hundred INTEGER,
distributed_per_hundred INTEGER,
daily_vaccinations_raw INTEGER, 
daily_vaccinations INTEGER,
daily_vaccinations_per_million INTEGER,
share_doses_used INTEGER,
total_boosters INTEGER,
total_boosters_per_hundred INTEGER);

CREATE TABLE Vaccination_by_age_group
(CountryName TEXT(20) NOT NULL,
date INTEGER NOT NULL,
age_group TEXT(20) NOT NULL,
people_vaccinated_per_hundred INTEGER, 
people_fully_vaccinated_per_hundred INTEGER, 
people_with_booster_per_hundred INTEGER,
FOREIGN KEY(CountryName) REFERENCES Location(CountryName));

CREATE TABLE Vaccinations 
(CountryName TEXT(20) NOT NULL,
date TEXT(10) NOT NULL,
total_vaccinations INTEGER,
people_vaccinated INTEGER,
people_fully_vaccinated INTEGER,
total_boosters INTEGER,
daily_vaccinations_raw INTEGER,
daily_vaccinations INTEGER,
total_vaccination_per_hundred INTEGER,
people_vaccinated_per_hundred INTEGER,
people_fully_vaccinated_per_hundred INTEGER,
total_boosters_per_hundred INTEGER,
daily_vaccinations_per_million INTEGER,
daily_people_vaccinated INTEGER,
daily_people_vaccinated_per_hundred INTEGER,
FOREIGN KEY(CountryName) REFERENCES Location(CountryName));

CREATE TABLE vaccination_by_manufacturer
(CountryName TEXT (20) NOT NULL, 
Date INTEGER NOT NULL,
vaccine TEXT(30) NOT NULL,	
total_vaccinations INTEGER,
FOREIGN KEY(CountryName) REFERENCES Location(CountryName),
FOREIGN KEY(vaccine) REFERENCES Vaccine( VaccineName));

CREATE TABLE vaccination_available_per_country
(CountryName TEXT(20) NOT NULL,
vaccine TEXT(30) NOT NULL,
FOREIGN KEY(CountryName) REFERENCES Location(CountryName),
FOREIGN KEY(vaccine) REFERENCES vaccine(vaccinename));

CREATE TABLE vaccination_country_data
(CountryName TEXT(20) NOT NULL,
date INTEGER NOT NULL,
vaccine TEXT(30) NOT NULL, 
total_vaccinations INTEGER,
people_vaccinated INTEGER,
people_fully_vaccinated INTEGER,
total_boosters INTEGER,
FOREIGN KEY(CountryName) REFERENCES Location(CountryName));