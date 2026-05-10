-- Phase 4 : Gold Layer
-- Step 3 : Procedure - Creation of dim_Account table in Gold layer

USE [Data_Warehouse_week16];
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_gold_dim_account_creation')
    DROP PROCEDURE procedure_gold_dim_account_creation;
GO
CREATE PROCEDURE procedure_gold_dim_account_creation AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    DROP TABLE IF EXISTS [Gold].[dim_account];
    CREATE TABLE [Gold].[dim_account] (
                        account_number INT NOT NULL,
                        account_name NVARCHAR(50),
                        account_type NVARCHAR(50),
                        currency NVARCHAR(10),
                        PLLine NVARCHAR(50),
                        StatementType NVARCHAR(20),
                        SortOrder INT, 
                        Notes NVARCHAR(200),
                        CONSTRAINT PK_Gold_DimAccount PRIMARY KEY (account_number));
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(millisecond, @START_TIME, @END_TIME);
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
    
END;
GO
