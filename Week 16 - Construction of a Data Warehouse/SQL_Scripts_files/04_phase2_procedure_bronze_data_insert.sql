-- Phase 2 : Bronze Layer
-- Step 3 : Procedure - Data insert using stored procedure

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'procedure_bronze_data_insert') 
        DROP PROCEDURE procedure_bronze_data_insert;
        GO 

CREATE PROCEDURE procedure_bronze_data_insert AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    ------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM Bronze.account)
    BEGIN
        BULK INSERT Bronze.account
        FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\account.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK,
            CODEPAGE = '65001'
            );
    END
    ------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM Bronze.account_mapping)
        BEGIN
            BULK INSERT Bronze.account_mapping
            FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\account_mapping.csv'
            WITH(
                FIRSTROW = 2,
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                TABLOCK,
                CODEPAGE = '65001'
                );
        END
    ------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM Bronze.store)
        BEGIN
            BULK INSERT Bronze.store
            FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\store.csv'
            WITH(
                FIRSTROW = 2,
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                TABLOCK,
                CODEPAGE = '65001'
                );
        END
    ---------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM Bronze.[transaction])
        BEGIN
            BULK INSERT Bronze.[transaction]
            FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\transaction.csv'
            WITH(
                FIRSTROW = 2,
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                TABLOCK,
                CODEPAGE = '65001'
                );
        END

    -----------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM Bronze.store_master)
        BEGIN 
            BULK INSERT Bronze.store_master
            FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\store_master.csv'
            WITH(
                FIRSTROW = 2,
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                TABLOCK,
                CODEPAGE = '65001'
                );
        END
    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(MILLISECOND, @START_TIME, @END_TIME) ;
    PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
END ;
GO
