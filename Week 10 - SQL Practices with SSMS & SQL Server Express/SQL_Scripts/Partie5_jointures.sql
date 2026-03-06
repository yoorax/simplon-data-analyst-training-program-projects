-- 1. patient informations table :
SELECT FT.PatientNumber
	  ,dimP.FirstName+' '+dimP.LastName AS "Patient Full Name"
	  ,dimP.PatientGender 
	  ,dimP.PatientAge 
	  ,dimP.City+', '+dimP.State AS "Patient Address" 
	  ,dimDC.DiagnosisCodeDescription AS "Diagnosis Type"
	  ,dimL.LocationName AS "Hospital Location"
	  ,dimPhy.ProviderName AS "Associated Physician"
	  ,dimT."Transaction"
	  ,dimT.TransactionType AS "Transaction Type"
	  ,dimCC.CptDesc AS "CPT desciption"
	  ,dimCC.CptGrouping AS "CPT Group"
	  ,FT.CPTUnits AS "CPT Units"
	   FROM FactTable FT
	   JOIN dimPatient dimP ON FT.dimPatientPK = dimP.dimPatientPK
	   JOIN dimDiagnosisCode dimDC ON FT.dimDiagnosisCodePK = dimDC.dimDiagnosisCodePK
	   JOIN dimLocation dimL ON dimL.dimLocationPK = FT.dimLocationPK
	   JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK
	   JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
	   JOIN dimCptCode dimCC ON dimCC.dimCPTCodePK = FT.dimCPTCodePK
	   ;



-- 2. Patient dates information:

SELECT FT.PatientNumber
      ,dimP.FirstName + ' ' + dimP.LastName AS "Patient Full Name"
	  ,CAST(dimD.[Month] AS varchar(10)) + ' ' +
	   CAST(dimD.[Day] AS varchar(2)) + ', ' +
       CAST(dimD.[Year] AS varchar(4)) AS [Post Date]

	  ,FORMAT(CONVERT(DATE,
					  CAST(dimDateServicePK AS char(8))
			         ), 'MMMM dd, yyyy'
			 ) AS "Service Date"

	  FROM FactTable FT
	  JOIN dimPatient dimP ON dimP.dimPatientPK = FT.dimPatientPK
	  JOIN dimDate dimD ON dimD.dimDatePostPK = FT.dimDatePostPK
	  ;

--3. information on doctors and charges

SELECT dimPhy.ProviderName
      ,dimPhy.ProviderSpecialty
	  ,dimPhy.ProviderFTE*100 AS "Provider FTE %"
	  ,FT.CPTUnits
	  ,dimT.TransactionType
	  ,FT.GrossCharge
	  ,FT.AR
	  FROM FactTable FT
	  JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
	  JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK;

--4. diagnostic codes and CPT codes

SELECT FT.PatientNumber
	  ,dimP.FirstName+' '+dimP.LastName AS "Patient Full Name"
	  ,dimPhy.ProviderName
	  ,dimDC.DiagnosisCode
	  ,dimDC.DiagnosisCodeDescription
	  ,dimCC.CptCode
	  ,dimCC.CptDesc AS "CPT Description"
	  FROM FactTable FT
	   JOIN dimPatient dimP ON FT.dimPatientPK = dimP.dimPatientPK
	   JOIN dimDiagnosisCode dimDC ON FT.dimDiagnosisCodePK = dimDC.dimDiagnosisCodePK
	   JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK
	   JOIN dimCptCode dimCC ON dimCC.dimCPTCodePK = FT.dimCPTCodePK

--5. transactions, payments and adjustments :

SELECT FT.PatientNumber
	  ,dimP.FirstName+' '+dimP.LastName AS "Patient Full Name"
	  ,dimT."Transaction"
	  ,dimT.TransactionType AS "Transaction Type"
	  ,FT.GrossCharge
	  ,FT.Payment
	  ,FT.Adjustment
	  ,FT.AR
	   FROM FactTable FT
	   JOIN dimPatient dimP ON FT.dimPatientPK = dimP.dimPatientPK
	   JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
	   ;

