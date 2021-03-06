USE DoctorsSchedules;
/***************************************************
-- Analyzing Patients table
****************************************************/
SELECT * FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'DoctorID' as [COLUMN NAME],
	COUNT(DoctorID) AS [TOTAL RECORDS],
	(SELECT COUNT(DoctorID) FROM Doctors WHERE DoctorID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(DoctorID) FROM Doctors) AS [NULL COUNT],
	MIN(DoctorID) AS [LOW VALUE],
	MAX(DoctorID) AS [HIGH VALUE],
	MIN(LEN(DoctorID)) AS [MINIMUM LENGTH],
	MAX(LEN(DoctorID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT DoctorID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(DoctorID) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY DoctorID HAVING COUNT(DoctorID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(DoctorID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(DoctorID) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY DoctorID HAVING COUNT(DoctorID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'FirstName' as [COLUMN NAME],
	COUNT(FirstName) AS [TOTAL RECORDS],
	(SELECT COUNT(FirstName) FROM Doctors WHERE FirstName = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(FirstName) FROM Doctors) AS [NULL COUNT],
	MIN(FirstName) AS [LOW VALUE],
	MAX(FirstName) AS [HIGH VALUE],
	MIN(LEN(FirstName)) AS [MINIMUM LENGTH],
	MAX(LEN(FirstName)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT FirstName) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(FirstName) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY FirstName HAVING COUNT(FirstName) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(FirstName) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(FirstName) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY FirstName HAVING COUNT(FirstName) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'LastName' as [COLUMN NAME],
	COUNT(LastName) AS [TOTAL RECORDS],
	(SELECT COUNT(LastName) FROM Doctors WHERE LastName = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(LastName) FROM Doctors) AS [NULL COUNT],
	MIN(LastName) AS [LOW VALUE],
	MAX(LastName) AS [HIGH VALUE],
	MIN(LEN(LastName)) AS [MINIMUM LENGTH],
	MAX(LEN(LastName)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT LastName) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(LastName) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY LastName HAVING COUNT(LastName) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(LastName) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(LastName) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY LastName HAVING COUNT(LastName) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'EmailAddress' as [COLUMN NAME],
	COUNT(EmailAddress) AS [TOTAL RECORDS],
	(SELECT COUNT(EmailAddress) FROM Doctors WHERE EmailAddress = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(EmailAddress) FROM Doctors) AS [NULL COUNT],
	MIN(EmailAddress) AS [LOW VALUE],
	MAX(EmailAddress) AS [HIGH VALUE],
	MIN(LEN(EmailAddress)) AS [MINIMUM LENGTH],
	MAX(LEN(EmailAddress)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT EmailAddress) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(EmailAddress) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY EmailAddress HAVING COUNT(EmailAddress) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(EmailAddress) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(EmailAddress) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY EmailAddress HAVING COUNT(EmailAddress) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'Address' as [COLUMN NAME],
	COUNT(Address) AS [TOTAL RECORDS],
	(SELECT COUNT(Address) FROM Doctors WHERE Address = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(Address) FROM Doctors) AS [NULL COUNT],
	MIN(Address) AS [LOW VALUE],
	MAX(Address) AS [HIGH VALUE],
	MIN(LEN(Address)) AS [MINIMUM LENGTH],
	MAX(LEN(Address)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT Address) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Address) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY Address HAVING COUNT(Address) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(Address) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Address) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY Address HAVING COUNT(Address) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'City' as [COLUMN NAME],
	COUNT(City) AS [TOTAL RECORDS],
	(SELECT COUNT(City) FROM Doctors WHERE City = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(City) FROM Doctors) AS [NULL COUNT],
	MIN(City) AS [LOW VALUE],
	MAX(City) AS [HIGH VALUE],
	MIN(LEN(City)) AS [MINIMUM LENGTH],
	MAX(LEN(City)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT City) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(City) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY City HAVING COUNT(City) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(City) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(City) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY City HAVING COUNT(City) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'State' as [COLUMN NAME],
	COUNT(State) AS [TOTAL RECORDS],
	(SELECT COUNT(State) FROM Doctors WHERE State = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(State) FROM Doctors) AS [NULL COUNT],
	MIN(State) AS [LOW VALUE],
	MAX(State) AS [HIGH VALUE],
	MIN(LEN(State)) AS [MINIMUM LENGTH],
	MAX(LEN(State)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT State) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(State) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY State HAVING COUNT(State) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(State) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(State) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY State HAVING COUNT(State) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

SELECT 
	'Doctors' as [TABLE NAME],
	'Zip' as [COLUMN NAME],
	COUNT(Zip) AS [TOTAL RECORDS],
	(SELECT COUNT(Zip) FROM Doctors WHERE Zip = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(Zip) FROM Doctors) AS [NULL COUNT],
	MIN(Zip) AS [LOW VALUE],
	MAX(Zip) AS [HIGH VALUE],
	MIN(LEN(Zip)) AS [MINIMUM LENGTH],
	MAX(LEN(Zip)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT Zip) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Zip) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY Zip HAVING COUNT(Zip) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(Zip) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Zip) AS [TOTAL DUPLICATES] FROM Doctors GROUP BY Zip HAVING COUNT(Zip) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Doctors;

/***************************************************
-- Table Clinics
****************************************************/
SELECT * FROM Clinics;

SELECT 
	'Clinics' as [TABLE NAME],
	'ClinicID' as [COLUMN NAME],
	COUNT(ClinicID) AS [TOTAL RECORDS],
	(SELECT COUNT(ClinicID) FROM Clinics WHERE ClinicID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ClinicID) FROM Clinics) AS [NULL COUNT],
	MIN(ClinicID) AS [LOW VALUE],
	MAX(ClinicID) AS [HIGH VALUE],
	MIN(LEN(ClinicID)) AS [MINIMUM LENGTH],
	MAX(LEN(ClinicID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ClinicID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ClinicID) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY ClinicID HAVING COUNT(ClinicID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ClinicID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ClinicID) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY ClinicID HAVING COUNT(ClinicID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Clinics;

SELECT 
	'Clinics' as [TABLE NAME],
	'ClinicName' as [COLUMN NAME],
	COUNT(ClinicName) AS [TOTAL RECORDS],
	(SELECT COUNT(ClinicName) FROM Clinics WHERE ClinicName = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ClinicName) FROM Clinics) AS [NULL COUNT],
	MIN(ClinicName) AS [LOW VALUE],
	MAX(ClinicName) AS [HIGH VALUE],
	MIN(LEN(ClinicName)) AS [MINIMUM LENGTH],
	MAX(LEN(ClinicName)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ClinicName) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ClinicName) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY ClinicName HAVING COUNT(ClinicName) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ClinicName) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ClinicName) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY ClinicName HAVING COUNT(ClinicName) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Clinics;

