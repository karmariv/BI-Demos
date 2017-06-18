/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Descrition: This script creates all the stored procedures used
			  to load the DWClinicReportData Dimensions (except
			  the date dimension)
  Change Log: (When, Who, What)

  @param	param		Desc
*/
-- Select Schema
USE DWClinicReportData;
GO

-- ---------------------------------------------------
-- Load data in DimClincs
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_dimclinics')) IS NOT NULL DROP PROCEDURE usp_etl_load_dimclinics;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_dimclinics
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_clinics_clinics_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[DimClinics] (ClinicID, ClinicName, ClinicCity, ClinicState)
				SELECT 
					ClinicID, 
					ClinicName, 
					ClinicCity, 
					ClinicState
				FROM [dbo].[sta_clinics_clinics_view];					
				PRINT 'Table [dbo].[DimClinics] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_clinics_clinics_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. DimClinics could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO

-- ---------------------------------------------------
-- Load data in DimDoctors
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_dimdoctors')) IS NOT NULL DROP PROCEDURE usp_etl_load_dimdoctors;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_dimdoctors
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_clinics_doctors_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[DimDoctors] (DoctorID, DoctorFullName, DoctorCity, DoctorState)
				SELECT 
					DoctorID,
					DoctorFullName,
					DoctorCity,
					DoctorState
				FROM [dbo].[sta_clinics_doctors_view];	
							
				PRINT 'Table [dbo].[DimDoctors] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_clinics_doctors_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. DimDoctors could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO

-- ---------------------------------------------------
-- Load data in DimPatients
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_dimpatients')) IS NOT NULL DROP PROCEDURE usp_etl_load_dimpatients;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_dimpatients
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_visits_patients_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[DimPatients] (PatientID, PatientFullName, PatientCity, PatientState)
				SELECT 
					PatientID,
					PatientFullName,
					PatientCity,
					PatientState
				FROM [dbo].[sta_visits_patients_view];					
				PRINT 'Table [dbo].[DimPatients] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_visits_patients_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. DimPatients could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO

-- ---------------------------------------------------
-- Load data in DimProcedures
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_dimprocedures')) IS NOT NULL DROP PROCEDURE usp_etl_load_dimprocedures;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_dimprocedures
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_visits_procedures_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[DimProcedures] (ProcedureID, ProcedureName, ProcedureDesc, ProcedureCharge)
				SELECT 
					ProcedureID,
					ProcedureName,
					ProcedureDescription,
					ProcedureCharge	
				FROM [dbo].[sta_visits_procedures_view];					
				PRINT 'Table [dbo].[DimProcedures] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_visits_procedures_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. DimProcedures could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO

-- ---------------------------------------------------
-- Load data in DimShifts
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_dimshifts')) IS NOT NULL DROP PROCEDURE usp_etl_load_dimshifts;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_dimshifts
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_clinics_shifts_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[DimShifts] (ShiftID, ShiftStart, ShiftEnd)
				SELECT 
					ShiftID,
					ShiftStart,
					ShiftEnd
				FROM [dbo].[sta_clinics_shifts_view];					
				PRINT 'Table [dbo].[DimShifts] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_clinics_shifts_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. DimShifts could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO


