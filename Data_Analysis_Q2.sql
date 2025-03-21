# Q2, Which countrys generated the most energy from 2013 to 2017 ?
# To answer this question let's take the sum of the columns from the year 2013 to 2017 for each country

SELECT *
FROM energy.energy1
LIMIT 10
;

CREATE TEMPORARY TABLE tempy(
Countrys VARCHAR(50),
Generated_power_GWH FLOAT
)
;

INSERT INTO tempy(Countrys, Generated_power_GWH)
SELECT Country, 
Estimated_Generation_GWH_2013 + Estimated_Generation_GWH_2014 +Estimated_Generation_GWH_2015 + Estimated_Generation_GWH_2016
+ Estimated_Generation_GWH_2017 AS Total_gen
FROM energy.energy1
; 

SELECT *
FROM tempy
;

CREATE TEMPORARY TABLE temp2(
Countrys VARCHAR(50),
Generation FLOAT
)
;

INSERT INTO temp2
SELECT Countrys, ROUND(sum(Generated_power_GWH), 3)
FROM tempy
GROUP BY Countrys
;

SELECT *
FROM temp2
;

CREATE TABLE Q2(
Countrys VARCHAR(50),
Generation FLOAT
)
;

INSERT INTO Q2
SELECT *
FROM temp2
ORDER BY Generation DESC
LIMIT 10
;

SELECT *
FROM Q2
;