SELECT 
	'Clinics' as [TABLE NAME],
	'Address' as [COLUMN NAME],
	COUNT(Address) AS [TOTAL RECORDS],
	(SELECT COUNT(Address) FROM Clinics WHERE Address = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(Address) FROM Clinics) AS [NULL COUNT],
	MIN(Address) AS [LOW VALUE],
	MAX(Address) AS [HIGH VALUE],
	MIN(LEN(Address)) AS [MINIMUM LENGTH],
	MAX(LEN(Address)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT Address) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Address) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY Address HAVING COUNT(Address) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(Address) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Address) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY Address HAVING COUNT(Address) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Clinics;

SELECT 
	'Clinics' as [TABLE NAME],
	'City' as [COLUMN NAME],
	COUNT(City) AS [TOTAL RECORDS],
	(SELECT COUNT(City) FROM Clinics WHERE City = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(City) FROM Clinics) AS [NULL COUNT],
	MIN(City) AS [LOW VALUE],
	MAX(City) AS [HIGH VALUE],
	MIN(LEN(City)) AS [MINIMUM LENGTH],
	MAX(LEN(City)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT City) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(City) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY City HAVING COUNT(City) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(City) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(City) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY City HAVING COUNT(City) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Clinics;

SELECT 
	'Clinics' as [TABLE NAME],
	'State' as [COLUMN NAME],
	COUNT(State) AS [TOTAL RECORDS],
	(SELECT COUNT(State) FROM Clinics WHERE State = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(State) FROM Clinics) AS [NULL COUNT],
	MIN(State) AS [LOW VALUE],
	MAX(State) AS [HIGH VALUE],
	MIN(LEN(State)) AS [MINIMUM LENGTH],
	MAX(LEN(State)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT State) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(State) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY State HAVING COUNT(State) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(State) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(State) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY State HAVING COUNT(State) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Clinics;

