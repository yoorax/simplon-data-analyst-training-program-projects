-- Phase 2 : Bronze Layer
-- Step 2 : Bulk insert uploading CSV files data to the Bronze layer tables

BULK INSERT Bronze.account
FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\account.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK,
	CODEPAGE = '65001'
);

BULK INSERT Bronze.account_mapping
FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\account_mapping.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK,
	CODEPAGE = '65001'
);

BULK INSERT Bronze.store
FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\store.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK,
	CODEPAGE = '65001'
);

BULK INSERT Bronze.[transaction]
FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\transaction.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK,
	CODEPAGE = '65001'
);

BULK INSERT Bronze.store_master
FROM 'C:\Users\rachid\3D Objects\Simplon-Data-Analyst-Projects\Week 16 - Construction of a Data Warehouse\data\store_master.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK,
	CODEPAGE = '65001'
);
