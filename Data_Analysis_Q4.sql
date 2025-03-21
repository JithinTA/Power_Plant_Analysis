# Q3, Which countrys has the most Solar energy capacity?

SELECT *
FROM energy.energy1
LIMIT 100
;

CREATE TEMPORARY TABLE tr0ppy(
Country VARCHAR(50),
Fuel VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO tr0ppy
SELECT Country, Primary_Fuel, ROUND(SUM(Capacity_MW), 3)
FROM energy.energy1
GROUP BY Country, Primary_Fuel
; 

SELECT *
FROM tr0ppy
;

CREATE TEMPORARY TABLE troppy2(
Country VARCHAR(50),
Fuel VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO troppy2
SELECT *
FROM trppy
WHERE Fuel = "Solar"
ORDER BY Capacity
;

SELECT *
FROM troppy2
;

CREATE TABLE Q4_Sunny(
Country VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO Q4_Sunny
SELECT Country, Capacity
FROM troppy2
ORDER BY Capacity DESC
LIMIT 10
;

SELECT *
FROM Q4_Sunny
;