SELECT 
	'Clinics' as [TABLE NAME],
	'Zip' as [COLUMN NAME],
	COUNT(Zip) AS [TOTAL RECORDS],
	(SELECT COUNT(Zip) FROM Clinics WHERE Zip = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(Zip) FROM Clinics) AS [NULL COUNT],
	MIN(Zip) AS [LOW VALUE],
	MAX(Zip) AS [HIGH VALUE],
	MIN(LEN(Zip)) AS [MINIMUM LENGTH],
	MAX(LEN(Zip)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT Zip) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Zip) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY Zip HAVING COUNT(Zip) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(Zip) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(Zip) AS [TOTAL DUPLICATES] FROM Clinics GROUP BY Zip HAVING COUNT(Zip) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Clinics;

/***************************************************
-- Table Shifts
****************************************************/
SELECT * FROM Shifts;

SELECT 
	'Shifts' as [TABLE NAME],
	'ShiftID' as [COLUMN NAME],
	COUNT(ShiftID) AS [TOTAL RECORDS],
	(SELECT COUNT(ShiftID) FROM Shifts WHERE ShiftID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ShiftID) FROM Shifts) AS [NULL COUNT],
	MIN(ShiftID) AS [LOW VALUE],
	MAX(ShiftID) AS [HIGH VALUE],
	MIN(LEN(ShiftID)) AS [MINIMUM LENGTH],
	MAX(LEN(ShiftID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ShiftID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftID) AS [TOTAL DUPLICATES] FROM Shifts GROUP BY ShiftID HAVING COUNT(ShiftID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ShiftID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftID) AS [TOTAL DUPLICATES] FROM Shifts GROUP BY ShiftID HAVING COUNT(ShiftID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Shifts;

SELECT 
	'Shifts' as [TABLE NAME],
	'ShiftStart' as [COLUMN NAME],
	COUNT(ShiftStart) AS [TOTAL RECORDS],
	(SELECT COUNT(ShiftStart) FROM Shifts WHERE ShiftStart = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ShiftStart) FROM Shifts) AS [NULL COUNT],
	MIN(ShiftStart) AS [LOW VALUE],
	MAX(ShiftStart) AS [HIGH VALUE],
	MIN(LEN(ShiftStart)) AS [MINIMUM LENGTH],
	MAX(LEN(ShiftStart)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ShiftStart) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftStart) AS [TOTAL DUPLICATES] FROM Shifts GROUP BY ShiftStart HAVING COUNT(ShiftStart) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ShiftStart) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftStart) AS [TOTAL DUPLICATES] FROM Shifts GROUP BY ShiftStart HAVING COUNT(ShiftStart) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Shifts;

SELECT 
	'Shifts' as [TABLE NAME],
	'ShiftEnd' as [COLUMN NAME],
	COUNT(ShiftEnd) AS [TOTAL RECORDS],
	(SELECT COUNT(ShiftEnd) FROM Shifts WHERE ShiftEnd = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ShiftEnd) FROM Shifts) AS [NULL COUNT],
	MIN(ShiftEnd) AS [LOW VALUE],
	MAX(ShiftEnd) AS [HIGH VALUE],
	MIN(LEN(ShiftEnd)) AS [MINIMUM LENGTH],
	MAX(LEN(ShiftEnd)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ShiftEnd) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftEnd) AS [TOTAL DUPLICATES] FROM Shifts GROUP BY ShiftEnd HAVING COUNT(ShiftEnd) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ShiftEnd) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftEnd) AS [TOTAL DUPLICATES] FROM Shifts GROUP BY ShiftEnd HAVING COUNT(ShiftEnd) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM Shifts;

/***************************************************
-- Table DoctorShifts
****************************************************/
SELECT * FROM DoctorShifts;

