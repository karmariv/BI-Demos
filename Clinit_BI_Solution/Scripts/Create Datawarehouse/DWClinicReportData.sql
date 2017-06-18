/***************************************************************************
ETL Final Project: DWClinicReportData
Dev: RRoot
Date:2/21/2017
Desc: This is a Data Warehouse for the Patient and DoctorsSchedule Databases.
	  ETL processing issues.
ChangeLog: (Who, When, What) 
			RRoot, 3/3/17, removed addresses from DimPatients
			RRoot, 3/4/17, removed addresses from DimDoctors and DimClinic
			RRoot, 3/4/17, altered the file description
			RRoot, 3/7/17, added names to all PK and FK constraints
			KRivas, 20/4/17, Removed all zip codes
			KRivas, 20/4/17, DoctorEmailAddress removed
			KRivas, 20/4/17, Changing data types from time(0) to int for fields [dbo].[DimShifts].[ShiftStart] and [dbo].[DimShifts].[ShiftEnd]
			KRivas, 20/4/17, Removed Identity from DimDates.DateKey
*****************************************************************************/
Use Master;
go

If Exists (Select * From Sys.databases where Name = 'DWClinicReportData')
  Begin
   Alter Database DWClinicReportData set single_user with rollback immediate;
   Drop Database DWClinicReportData;
  End
go

Create Database DWClinicReportData;
go

Use DWClinicReportData;
go

Create Table DimDates
(DateKey int Constraint pkDimDates Primary Key
,FullDate datetime Not Null
,FullDateName nvarchar (50) Not Null 
,MonthID int Not Null
,[MonthName] nvarchar(50) Not Null
,YearID int Not Null
,YearName nvarchar(50) Not Null
);
go

Create Table DimClinics
(ClinicKey int Constraint pkDimClinics Primary Key Identity
,ClinicID int Not Null
,ClinicName nvarchar(100) Not Null 
,ClinicCity nvarchar(100) Not Null
,ClinicState nvarchar(100) Not Null
);
go

Create Table DimDoctors
(DoctorKey int Constraint pkDimDoctors Primary Key Identity
,DoctorID int Not Null  
,DoctorFullName nvarchar(200) Not Null 
,DoctorCity nvarchar(100) Not Null
,DoctorState nvarchar(100) Not Null
);
go

Create Table DimShifts 
(ShiftKey int Constraint pkDimShifts Primary Key Identity
,ShiftID int Not Null
,ShiftStart int Not Null
,ShiftEnd int Not Null
);
go

Create Table FactDoctorShifts
(DoctorsShiftID int Not Null
,ShiftDateKey int Constraint fkFactDoctorShiftsToDimDates References DimDates(DateKey) Not Null
,ClinicKey int Constraint fkFactDoctorShiftsToDimClinics References DimClinics(ClinicKey) Not Null
,ShiftKey int Constraint fkFactDoctorShiftsToDimShifts References DimShifts(ShiftKey) Not Null
,DoctorKey int Constraint fkFactDoctorShiftsToDimDoctors References DimDoctors(DoctorKey) Not Null
,HoursWorked int
Constraint pkFactDoctorShifts Primary Key(DoctorsShiftID, ShiftDateKey , ClinicKey, ShiftKey, DoctorKey)
);
go

Create Table DimProcedures
(ProcedureKey int Constraint pkDimProcedures Primary Key Identity
,ProcedureID int Not Null
,ProcedureName varchar(100) Not Null
,ProcedureDesc varchar(1000) Not Null
,ProcedureCharge money Not Null 
);
go

Create Table DimPatients
(PatientKey int Constraint pkDimPatients Primary Key Identity
,PatientID int Not Null
,PatientFullName varchar(100) Not Null
,PatientCity varchar(100) Not Null
,PatientState varchar(100) Not Null
);
go

Create Table FactVisits
(VisitKey int Not Null
,DateKey int Constraint fkFactVisitsToDimDates References DimDates(DateKey) Not Null
,ClinicKey int Constraint fkFactVisitsToDimClinics References DimClinics(ClinicKey) Not Null
,PatientKey int Constraint fkFactVisitsToDimPatients References DimPatients(PatientKey) Not Null
,DoctorKey int Constraint fkFactVisitsToDimDoctors References DimDoctors(DoctorKey) Not Null
,ProcedureKey int Constraint fkFactVisitsToDimProcedures References DimProcedures(ProcedureKey) Not Null 
,Charge money  Not Null
Constraint pkFactVisits Primary Key(VisitKey, DateKey, ClinicKey, PatientKey, DoctorKey, ProcedureKey)
);
go
