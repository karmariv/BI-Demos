/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description: Load the data from text files  into the
			   OLTP System
  Change Log: (When, Who, What)
  
  @param	Name	Desc
*/
USE [DWClinicReportData]
GO

IF(SELECT OBJECT_ID('usp_integrate_patients')) IS NOT NULL DROP PROCEDURE usp_integrate_patients;
GO

CREATE PROCEDURE usp_integrate_patients
AS
BEGIN
	BEGIN TRY
		WITH NewRows
		AS (
			SELECT 
				[FName] = Cast([FName] as varchar(28)),
				[LName] = Cast([LName] as varchar(29)),
				[Email] = Cast([Email] as varchar(100)),
				[Address] = Cast([Address] as varchar(97)),
				[City] = Cast([City] as varchar(72)),
				[State] = Cast([State] as varchar(50)),
				[ZipCode] = Cast(Zip as int)
			FROM sta_patients_new_tmp
			EXCEPT
				SELECT FName, LName, Email, Address, City, [State], ZipCode FROM [Patients].[dbo].[Patients]
		)
		INSERT INTO [Patients].[dbo].[Patients](FName, LName, Email, Address, City, [State], ZipCode)
		SELECT 
			FName, LName, Email, Address, City, [State], ZipCode
		FROM NewRows;
		
		PRINT 'New Records successfull added to [Patients].[dbo].[Patients]';
		
	END TRY
	BEGIN CATCH
		PRINT 'Error in New Data ETL for [Patients].[dbo].[Patients]';
		PRINT ERROR_MESSAGE() ;
	END CATCH
END
