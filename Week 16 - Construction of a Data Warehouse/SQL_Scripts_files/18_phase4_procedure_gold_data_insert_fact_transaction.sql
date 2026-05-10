-- Phase 4 : Gold Layer
-- Step 6 : Procedure - Data insertion from Silver tables to fact_Transaction table in Gold layer

USE [Data_Warehouse_week16];
GO

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_gold_data_insert_fact_transaction')
    DROP PROCEDURE procedure_gold_data_insert_fact_transaction;
GO

CREATE PROCEDURE procedure_gold_data_insert_fact_transaction AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    INSERT INTO [Gold].[fact_transaction] (
                            transaction_id,
                            transaction_date,
                            store_code,
                            account_number,
                            amount_local,
                            currency,
                            document_number,
                            [description])
                SELECT 
                            transaction_id,
                            transaction_date,
                            store_code,
                            account_number,
                            amount_local,
                            currency,
                            document_number,
                            [description]
                FROM [Silver].[transaction];
                
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(MILLISECOND, @START_TIME, @END_TIME);
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' ms';
END;
GO
