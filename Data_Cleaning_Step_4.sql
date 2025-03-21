# CHANGING DATATYPES
# Currently all the columns are VARCHSR. SO the columns Commissioning_Year has to be converted to int and the columns 
# Capacity_MW and Estimated_Generation columns has to be converted to 

SELECT * 
FROM energy.energy1
LIMIT 5
;

# Checking the datatypes of every column

DESCRIBE energy.energy1;

# Changing the datatype of the column Commissioning_Year to int

ALTER TABLE energy.energy1
MODIFY COLUMN Commissioning_Year INT;

# Changing the Column Capacity_MW and Estimated_Generation Columns to FLOAT

ALTER TABLE energy.energy1
MODIFY COLUMN Capacity_MW FLOAT,
MODIFY COLUMN Estimated_Generation_GWH_2013 FLOAT,
MODIFY COLUMN Estimated_Generation_GWH_2014 FLOAT,
MODIFY COLUMN Estimated_Generation_GWH_2015 FLOAT,
MODIFY COLUMN Estimated_Generation_GWH_2016 FLOAT,
MODIFY COLUMN Estimated_Generation_GWH_2017 FLOAT;