-- Phase 3 : Silver Layer
-- Step 4 : Procedure - Insert cleaned data to Store table in Silver layer
-- Transformation : Trim whitespaces from store_code, country, region

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_silver_data_insert_store')
     DROP PROCEDURE procedure_silver_data_insert_store;
     GO
CREATE PROCEDURE procedure_silver_data_insert_store AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    INSERT INTO Silver.store (
                                [store_code]
                                ,[country]
                                ,[region]
                            )
        SELECT 
                 TRIM([store_code])
                ,TRIM([country])
                ,TRIM([region])
        FROM [Data_Warehouse_week16].[Bronze].[store]
    SET @END_TIME = GETDATE()
    SET @DURATION_ms = DATEDIFF(millisecond, @START_TIME, @END_TIME)
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
END;
