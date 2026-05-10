-- Phase 3 : Silver Layer
-- Step 1 : Tables Creation with primary and foreign key constraint association

-- Silver Account Table:
IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_silver_tables_creation')
	DROP PROCEDURE procedure_silver_tables_creation;
	GO
CREATE PROCEDURE procedure_silver_tables_creation AS
BEGIN
	DECLARE @START_TIME DATETIME = GETDATE();
	DECLARE @END_TIME DATETIME;
	DECLARE @DURATION_ms INT;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Silver' AND TABLE_NAME = 'account' )
		BEGIN
			CREATE TABLE Silver.account (
				account_number INT NOT NULL,
				account_name NVARCHAR(50),
				account_type NVARCHAR(50),
				currency NVARCHAR(10),
				CONSTRAINT PK_Account PRIMARY KEY (account_number)
			);
		END;

	-- Silver Store Table :
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Silver' AND TABLE_NAME = 'store' )
		BEGIN
			CREATE TABLE Silver.store(
				store_code NVARCHAR(20) NOT NULL,
				country NVARCHAR(15),
				region NVARCHAR(10),
				CONSTRAINT PK_Store PRIMARY KEY (store_code)
			);
		END;

	-- Silver Store Master :
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Silver' AND TABLE_NAME = 'store_master' )
		BEGIN
			CREATE TABLE Silver.store_master(
				store_code NVARCHAR(20) NOT NULL,
				store_name NVARCHAR(50),
				store_type NVARCHAR(20),
				CONSTRAINT PK_StoreMaster PRIMARY KEY (store_code)
			);
		END;

	-- Silver Account mapping Table :
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Silver' AND TABLE_NAME = 'account_mapping')
		BEGIN
			CREATE TABLE Silver.account_mapping(
				AccountNumber INT NOT NULL,
				AccountName NVARCHAR(50),
				PLLine NVARCHAR(50),
				StatementType NVARCHAR(20),
				SortOrder INT, 
				Notes NVARCHAR(200)
			);
		END;

	-- Silver Transaction Table :
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Silver' AND TABLE_NAME = 'transaction' )
		BEGIN
			CREATE TABLE Silver.[transaction](
				transaction_id INT PRIMARY KEY NOT NULL,
				transaction_date DATE,
				store_code NVARCHAR(20)  NOT NULL,
				account_number INT NOT NULL,
				amount_local DECIMAL(10,2),
				currency NVARCHAR(10),
				document_number NVARCHAR(50),
				[description] NVARCHAR(200),
				CONSTRAINT FK_Transaction_StoreMaster FOREIGN KEY (store_code)
					REFERENCES Silver.store_master(store_code) ON DELETE CASCADE,
				CONSTRAINT FK_Transaction_Account FOREIGN KEY (account_number)
					REFERENCES Silver.account(account_number) ON DELETE CASCADE
			);
		END;
	SET @END_TIME = GETDATE();
	SET @DURATION_ms = DATEDIFF(millisecond, @START_TIME, @END_TIME);
	PRINT 'procedure executed in ' + CAST(@DURATION_ms AS VARCHAR) + ' milliseconds';
END;
GO
