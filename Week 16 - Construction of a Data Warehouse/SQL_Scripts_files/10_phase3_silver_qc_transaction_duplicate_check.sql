-- Phase 3 : Silver Layer
-- Step 6 : Quality Check - Checking duplicated rows in Transaction table
-- Results : No duplicated rows in transaction table.

SELECT *
	  ,count(*) as duplicated_rows
  FROM [Data_Warehouse_week16].[Bronze].[transaction]
  Group by [transaction_id]
      ,[transaction_date]
      ,[store_code]
      ,[account_number]
      ,[amount_local]
      ,[currency]
      ,[document_number]
      ,[description]
  having count(*) > 1;

  -- results : No duplicated rows in transaction table.
