/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description: Creates the staging tables used during the
			   clinic data integration
  Change Log: (When, Who, What)
  
  @param	TableName	Name of the table to be created
*/
-- Select schema
USE DWClinicReportData;
GO

-- ---------------------------------------------------------
-- Create Patients staging table
-- ---------------------------------------------------------
IF(SELECT OBJECT_ID('usp_create_patients_staging_table')) IS NOT NULL DROP PROCEDURE usp_create_patients_staging_table;
GO

CREATE PROCEDURE usp_create_patients_staging_table
	@TableName		nvarchar(120)
AS
BEGIN
	BEGIN TRY
		-- ETL Processing Code --
			SET NoCount ON;
			-- 	NewPatientsStaging  --
			If (SELECT OBJECT_ID(@TableName)) IS NOT NULL
				EXEC ('TRUNCATE TABLE ' + @TableName);
			ELSE
				EXEC (
				'CREATE TABLE [dbo].[' + @TableName + '](
					[FName] [varchar](100) NULL,
					[LName] [varchar](100) NULL,
					[Email] [varchar](100) NULL,
					[Address] [varchar](100) NULL,
					[City] [varchar](100) NULL,
					[State] [varchar](100) NULL,
					[Zip] [varchar](100) NULL)'
				);
				
			SET NoCount OFF;	
		-- ETL Processing Code --
		PRINT 'Success in Creating sta_patients_new_temp Staging Tables'
	END TRY
	BEGIN CATCH
		PRINT 'Error in Creating or Clearing ETL Staging Tables'
		PRINT ERROR_MESSAGE() 
	END CATCH
END
GO

-- ---------------------------------------------------------
-- Create medical consultation table (visits)
-- ---------------------------------------------------------
IF(SELECT OBJECT_ID('usp_create_visits_staging_table')) IS NOT NULL DROP PROCEDURE usp_create_visits_staging_table;
GO

CREATE PROCEDURE usp_create_visits_staging_table
	@TableName		nvarchar(120)
AS
BEGIN
	BEGIN TRY
		-- ETL Processing Code --
			SET NoCount ON;
			-- 	NewPatientsStaging  --
			If (SELECT OBJECT_ID(@TableName)) IS NOT NULL
				EXEC ('TRUNCATE TABLE ' + @TableName);
			ELSE
				EXEC (
				'CREATE TABLE [dbo].[' + @TableName + '](
					[Date] [varchar](100) NULL,
					[Time] [varchar](100) NULL,
					[Clinic] [varchar](100) NULL,
					[Patient] [varchar](100) NULL,
					[Doctor] [varchar](100) NULL,
					[Procedure] [varchar](100) NULL,
					[Charge] [varchar](100) NULL)'
				);
				
			SET NoCount OFF;	
		-- ETL Processing Code --
		PRINT 'Success in Creating usp_create_visits_staging_table Staging Tables'
	END TRY
	BEGIN CATCH
		PRINT 'Error in Creating or Clearing ETL Staging Tables'
		PRINT ERROR_MESSAGE() 
	END CATCH
END
GO