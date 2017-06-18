/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description: Creates the staging tables used to extract, and
			   conform data previously to be loaded in the 
			   datawarehouse
  Change Log: (When, Who, What)
  
  @param	Name	Desc
*/
-- Select schema
USE DWClinicReportData;
GO

-- ---------------------------------------------------
-- Create Patients View
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_visits_patients_view')) IS NOT NULL DROP VIEW sta_visits_patients_view;
GO

CREATE VIEW sta_visits_patients_view
AS
	SELECT 
		PatientID = Patients.ID,
		PatientFullName = CAST((FName + ' ' + LName) as nVarchar(100)),
		PatientCity = CAST(City as nVarchar(72)),
		PatientState = CAST(State as nvarchar(50)),
		PatientZipCode = Patients.ZipCode 
	FROM Patients.dbo.Patients;
GO

-- ---------------------------------------------------
-- Create Procedure View
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_visits_procedures_view')) IS NOT NULL DROP VIEW sta_visits_procedures_view;
GO

CREATE VIEW sta_visits_procedures_view
AS
	SELECT 
		ProcedureID = Procedures.ID,
		ProcedureName = CAST(Procedures.Name AS nvarchar(100)),
		ProcedureDescription = CAST(Procedures.[Desc] AS nvarchar(1000)),
		ProcedureCharge = Procedures.Charge
	FROM Patients.dbo.Procedures;
GO

-- ---------------------------------------------------
-- Create Doctors View
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_clinics_doctors_view')) IS NOT NULL DROP VIEW sta_clinics_doctors_view;
GO

CREATE VIEW sta_clinics_doctors_view
AS
	SELECT 
		DoctorID = Doctors.DoctorID,
		DoctorFullName = CAST((FirstName + ' ' + LastName) as nvarchar(200)),
		DoctorEmailAddress = CAST(EmailAddress as nvarchar(100)),
		DoctorCity = CAST(City AS nvarchar(100)),
		DoctorState = CAST(State AS nvarchar(100)),
		DoctorZip = CAST(Zip as nvarchar(5))
	FROM DoctorsSchedules.dbo.Doctors
	
	-- Record to hangle null values from fact tables
	UNION
	SELECT 
		DoctorID = -1,
		DoctorFullName = CAST('Unknown' as nvarchar(200)),
		DoctorEmailAddress = CAST('Unknown' as nvarchar(100)),
		DoctorCity = CAST('Unknown' AS nvarchar(100)),
		DoctorState = CAST('Unknown' AS nvarchar(100)),
		DoctorZip = CAST('-1' as nvarchar(5))
GO

-- ---------------------------------------------------
-- Create Clinics View
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_clinics_clinics_view')) IS NOT NULL DROP VIEW sta_clinics_clinics_view;
GO

CREATE VIEW sta_clinics_clinics_view
AS
	SELECT 
		ClinicID = Clinics.ClinicID,
		ClinicName = CAST(ClinicName as nvarchar(100)),
		ClinicCity = CAST(City as nvarchar(100)),
		ClinicState = CAST(State as nvarchar(100)),
		ClinicZip = CAST(Zip as nvarchar(5))
	FROM DoctorsSchedules.dbo.Clinics;
GO

-- ---------------------------------------------------
-- Create Shift View
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_clinics_shifts_view')) IS NOT NULL DROP VIEW sta_clinics_shifts_view;
GO

CREATE VIEW sta_clinics_shifts_view
AS
SELECT
	ShiftID,
	ShiftStart = ROUND(DATEPART(hour, ShiftStart) + DATEPART(minute, ShiftStart) / 60 + DATEPART(second, ShiftStart) / 3600, 0),
	ShiftEnd = ROUND(DATEPART(hour, ShiftEnd)  + DATEPART(minute, ShiftEnd) / 60 + DATEPART(second, ShiftEnd) / 3600, 0)
FROM
	(SELECT 
		ShiftID = Shifts.ShiftID,
		ShiftStart = CASE
						WHEN ShiftStart = '01:00' THEN '13:00'
						ELSE ShiftStart
					 END,
		ShiftEnd  = CASE
						WHEN ShiftEnd = '05:00' THEN '17:00'
						ELSE ShiftEnd
					 END
	FROM DoctorsSchedules.dbo.Shifts) AS TBL;
GO

-- ---------------------------------------------------
-- Validate tables
-- ----------------------------------------------------
SELECT * FROM sta_visits_patients_view;
SELECT * FROM sta_visits_procedures_view;
SELECT * FROM sta_clinics_doctors_view;
SELECT * FROM sta_clinics_clinics_view;
SELECT * FROM sta_clinics_shifts_view;