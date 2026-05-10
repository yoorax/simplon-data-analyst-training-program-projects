-- Phase 3 : Silver Layer
-- Step 3 : Procedure - Insert cleaned data to Account Mapping table in Silver layer
-- Transformation : Trim whitespaces, normalize AccountName, StatementType, Notes

-- SQL script of acount_mapping Transformation Table :
IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_silver_data_insert_account_mapping')
    DROP PROCEDURE procedure_silver_data_insert_account_mapping;
    GO

CREATE PROCEDURE procedure_silver_data_insert_account_mapping AS
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    INSERT INTO Silver.account_mapping(
                                         [AccountNumber]
                                        ,[AccountName]
                                        ,[PLLine]
                                        ,[StatementType]
                                        ,[SortOrder]
                                        ,[Notes]
                                        )
                SELECT
                    [AccountNumber],
                    CASE
                        WHEN UPPER(TRIM([AccountName])) = 'MARKETING EXP' 
                        THEN 'Marketing expense'
                        ELSE TRIM([AccountName])
                    END AS [AccountName],
                    TRIM([PLLine]) AS PLLine,
                    CASE
                        WHEN UPPER(TRIM([StatementType])) LIKE '%P%' AND 
                            UPPER(TRIM([StatementType])) LIKE '%L%'
                        THEN 'P&L'
                        WHEN [StatementType] IS NULL 
                        THEN 'Not Defined'
                        ELSE TRIM([StatementType])
                    END AS [StatementType],
                    CAST (TRY_CAST([SortOrder] AS DECIMAL(10,2)) AS INT), -- if cast wasnt seccessful the results would be NULL. this was note for identifying the no casted SordOrder values
                    CASE
                        WHEN TRIM([Notes]) IS NULL 
                        THEN 'No Note'
                        ELSE TRIM([Notes])
                    END AS [Notes]
                FROM [Data_Warehouse_week16].[Bronze].[account_mapping];

    DELETE FROM [Data_Warehouse_week16].[Silver].[account_mapping] 
    WHERE UPPER(TRIM([AccountName])) IN ('RENT EXPENSE', 'RENT EXPENSES');
    DECLARE @DeletedRows INT = @@ROWCOUNT
    SET @END_TIME = GETDATE(); 
    DECLARE @DURATION_ms INT = DATEDIFF(millisecond,@START_TIME, @END_TIME);
    PRINT 'Number of Rows Deleted is :' + CAST(@DeletedRows AS VARCHAR) + 'Rows'
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
END;
