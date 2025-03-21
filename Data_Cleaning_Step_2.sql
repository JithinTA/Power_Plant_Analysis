# DELETING DUPLICATES
# Every Power plant has a unique identifying code. So the aim of this sql query is to find out if there are more than one rows with 
# similer Power_Plant_Code and delete them.

SELECT *
FROM energy.energy1
LIMIT 5
;

WITH duplicate_cte AS
(
SELECT Power_Plant_Code, 
ROW_NUMBER() OVER(PARTITION BY Power_Plant_Code) AS rp
FROM energy.energy1
) 
SELECT *
FROM duplicate_cte AS dc
WHERE dc.rp > 1
;

# There is no duplicates