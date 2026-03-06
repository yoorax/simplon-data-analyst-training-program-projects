-- ============================================================
-- Hospital Database - Fact Table Creation
-- ============================================================
-- Creates the central FactTable with primary key,
-- foreign key columns, and all FK constraints linking
-- to the 8 dimension tables.
-- ============================================================

CREATE TABLE FactTable (
    FactTablePK INT NOT NULL PRIMARY KEY,           -- Primary key

    dimPatientPK INT NOT NULL,                      -- FK to dimPatient
    dimPhysicianPK INT NOT NULL,                    -- FK to dimPhysician
    dimDatePostPK INT NOT NULL,                     -- FK to dimDatePost
    dimDateServicePK INT NOT NULL,                  -- FK to dimDateService
    dimCPTCodePK INT NOT NULL,                      -- FK to dimCptCode
    dimPayerPK INT NOT NULL,                        -- FK to dimPayer
    dimTransactionPK INT NOT NULL,                  -- FK to dimTransaction
    dimLocationPK INT NOT NULL,                     -- FK to dimLocation

    PatientNumber INT NOT NULL,                     -- Patient number

    dimDiagnosisCodePK INT NOT NULL,                -- FK to dimDiagnosisCode

    CPTUnits INT NOT NULL,                          -- Number of CPT units
    GrossCharge DECIMAL(10,2) NOT NULL,             -- Total charge
    Payment DECIMAL(10,2) NOT NULL,                 -- Payment amount
    Adjustment DECIMAL(10,2) NOT NULL,              -- Adjustments
    AR DECIMAL(10,2) NOT NULL,                      -- Accounts Receivable

    CONSTRAINT FK_FactTable_dimPatient              -- Table 1
        FOREIGN KEY (dimPatientPK) REFERENCES dimPatient(dimPatientPK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimPhysician            -- Table 2
        FOREIGN KEY (dimPhysicianPK) REFERENCES dimPhysician(dimPhysicianPK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimDate                 -- Table 3
        FOREIGN KEY (dimDatePostPK) REFERENCES dimDate(dimDatePostPK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimCptCode              -- Table 4
        FOREIGN KEY (dimCPTCodePK) REFERENCES dimCptCode(dimCPTCodePK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimPayer                -- Table 5
        FOREIGN KEY (dimPayerPK) REFERENCES dimPayer(dimPayerPK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimTransaction          -- Table 6
        FOREIGN KEY (dimTransactionPK) REFERENCES dimTransaction(dimTransactionPK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimLocation             -- Table 7
        FOREIGN KEY (dimLocationPK) REFERENCES dimLocation(dimLocationPK) ON DELETE CASCADE,
    CONSTRAINT FK_FactTable_dimDiagnosisCode        -- Table 8
        FOREIGN KEY (dimDiagnosisCodePK) REFERENCES dimDiagnosisCode(dimDiagnosisCodePK) ON DELETE CASCADE
);
