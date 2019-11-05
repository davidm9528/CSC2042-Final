--Inserting a manager--
INSERT INTO `Employee`(`PersonID`,`Salary`)
VALUES(11,1500);

INSERT INTO `Manager`(`EmployeeID`)
VALUES(1);

--creating building and apartment
INSERT INTO `Building`(`BuildingNameorNum`,`Street`,`PostCode`)
VALUES('72','Malone Avenue', 'BT9 6ER');

INSERT INTO `Apartment`(`ApartmentNo`,`NumBedrooms`,`NumBathrooms`,`TotalArea`,`BuildingID`,`ManagerID`)
VALUES(2,4,2,300,1,1);

INSERT INTO `Apartment`(`ApartmentNo`,`NumBedrooms`,`NumBathrooms`,`TotalArea`,`BuildingID`,`ManagerID`)
VALUES(1,1,1,200,1,1);

INSERT INTO `Office`(`ApartmentID`,`ManagerID`)
VALUES(2,1);

INSERT INTO `Building`(`BuildingNameorNum`,`Street`,`PostCode`)
VALUES('10','Malone Road', 'BT7 1NP');

INSERT INTO `Apartment`(`ApartmentNo`,`NumBedrooms`,`NumBathrooms`,`TotalArea`,`BuildingID`,`ManagerID`)
VALUES(1,1,1,225,2,1);

--Inserting a tenant--

INSERT INTO `Tenant`(`PersonID`)
VALUES(1);

INSERT INTO `Tenant`(`PersonID`)
VALUES(2);

INSERT INTO `Tenant`(`PersonID`)
VALUES(3);

INSERT INTO `Lease`(`ApartmentID`,`ManagerID`,`StartDate`,`Duration`,`Rent`)
VALUES(1,1,'2019-01-01',24,1000);

INSERT INTO `LeaseTenants`(`LeaseID`,`TenantID`)
VALUES(1,1);

INSERT INTO `LeaseTenants`(`LeaseID`,`TenantID`)
VALUES(1,2);

INSERT INTO `LeaseTenants`(`LeaseID`,`TenantID`)
VALUES(1,3);

INSERT INTO `Tenant`(`PersonID`)
VALUES(4);

INSERT INTO `Lease`(`ApartmentID`,`ManagerID`,`StartDate`,`Duration`,`Rent`)
VALUES(2,1,'2019-04-01',12,400);

INSERT INTO `LeaseTenants`(`LeaseID`,`TenantID`)
VALUES(2,4);

INSERT INTO `Tenant`(`PersonID`)
VALUES(5);

INSERT INTO `Lease`(`ApartmentID`,`ManagerID`,`StartDate`,`Duration`,`Rent`)
VALUES(3,1,'2019-01-01',9,400);

INSERT INTO `LeaseTenants`(`LeaseID`,`TenantID`)
VALUES(3,5);