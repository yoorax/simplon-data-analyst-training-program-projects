-- Phase 4 : Gold Layer
-- Step 1 : Procedure - Creation of dim_Store table in Gold layer

USE [Data_Warehouse_week16];
GO

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_gold_dim_store_creation')
    DROP PROCEDURE procedure_gold_dim_store_creation;
    GO
CREATE PROCEDURE procedure_gold_dim_store_creation AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    DROP TABLE IF EXISTS [Gold].[dim_Store];
    CREATE TABLE [Gold].[dim_Store] (
                    store_code NVARCHAR(20) NOT NULL,
                    store_name NVARCHAR(50),
                    store_type NVARCHAR(20),
                    store_region NVARCHAR(10),
                    store_country NVARCHAR(15),
                    CONSTRAINT PK_Gold_DimStore PRIMARY KEY (store_code));
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(millisecond, @START_TIME, @END_TIME);
    PRINT 'procedure executed in '+ CAST(@DURATION_ms AS VARCHAR) +' milliseconds';
    
END;
GO
