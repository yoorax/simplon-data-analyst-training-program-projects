-- 1. Count rows where GrossCharge >100:
SELECT COUNT(FactTablePK) AS RowsCount
FROM FactTable
WHERE GrossCharge >100;


--2. How many different patients are there in the database?

SELECT COUNT(DISTINCT PatientNumber) AS PatientCount
FROM FactTable;

--3. For each group of CPT codes, indicate how many codes exist.
SELECT COUNT(DISTINCT CptCode) AS CPTCodeCount,
	   CptGrouping
FROM dimCptCode
GROUP BY CptGrouping
ORDER BY CPTCodeCount DESC;
 

--4. How many doctors have made at least one Medicare claim?

SELECT dimPhy.ProviderName
      ,COUNT(dimT.TransactionType) AS "Claim"
FROM FactTable FT 
JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK
WHERE TransactionType = 'charge'
GROUP BY ProviderName
HAVING COUNT(dimT.TransactionType) >= 1
Order BY "Claim" DESC;

--5. CPT Codes with over 100 units :

SELECT dimCC.CptCode
	  ,FT.CPTUnits
FROM FactTable FT
JOIN dimCptCode dimCC ON dimCC.dimCPTCodePK = FT.dimCPTCodePK
WHERE CPTUnits > 100
ORDER BY CPTUnits ASC;

--6. Identify the specialty and show the monthly payments for that specialty:

SELECT 
    dimPhy.ProviderSpecialty,
    dimD.Year,
    dimD.Month,
    SUM(FT.Payment) AS TotalMonthlyPayments

FROM FactTable FT
JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK
JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
JOIN dimDate dimD ON dimD.dimDatePostPK = FT.dimDatePostPK

WHERE dimT.TransactionType = 'Payment'
GROUP BY dimPhy.ProviderSpecialty, dimD.Year, dimD.Month
ORDER BY dimPhy.ProviderSpecialty, dimD.Year, dimD.Month;

--7. How many CPT units are assigned to diagnoses whose code contains the letter J :
SELECT dimDC.DiagnosisCode
      ,dimDC.DiagnosisCodeDescription
	  ,COUNT(FT.CPTUnits) AS "Total CPTUnits"

FROM FactTable FT
JOIN dimDiagnosisCode dimDC ON dimDC.dimDiagnosisCodePK = FT.dimDiagnosisCodePK

WHERE dimDC.DiagnosisCode LIKE '%J%'
GROUP BY dimDC.DiagnosisCode, dimDC.DiagnosisCodeDescription
ORDER BY "Total CPTUnits" DESC;

--8. Group patients into three age groups: <18 years, 18-65 years, >65 years
SELECT PatientNumber
	  ,FirstName+' '+LastName AS "Patient Full Name"
	  ,CASE 
	       WHEN PatientAge <= 18 THEN 'Young Patient'
		   WHEN PatientAge > 18 AND PatientAge <= 65 THEN 'Adult Patient'
		   WHEN PatientAge > 65 THEN 'Old Patient'
		   END AS AgeCategorie
	  ,PatientAge 
	  ,Email 
	  ,City+', '+State AS "Patient Address"

FROM dimPatient
ORDER BY PatientAge DESC;

--9. Analysis of charges and payments by physician and transaction type:
