# Q1, What are the top 10 countrys with the most power generation capacity and the 10 countrys with the least power generation capacity
## To answer this question, I am goin take the sum of the power generation capacity of each power plant per country. 

SELECT *
FROM energy.energy1
LIMIT 10
;

# Countrys with the most capacity
CREATE TABLE Q1_Top_Countrys(
Top_Countrys VARCHAR(50),
Capacity FLOAT
)
;

CREATE TEMPORARY TABLE Toppy(
Countrys VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO Toppy
SELECT Country, ROUND(SUM(Capacity_MW),3)  AS total_capacity
FROM energy.energy1 
GROUP BY Country
;

SELECT *
FROM Toppy
;

INSERT INTO Q1_Top_Countrys (Top_Countrys, Capacity)
SELECT Countrys, Capacity
FROM Toppy
ORDER BY Capacity DESC
LIMIT 10
;

SELECT *
FROM Q1_Top_Countrys
;

# Countrys with the least capacity

CREATE TABLE Q1_Bottom_Countrys(
Bottom_Countrys VARCHAR(50),
Capacity FLOAT
)
;

CREATE TEMPORARY TABLE BOTTY(
Countrys VARCHAR(50),
Capacity FLOAT
)
;

INSERT INTO BOTTY
SELECT Country, ROUND(SUM(Capacity_MW),3)  AS total_capacity
FROM energy.energy1 
GROUP BY Country
;

SELECT *
FROM BOTTY
;

INSERT INTO Q1_Bottom_Countrys (Bottom_Countrys, Capacity)
SELECT Countrys, Capacity
FROM Toppy
ORDER BY Capacity 
LIMIT 10
;

SELECT *
FROM Q1_Bottom_Countrys
;






