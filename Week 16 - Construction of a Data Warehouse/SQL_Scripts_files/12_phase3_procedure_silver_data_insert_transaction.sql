-- Phase 3 : Silver Layer
-- Step 8 : Procedure - Insert cleaned data to Transaction table in Silver layer
-- Transformation : Cast types, trim whitespaces, handle NULLs

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_silver_data_insert_transaction')
    DROP PROCEDURE procedure_silver_data_insert_transaction;
    GO

CREATE PROCEDURE procedure_silver_data_insert_transaction AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;

    INSERT INTO Silver.[transaction](
                                         [transaction_id]
                                        ,[transaction_date]
                                        ,[store_code]
                                        ,[account_number]
                                        ,[amount_local]
                                        ,[currency]
                                        ,[document_number]
                                        ,[description]
                                    )
    SELECT 
         [transaction_id]
        ,[transaction_date]
        ,TRIM([store_code])
        ,[account_number]
        ,CASE 
            WHEN [amount_local] IS NULL
            THEN CAST(0.0 AS DECIMAL(10,2))
            ELSE CAST([amount_local] AS DECIMAL(10,2))
            END AS [amount_local]
        ,TRIM([currency])
        ,CASE 
            WHEN [document_number] IS NULL
            THEN 'n/a'
            ELSE TRIM([document_number])
            END AS [document_number]
        ,CASE 
            WHEN [description] IS NULL
            THEN 'No descreption'
            ELSE TRIM([description])
            END AS [description]

    FROM [Data_Warehouse_week16].[Bronze].[transaction]

    SET @END_TIME = GETDATE();
    DECLARE @DURATION_ms INT = DATEDIFF(millisecond, @START_TIME, @END_TIME);
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
END;
GO 
