# STANDARDIZING DATA
# The aim of this query is to check wheather the columns Country, Primary_Fuel and Commissioning_Year are standardized
# And if not to standardize them.

SELECT *
FROM energy.energy1
LIMIT 5 OFFSET 1000
;

SELECT DISTINCT Country
FROM energy.energy1
;

# The countrys are already standardized

SELECT DISTINCT Primary_Fuel
FROM energy.energy1
;

# The Primary_Fuel column is also already standardized

SELECT DISTINCT Commissioning_Year
FROM energy.energy1
ORDER BY Commissioning_Year
;

# The commisioning year has decimal values, so to standardize them, the decimal values has to be deleted
SET SQL_SAFE_UPDATES = 0;
UPDATE energy.energy1
SET Commissioning_Year = FLOOR(Commissioning_Year)
;
SET SQL_SAFE_UPDATES = 1;

# The Commissioning_Year has been updated
