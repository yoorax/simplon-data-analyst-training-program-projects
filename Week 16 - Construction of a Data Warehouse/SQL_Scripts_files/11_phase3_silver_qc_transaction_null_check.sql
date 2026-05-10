-- Phase 3 : Silver Layer
-- Step 7 : Quality Check - Checking Null values of Data entry columns in Transaction table
-- Results : No null value found in any column

SELECT [amount_local]
  FROM [Data_Warehouse_week16].[Silver].[transaction]
  WHERE amount_local IS NULL
--Results : No null value found  
--Transformation : if there is a NULL value will be replaced by 0

---------------------------------------------
SELECT [document_number]
  FROM [Data_Warehouse_week16].[Bronze].[transaction]
  WHERE [document_number] IS NULL
--Results : No null value found  
--Transformation : we cant decide yet in this case 

---------------------------------------------
SELECT [description]
  FROM [Data_Warehouse_week16].[Bronze].[transaction]
  WHERE [description] IS NULL
--Results : No null value found  
--Transformation : relacing NULL with 'No descreption' statement.
