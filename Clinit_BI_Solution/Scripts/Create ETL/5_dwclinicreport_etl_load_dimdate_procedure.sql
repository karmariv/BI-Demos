/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description: This script builds the date dimension
  Change Log: (When, Who, What)
			
  @param	param				Description
*/
USE DWClinicReportData;
GO

-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_load_date_dimension')) IS NOT NULL DROP PROCEDURE usp_etl_load_date_dimension;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_load_date_dimension
AS
BEGIN
	DECLARE 
	@StartDate 		datetime = '01/01/2005',
	@EndDate		datetime = '01/01/2011',
	@DateInProcess	datetime
	
	BEGIN TRY
		SET @DateInProcess = @StartDate;
		
		WHILE @DateInProcess <= @EndDate
		BEGIN
			INSERT INTO [dbo].[DimDates](DateKey, FullDate, FullDateName, MonthID, [MonthName], YearID, YearName)
			VALUES (
				CAST(CONVERT(nvarchar(50), @DateInProcess , 112) as int), -- 112 = yyyymmdd
				@DateInProcess, -- mm/dd/yyyy
				CAST((DATENAME(month, @DateInProcess) + ' ' + DATENAME(day, @DateInProcess) + ', ' + DATENAME(year, @DateInProcess)) as nvarchar(50)),
				MONTH(@DateInProcess),
				CAST(DATENAME(month, @DateInProcess) as nvarchar(50)),
				YEAR(@DateInProcess ),
				Cast(Year(@DateInProcess ) as nVarchar(50)) 
			);
				
			-- Add a day and loop again
			SET @DateInProcess = DATEADD(d, 1, @DateInProcess)
		END
			
		-- Add additional lookup values to DimDates
		INSERT INTO [dbo].[DimDates](DateKey, FullDate, FullDateName, MonthID, [MonthName], YearID, YearName)
			SELECT
			[DateKey] = -1,
			[FullDate] = -1,
			[FullDateName] = CAST('Unknown' as nvarchar(50)),
			[MonthID] = -1,
			[MonthName] = CAST('Unknown' as nvarchar(50)),
			[YearID] = -1,
			[YearName] = CAST('Unknown' as nVarchar(50))
		UNION
			SELECT
			[DateKey] = -2,
			[FullDate] = -2,
			[FullDateName] = CAST('Corrupt' as nvarchar(50)),
			[MonthID] = -2,
			[MonthName] = CAST('Corrupt' as nvarchar(50)),
			[YearID] = -2,
			[YearName] = CAST('Corrupt' as nVarchar(50));
			
		Print @StartDate;
		Print @EndDate;
		Print @DateInProcess;
	END TRY
	BEGIN CATCH
		PRINT 'Failure during loading DimDates';
		PRINT ERROR_MESSAGE()
	END CATCH
	RETURN
END
GO
 
