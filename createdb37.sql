CREATE TABLE IF NOT EXISTS Person (
PersonID int NOT NULL AUTO_INCREMENT UNIQUE,
FName varchar(20) NOT NULL,
SName varchar(20) NOT NULL,
ContactNumber varchar(13),
DoB date, 
EmergencyContactName varchar(255) NOT NULL,
EmergencyContactNumber varchar(13) NOT NULL,
INDEX Fname_SName (FName, SName)
);

CREATE TABLE IF NOT EXISTS Employee (
EmployeeID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
Salary DOUBLE NOT NULL,
FOREIGN KEY (PersonID) References Person (PersonID),
PRIMARY KEY (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Tenant (
TenantID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
PRIMARY KEY (TenantID),
FOREIGN KEY (PersonID) References Person (PersonID)
);

CREATE TABLE IF NOT EXISTS Bank_Account (
BankAccountID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
AccountNumber int NOT NULL, 
SortCode int NOT NULL,
PRIMARY KEY (BankAccountID),
FOREIGN KEY (PersonID) References Person (PersonID)
);

CREATE TABLE IF NOT EXISTS Manager (
ManagerID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
PRIMARY KEY (ManagerID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Building (
BuildingID int NOT NULL AUTO_INCREMENT UNIQUE,
BuildingNameorNum varchar(25),
Street varchar(255),
PostCode varchar(8),
PRIMARY KEY (BuildingID)
);

CREATE TABLE IF NOT EXISTS Apartment (
ApartmentID int NOT NULL AUTO_INCREMENT UNIQUE,
ApartmentNo INT NOT NULL,
NumBedrooms INT,
NumBathrooms INT,
TotalArea INT,
BuildingID int NOT NULL,
ManagerID int NOT NULL,
PRIMARY KEY (ApartmentID, BuildingID),
FOREIGN KEY (BuildingID) References Building (BuildingID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
INDEX ApartmentNo_BuildingID (ApartmentNo,BuildingID)
);

CREATE TABLE IF NOT EXISTS Lease (
LeaseID int NOT NULL AUTO_INCREMENT UNIQUE,
ApartmentID int NOT NULL,
ManagerID int NOT NULL,
StartDate DATE NOT NULL,
Duration INT NOT NULL,
Rent int NOT NULL,
PRIMARY KEY (LeaseID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
INDEX StartDate_ApartmentID (StartDate,ApartmentID)
);

CREATE TABLE IF NOT EXISTS LeaseTenants (
LeaseID INT NOT NULL,
TenantID INT NOT NULL,
FOREIGN KEY (LeaseID) REFERENCES Lease(LeaseID),
FOREIGN KEY (TenantID) REFERENCES Tenant(TenantID)
);

CREATE TABLE IF NOT EXISTS Office (
OfficeID int NOT NULL AUTO_INCREMENT UNIQUE,
ApartmentID int NOT NULL,
ManagerID int NOT NULL,
PRIMARY KEY (OfficeID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);

CREATE TABLE IF NOT EXISTS Technician (
TechnicianID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
PRIMARY KEY (TechnicianID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Skill(
SkillID INT NOT NULL AUTO_INCREMENT UNIQUE,
SkillName VARCHAR(255),
PRIMARY KEY(SkillID),
INDEX(SkillName)
);

CREATE TABLE IF NOT EXISTS TechnicianSkill(
TechnicianID INT NOT NULL,
SkillID INT NOT NULL,
FOREIGN KEY(TechnicianID) REFERENCES Technician(TechnicianID),
FOREIGN KEY(SkillID) REFERENCES Skill(SkillID)
);