SELECT 
	'DoctorShifts' as [TABLE NAME],
	'DoctorsShiftID' as [COLUMN NAME],
	COUNT(DoctorsShiftID) AS [TOTAL RECORDS],
	(SELECT COUNT(DoctorsShiftID) FROM DoctorShifts WHERE DoctorsShiftID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(DoctorsShiftID) FROM DoctorShifts) AS [NULL COUNT],
	MIN(DoctorsShiftID) AS [LOW VALUE],
	MAX(DoctorsShiftID) AS [HIGH VALUE],
	MIN(LEN(DoctorsShiftID)) AS [MINIMUM LENGTH],
	MAX(LEN(DoctorsShiftID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT DoctorsShiftID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(DoctorsShiftID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY DoctorsShiftID HAVING COUNT(DoctorsShiftID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(DoctorsShiftID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(DoctorsShiftID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY DoctorsShiftID HAVING COUNT(DoctorsShiftID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM DoctorShifts;

SELECT 
	'DoctorShifts' as [TABLE NAME],
	'ShiftDate' as [COLUMN NAME],
	COUNT(ShiftDate) AS [TOTAL RECORDS],
	(SELECT COUNT(ShiftDate) FROM DoctorShifts WHERE ShiftDate = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ShiftDate) FROM DoctorShifts) AS [NULL COUNT],
	MIN(ShiftDate) AS [LOW VALUE],
	MAX(ShiftDate) AS [HIGH VALUE],
	MIN(LEN(ShiftDate)) AS [MINIMUM LENGTH],
	MAX(LEN(ShiftDate)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ShiftDate) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftDate) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY ShiftDate HAVING COUNT(ShiftDate) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ShiftDate) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftDate) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY ShiftDate HAVING COUNT(ShiftDate) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM DoctorShifts;

SELECT 
	'DoctorShifts' as [TABLE NAME],
	'ClinicID' as [COLUMN NAME],
	COUNT(ClinicID) AS [TOTAL RECORDS],
	(SELECT COUNT(ClinicID) FROM DoctorShifts WHERE ClinicID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ClinicID) FROM DoctorShifts) AS [NULL COUNT],
	MIN(ClinicID) AS [LOW VALUE],
	MAX(ClinicID) AS [HIGH VALUE],
	MIN(LEN(ClinicID)) AS [MINIMUM LENGTH],
	MAX(LEN(ClinicID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ClinicID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ClinicID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY ClinicID HAVING COUNT(ClinicID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ClinicID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ClinicID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY ClinicID HAVING COUNT(ClinicID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM DoctorShifts;

SELECT 
	'DoctorShifts' as [TABLE NAME],
	'ShiftID' as [COLUMN NAME],
	COUNT(ShiftID) AS [TOTAL RECORDS],
	(SELECT COUNT(ShiftID) FROM DoctorShifts WHERE ShiftID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(ShiftID) FROM DoctorShifts) AS [NULL COUNT],
	MIN(ShiftID) AS [LOW VALUE],
	MAX(ShiftID) AS [HIGH VALUE],
	MIN(LEN(ShiftID)) AS [MINIMUM LENGTH],
	MAX(LEN(ShiftID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT ShiftID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY ShiftID HAVING COUNT(ShiftID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(ShiftID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(ShiftID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY ShiftID HAVING COUNT(ShiftID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM DoctorShifts;

SELECT 
	'DoctorShifts' as [TABLE NAME],
	'DoctorID' as [COLUMN NAME],
	COUNT(DoctorID) AS [TOTAL RECORDS],
	(SELECT COUNT(DoctorID) FROM DoctorShifts WHERE DoctorID = '') AS [BLANK COUNT],
	(SELECT Count(*) - COUNT(DoctorID) FROM DoctorShifts) AS [NULL COUNT],
	MIN(DoctorID) AS [LOW VALUE],
	MAX(DoctorID) AS [HIGH VALUE],
	MIN(LEN(DoctorID)) AS [MINIMUM LENGTH],
	MAX(LEN(DoctorID)) AS [MAXIMUM LENGTH],
	COUNT(DISTINCT DoctorID) AS [NUMBER OF DISTINCT VALUES],
	(SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(DoctorID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY DoctorID HAVING COUNT(DoctorID) > 1)  AS TBL) AS [DUPLICATED VALUES],
	COUNT(DoctorID) - (SELECT SUM(TBL.[TOTAL DUPLICATES]) FROM (SELECT COUNT(DoctorID) AS [TOTAL DUPLICATES] FROM DoctorShifts GROUP BY DoctorID HAVING COUNT(DoctorID) > 1)  AS TBL) AS [UNIQUE VALUES]
FROM DoctorShifts;