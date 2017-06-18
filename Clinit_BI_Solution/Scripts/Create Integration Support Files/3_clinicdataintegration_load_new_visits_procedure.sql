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

IF(SELECT OBJECT_ID('usp_integrate_visits')) IS NOT NULL DROP PROCEDURE usp_integrate_visits;
GO

CREATE PROCEDURE usp_integrate_visits
AS
BEGIN
	BEGIN TRY
		WITH NewRows
		AS (
			SELECT 
				[Date] = Cast([Date] as datetime) + CAST([Time] as datetime),
				[Clinic] = Case Cast([Clinic] as int) When 1 then 100 When 2 then 200 When 3 then 300 End,
				[Patient] = Cast([Patient] as int),
				[Doctor] = Cast([Doctor] as int),
				[Procedure] = Cast([Procedure] as int),
				[Charge] =  Cast([Charge] as money)
			FROM sta_visits_new_tmp
			EXCEPT
			SELECT [Date], Clinic, Patient, Doctor, [Procedure], Charge FROM [Patients].[dbo].[Visits]
		)
		INSERT INTO [Patients].[dbo].[Visits]([Date], Clinic, Patient, Doctor, [Procedure], Charge)
		SELECT 
			[Date], Clinic, Patient, Doctor, [Procedure], Charge
		FROM NewRows;
		
		PRINT 'New Records successfull added to [Patients].[dbo].[Visits]';
		
	END TRY
	BEGIN CATCH
		PRINT 'Error in New Data ETL for [Patients].[dbo].[Visits]';
		PRINT ERROR_MESSAGE() ;
	END CATCH
END