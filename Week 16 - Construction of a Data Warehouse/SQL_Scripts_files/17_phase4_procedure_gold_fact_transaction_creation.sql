-- Phase 4 : Gold Layer
-- Step 5 : Procedure - Creation of fact_Transaction table in Gold layer

USE [Data_Warehouse_week16];
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'procedure_gold_fact_transaction_creation')
    DROP PROCEDURE procedure_gold_fact_transaction_creation;
    GO
CREATE PROCEDURE procedure_gold_fact_transaction_creation AS 
BEGIN
    DECLARE @START_TIME DATETIME = GETDATE();
    DECLARE @END_TIME DATETIME;
    DECLARE @DURATION_ms INT;
    DROP TABLE IF EXISTS [Gold].[fact_transaction];
    CREATE TABLE [Gold].[fact_transaction] (
			transaction_id INT NOT NULL,
			transaction_date DATE,
			store_code NVARCHAR(20)  NOT NULL,
			account_number INT NOT NULL,
			amount_local DECIMAL(10,2),
			currency NVARCHAR(10),
			document_number NVARCHAR(50),
			[description] NVARCHAR(200),
                CONSTRAINT PK_Gold_FactTransaction PRIMARY KEY (transaction_id),
			CONSTRAINT FK_Transaction_StoreMaster FOREIGN KEY (store_code)
				REFERENCES Silver.store_master(store_code) ON DELETE CASCADE,
			CONSTRAINT FK_Transaction_Account FOREIGN KEY (account_number)
				REFERENCES Silver.account(account_number) ON DELETE CASCADE);

    SET @END_TIME = GETDATE();
    SET @DURATION_ms = DATEDIFF(MILLISECOND, @START_TIME, @END_TIME);
    PRINT 'procedure executed in '+ CAST(@DURATION_ms AS VARCHAR) + 'milliseconds';
    
END;
GO
