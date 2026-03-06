-- ============================================================
-- Hospital Database - Data Import (BULK INSERT)
-- ============================================================
-- Loads CSV data files into SQL Server tables using
-- BULK INSERT. Each file uses comma delimiters, skips
-- the header row, and uses UTF-8 encoding.
-- ============================================================


-- Import dimDate
BULK INSERT dimDate
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\dimDate.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);


-- Import dimLocation
BULK INSERT dimLocation
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\dimLocation.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);


-- Import dimCptCode
BULK INSERT dimCptCode
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\dimCptCode.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);


-- Import FactTable
BULK INSERT FactTable
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\FactTable.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
