/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description: Created the staging tables used to extract and
			   conform data previouly to be loaded in the data
			   warehouse
  Change Log: (When, Who, What)
			
  @param	Name	Desc
*/
USE DWClinicReportData;
GO

-- ---------------------------------------------------
-- Load and conform visits data
-- Clinic ID will be normalized
-- Codes: 
-- 100 --> changed to 1
-- 200 --> changed to 2
-- 300 --> changed to 3
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_visits_visits_conformed_view')) IS NOT NULL DROP VIEW sta_visits_visits_conformed_view;
GO

CREATE VIEW sta_visits_visits_conformed_view
AS
	SELECT 
		ID,
		Clinic =CASE 
					WHEN Clinic = 100 THEN 1 
					WHEN Clinic = 200 THEN 2
					WHEN Clinic = 300 THEN 3
				END,
		[Date],
		Patient,
		Doctor = ISNULL(Doctor, -1),
		[Procedure],
		Charge
	FROM Patients.dbo.Visits;
GO

-- ---------------------------------------------------
-- Create visits view, to be later used to load fact
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_visits_visits_view')) IS NOT NULL DROP VIEW sta_visits_visits_view;
GO

CREATE VIEW sta_visits_visits_view
AS
	SELECT
		VisitKey = visits.ID,
		DateKey =  Cast(Convert(nvarchar(50), visits.Date , 112) as int),
		ClinicKey = clinic.ClinicKey,
		PatientKey = patient.PatientKey,
		DoctorKey = doctor.DoctorKey,
		ProcedureKey = [procedure].ProcedureKey,
		Charge = visits.Charge
	FROM DWClinicReportData.dbo.sta_visits_visits_conformed_view visits
	LEFT JOIN DWClinicReportData.dbo.DimClinics clinic ON clinic.ClinicID = visits.Clinic
	LEFT JOIN DWClinicReportData.dbo.DimPatients patient ON patient.PatientID = visits.Patient
	LEFT JOIN DWClinicReportData.dbo.DimDoctors	doctor ON doctor.DoctorID = visits.Doctor
	LEFT JOIN DWClinicReportData.dbo.DimProcedures [procedure] ON [procedure].ProcedureID = visits.[Procedure];
GO

-- ---------------------------------------------------
-- Create visits view, to be later used to load fact
-- ----------------------------------------------------
IF (SELECT OBJECT_ID('sta_clinics_schedules_view')) IS NOT NULL DROP VIEW sta_clinics_schedules_view;
GO

CREATE VIEW sta_clinics_schedules_view
AS
	SELECT
		DoctorsShiftID = DoctorsShiftID,
		ShiftDateKey = Cast(Convert(nvarchar(50), doctorshifts.ShiftDate , 112) as int),
		ClinicKey = clinic.ClinicKey,
		ShiftKey = shifts.ShiftKey,
		DoctorKey = doctor.DoctorKey,
		HoursWorked = shifts.ShiftEnd - shifts.ShiftStart
	FROM DoctorsSchedules.dbo.DoctorShifts doctorshifts
	LEFT JOIN DWClinicReportData.dbo.DimClinics clinic ON clinic.ClinicID = doctorshifts.ClinicID
	LEFT JOIN DWClinicReportData.dbo.DimShifts shifts ON shifts.ShiftID = doctorshifts.ShiftID
	LEFT JOIN DWClinicReportData.dbo.DimDoctors	doctor ON doctor.DoctorID = doctorshifts.DoctorID;
GO
