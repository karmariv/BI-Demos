/*******************************************************
  Author: Karla Rivas
  Date: 03/07/2017
  Description:	This script create the stored procedure used to recreate
				foreigh keys
  Change Log: (When, Who, What)

  @param	TableName		Database table name
  @param	ForeignKeyName
*/
-- Select Schema
USE DWClinicReportData;
GO

-- Drop procedure if exist
IF (SELECT OBJECT_ID('usp_etl_create_fks')) IS NOT NULL DROP PROCEDURE usp_etl_create_fks;
GO

-- Create stored Procedure
CREATE PROCEDURE usp_etl_create_fks
	@TableName			nVarchar(120),	-- Table Name
	@FieldName			nVarchar(120),
	@ForeignKeyName		nVarchar(120),	-- Foreign Key Name
	@ForeignTable		nVarchar(120),
	@ForeignField		nVarchar(120)
	
AS
	BEGIN
		BEGIN TRY
			-- Verify if Table exist
			IF(SELECT OBJECT_ID(@TableName)) IS NOT NULL
				--Verify if Foreign key exist
	 			IF(SELECT OBJECT_ID(@ForeignKeyName)) IS NULL
					 BEGIN
						EXEC('ALTER TABLE [dbo].[' + @TableName + '] ADD CONSTRAINT [' + @ForeignKeyName + '] FOREIGN KEY ([' + @FieldName + ']) REFERENCES [dbo].[' + @ForeignTable + ']([' + @ForeignField + '])');
						PRINT 'Success creating ' + @ForeignKeyName + ' FKs for [dbo].[' + @TableName + ']';
					 END
				ELSE
					PRINT 'Foreign Key ' + @ForeignKeyName + ' already exists';
			ELSE
				PRINT 'Table [dbo].[' + @TableName + '] does not exist'; 
		END TRY
		BEGIN CATCH
			PRINT 'Failure in creating ' + @ForeignKeyName + ' FKs for [dbo].[' + @TableName + ']';
			PRINT ERROR_MESSAGE()
		END CATCH
		RETURN
	END
GO


