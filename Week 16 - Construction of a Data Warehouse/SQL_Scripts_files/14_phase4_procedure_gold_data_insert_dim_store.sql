-- Phase 4 : Gold Layer
-- Step 2 : Procedure - Data insertion from Silver tables to dim_Store table in Gold layer

USE [Data_Warehouse_week16];
GO

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_gold_data_insert_dim_store')
    DROP PROCEDURE procedure_gold_data_insert_dim_store;
GO

CREATE PROCEDURE procedure_gold_data_insert_dim_store AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    INSERT INTO [Gold].[dim_store] (
                                    store_code,
                                    store_name,
                                    store_type,
                                    store_region,
                                    store_country)
                SELECT 
                    s.store_code,
                    sm.store_name,
                    sm.store_type,
                    s.region,
                    s.country
                FROM [Silver].[store] s
                JOIN [Silver].[store_master] sm
                ON s.store_code = sm.store_code;
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(MILLISECOND, @START_TIME, @END_TIME);
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' ms';
END;
GO
