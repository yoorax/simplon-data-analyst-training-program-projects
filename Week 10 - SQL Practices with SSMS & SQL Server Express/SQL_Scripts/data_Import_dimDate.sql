BULK INSERT dimDate
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\dimDate.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
    TABLOCK
);


BULK INSERT dimLocation
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\dimLocation.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
    TABLOCK
);


BULK INSERT dimCptCode
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\dimCptCode.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
    TABLOCK
);


BULK INSERT FactTable
FROM 'C:\Users\rachid\3D Objects\week 10 - SQL SERVER\FactTable.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
    TABLOCK
);

