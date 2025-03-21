# What are the largest power plants in the world, their capacity, Primary Fuel and which country are they from?

SELECT *
FROM energy.energy1
;

CREATE TABLE Q5_Largest(
Country VARCHAR(50),
Power_Plant_Name VARCHAR(100),
Power_Plant_Code VARCHAR(50),
Primary_Fuel VARCHAR(50),
Capacity_MW FLOAT
)
;

INSERT INTO Q5_Largest
SELECT Country, Power_Plant_Name, Power_Plant_Code, Primary_Fuel, Capacity_MW
FROM energy.energy1
ORDER BY Capacity_MW DESC
LIMIT 20
; 

SELECT *
FROM Q5_Largest
;