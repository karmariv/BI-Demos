--SELECT * FROM Sys.Objects; 
/*
-- TODO
-change the name of the store procedures for drop foreign keys and truncate tables
- CHANGE THE NAME OF THE SP FOR DIMDATE CREATION
*/
-- ---------------------------------------------
-- Dropping fks for FactDoctorsShifts Table
-- ----------------------------------------------

EXECUTE usp_etl_drop_fks @TableName = 'FactDoctorShifts', @ForeignKeyName = 'fkFactDoctorShiftsToDimDates';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactDoctorShifts', @ForeignKeyName = 'fkFactDoctorShiftsToDimClinics';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactDoctorShifts', @ForeignKeyName = 'fkFactDoctorShiftsToDimShifts';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactDoctorShifts', @ForeignKeyName = 'fkFactDoctorShiftsToDimDoctors';
GO

-- ---------------------------------------------
-- Dropping fks for FactVisits Table
-- ----------------------------------------------
EXECUTE usp_etl_drop_fks @TableName = 'FactVisits', @ForeignKeyName = 'fkFactVisitsToDimDates';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactVisits', @ForeignKeyName = 'fkFactVisitsToDimClinics';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactVisits', @ForeignKeyName = 'fkFactVisitsToDimPatients';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactVisits', @ForeignKeyName = 'fkFactVisitsToDimDoctors';
GO
EXECUTE usp_etl_drop_fks @TableName = 'FactVisits', @ForeignKeyName = 'fkFactVisitsToDimProcedures';
GO

-- ---------------------------------------------
-- Cleaning Tables (Truncate data)
-- ----------------------------------------------
EXECUTE usp_etl_truncate_tables @TableName = 'DimClinics';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'DimDates';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'DimDoctors';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'DimPatients';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'DimProcedures';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'DimShifts';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'FactDoctorShifts';
GO
EXECUTE usp_etl_truncate_tables @TableName = 'FactVisits';
GO

-- ---------------------------------------------
-- Build dimensions
-- ----------------------------------------------
EXECUTE usp_etl_load_dimclinics;
GO
EXECUTE usp_etl_load_dimdoctors
GO
EXECUTE usp_etl_load_dimpatients
GO
EXECUTE usp_etl_load_dimprocedures
GO
EXECUTE usp_etl_load_dimshifts
GO
EXECUTE usp_etl_load_date_dimension
GO

-- ---------------------------------------------
-- Build Fact Tables
-- ----------------------------------------------
EXECUTE usp_etl_load_factvisits
GO
EXECUTE usp_etl_load_factdoctorshift
GO

-- ---------------------------------------------
-- Build Foreign Keys
-- ----------------------------------------------
EXECUTE usp_etl_create_fks @TableName = 'FactDoctorShifts', @FieldName = 'ShiftDateKey', @ForeignKeyName = 'fkFactDoctorShiftsToDimDates', @ForeignTable = 'DimDates', @ForeignField = 'DateKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactDoctorShifts', @FieldName = 'ClinicKey', @ForeignKeyName = 'fkFactDoctorShiftsToDimClinics', @ForeignTable = 'DimClinics', @ForeignField = 'ClinicKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactDoctorShifts', @FieldName = 'ShiftKey', @ForeignKeyName = 'fkFactDoctorShiftsToDimShifts', @ForeignTable = 'DimShifts', @ForeignField = 'ShiftKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactDoctorShifts', @FieldName = 'DoctorKey', @ForeignKeyName = 'fkFactDoctorShiftsToDimDoctors', @ForeignTable = 'DimDoctors', @ForeignField = 'DoctorKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactVisits', @FieldName = 'DateKey', @ForeignKeyName = 'fkFactVisitsToDimDates', @ForeignTable = 'DimDates', @ForeignField = 'DateKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactVisits', @FieldName = 'ClinicKey', @ForeignKeyName = 'fkFactVisitsToDimClinics', @ForeignTable = 'DimClinics', @ForeignField = 'ClinicKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactVisits', @FieldName = 'PatientKey', @ForeignKeyName = 'fkFactVisitsToDimPatients', @ForeignTable = 'DimPatients', @ForeignField = 'PatientKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactVisits', @FieldName = 'DoctorKey', @ForeignKeyName = 'fkFactVisitsToDimDoctors', @ForeignTable = 'DimDoctors', @ForeignField = 'DoctorKey';
GO
EXECUTE usp_etl_create_fks @TableName = 'FactVisits', @FieldName = 'ProcedureKey', @ForeignKeyName = 'fkFactVisitsToDimProcedures', @ForeignTable = 'DimProcedures', @ForeignField = 'ProcedureKey';
GO

