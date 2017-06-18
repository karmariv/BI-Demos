/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description:	This scripts creates the stored procedured used to truncate 
				the data for a table specified by the user
  Change Log: (When, Who, What)

  @param	TableName		Database table name
*/

-- Select Schema
USE DWClinicReportData;
GO

-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_truncate_tables')) IS NOT NULL DROP PROCEDURE usp_etl_truncate_tables;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_truncate_tables
	@TableName			nVarchar(120)	-- Table Name
AS
BEGIN
	BEGIN TRY
		-- Verify if Table exist
		IF(SELECT OBJECT_ID(@TableName)) IS NOT NULL
			BEGIN
				EXEC('TRUNCATE TABLE [dbo].[' + @TableName + ']');
				PRINT 'Table [dbo].[' + @TableName + '] has been truncated';
			END
		ELSE
			PRINT 'Table [dbo].[' + @TableName + '] does not exist'; 
	END TRY
	BEGIN CATCH
		PRINT 'Failure truncating table [dbo].[' + @TableName + ']';
		PRINT ERROR_MESSAGE()
	END CATCH
RETURN
END
GO
