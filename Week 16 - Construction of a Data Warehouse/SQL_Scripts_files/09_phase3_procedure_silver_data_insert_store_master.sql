-- Phase 3 : Silver Layer
-- Step 5 : Procedure - Insert cleaned data to Store Master table in Silver layer
-- Transformation : Trim whitespaces from store_code, store_name, store_type

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_silver_data_insert_store_master')
    DROP PROCEDURE procedure_silver_data_insert_store_master;
    GO
CREATE PROCEDURE procedure_silver_data_insert_store_master AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    INSERT INTO Silver.store_master(
                             [store_code]
                            ,[store_name]
                            ,[store_type]
                            )
            SELECT 
             TRIM([store_code])
            ,TRIM([store_name])
            ,TRIM([store_type])
            FROM [Data_Warehouse_week16].[Bronze].[store_master]
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(millisecond, @START_TIME, @END_TIME);
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
END;
GO
