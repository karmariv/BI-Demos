/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description: Create store procedures to load the fact tables
			   in the datawarehouse
  Change Log: (When, Who, What)
  
  @param	param		DESC
*/

-- Select Schema
USE DWClinicReportData;
GO

-- ---------------------------------------------------
-- Load data in FactVisits
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_factvisits')) IS NOT NULL DROP PROCEDURE usp_etl_load_factvisits;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_factvisits
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_visits_visits_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[FactVisits] (VisitKey, DateKey, ClinicKey, PatientKey, DoctorKey, ProcedureKey, Charge)
				SELECT 
					VisitKey,
					DateKey,
					ClinicKey,
					PatientKey,
					DoctorKey,
					ProcedureKey,
					Charge
				FROM [dbo].sta_visits_visits_view;					
				PRINT 'Table [dbo].[FactVisits] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_visits_visits_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. FactVisits could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO

-- ---------------------------------------------------
-- Load data in FactDoctorShifts
-- ----------------------------------------------------
-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_factdoctorshift')) IS NOT NULL DROP PROCEDURE usp_etl_load_factdoctorshift;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_factdoctorshift
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID('sta_clinics_schedules_view')) IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[FactDoctorShifts] (DoctorsShiftID, ShiftDateKey, ClinicKey, ShiftKey, DoctorKey, HoursWorked)
				SELECT 
					DoctorsShiftID,
					ShiftDateKey,
					ClinicKey,
					ShiftKey,
					DoctorKey,
					HoursWorked
				FROM [dbo].sta_clinics_schedules_view;					
				PRINT 'Table [dbo].[FactDoctorShifts] has been loaded';
			END
		ELSE
			PRINT 'Table [dbo].[sta_visits_visits_view] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure. FactDoctorShifts could not be loaded';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO