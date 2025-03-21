# Q3, Which countrys has the most wind energy capacity?

SELECT *
FROM energy.energy1
LIMIT 10
;

CREATE TEMPORARY TABLE trppy(
Country VARCHAR(50),
Fuel VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO trppy
SELECT Country, Primary_Fuel, ROUND(SUM(Capacity_MW), 3)
FROM energy.energy1
GROUP BY Country, Primary_Fuel
; 

SELECT *
FROM trppy
;

CREATE TEMPORARY TABLE trppy2(
Country VARCHAR(50),
Fuel VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO trppy2
SELECT *
FROM trppy
WHERE Fuel = "Wind"
ORDER BY Capacity
;

SELECT *
FROM trppy2
;

CREATE TABLE Q3_Windy(
Country VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO Q3_Windy
SELECT Country, Capacity
FROM trppy2
ORDER BY Capacity DESC
LIMIT 10
;

SELECT *
FROM Q3_windy
;
