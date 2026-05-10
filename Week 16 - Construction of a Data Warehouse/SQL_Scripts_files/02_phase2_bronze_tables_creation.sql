-- Phase 2 : Bronze Layer
-- Step 1 : Table creation and assigning to Bronze medallion layer

-- Bronze Account Table:
CREATE TABLE Bronze.account (
	account_number NVARCHAR(MAX),
	account_name NVARCHAR(MAX),
	account_type NVARCHAR(MAX),
	currency NVARCHAR(MAX)
);

-- Bronze Store Table :
CREATE TABLE Bronze.store(
	store_code NVARCHAR(MAX),
	country NVARCHAR(MAX),
	region NVARCHAR(MAX)
);

-- Bronze Store Master :
CREATE TABLE Bronze.store_master(
	store_code NVARCHAR(MAX),
	store_name NVARCHAR(MAX),
	store_type NVARCHAR(MAX)
);

-- Bronze Account mapping Table :
CREATE TABLE Bronze.account_mapping(
	AccountNumber NVARCHAR(MAX),
	AccountName NVARCHAR(MAX),
	PLLine NVARCHAR(MAX),
	StatementType NVARCHAR(MAX),
	SortOrder NVARCHAR(MAX), 
	Notes NVARCHAR(MAX)
);

-- Bronze Transaction Table :
CREATE TABLE Bronze.[transaction](
	transaction_id NVARCHAR(MAX),
	transaction_date NVARCHAR(MAX),
	store_code NVARCHAR(MAX),
	account_number NVARCHAR(MAX),
	amount_local NVARCHAR(MAX),
	currency NVARCHAR(MAX),
	document_number NVARCHAR(MAX),
	[description] NVARCHAR(MAX)
);
