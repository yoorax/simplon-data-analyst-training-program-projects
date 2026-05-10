-- Phase 3 : Silver Layer
-- Step 2 : Procedure - Insert cleaned data to Account table in Silver layer
-- Transformation : Trim white spaces from data entry in the account table
--                  and insert results to silver.account table

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_silver_data_insert_account')
	DROP PROCEDURE procedure_silver_data_insert_account;
GO

CREATE PROCEDURE procedure_silver_data_insert_account AS
	BEGIN
		DECLARE @START_TIME DATETIME = GETDATE();
		DECLARE @END_TIME DATETIME;
		INSERT INTO Silver.account (
				                 account_number
								,account_name
								,account_type
								,currency)
								SELECT 
								 [account_number]
								,TRIM([account_name])
								,TRIM([account_type])
								,TRIM([currency])
				                FROM [Data_Warehouse_week16].[Bronze].[account]
		SET @END_TIME = GETDATE();
		DECLARE @DURATION_ms INT  
		SET @DURATION_ms = DATEDIFF(millisecond, @START_TIME, @END_TIME)
		PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';

	END;
GO
