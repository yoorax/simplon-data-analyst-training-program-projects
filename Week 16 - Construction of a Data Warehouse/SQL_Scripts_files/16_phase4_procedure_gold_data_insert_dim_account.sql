-- Phase 4 : Gold Layer
-- Step 4 : Procedure - Data insertion from Silver tables to dim_Account table in Gold layer

USE [Data_Warehouse_week16];
GO

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_gold_data_insert_dim_account')
    DROP PROCEDURE procedure_gold_data_insert_dim_account;
GO

CREATE PROCEDURE procedure_gold_data_insert_dim_account AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    INSERT INTO [Gold].[dim_account] (
                        account_number,
                        account_name,
                        account_type,
                        currency,
                        PLLine,
                        StatementType,
                        SortOrder, 
                        Notes)
                SELECT 
                 a.[account_number]
                ,a.[account_name]
                ,a.[account_type]
                ,a.[currency]
                ,am.[PLLine]
                ,am.[StatementType]
                ,am.[SortOrder]
                ,am.[Notes]
                FROM [Silver].[account] a
                LEFT JOIN [Silver].[account_mapping] am
                ON a.account_number = am.AccountNumber;
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(MILLISECOND, @START_TIME, @END_TIME);
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' ms';
END;
GO
