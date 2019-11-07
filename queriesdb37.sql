--Nathan Donaghy 40226743
SELECT alt.LeaseID, alt.ApartmentNo, CONCAT(Building.BuildingNameorNum, ' ', Building.Street, ' ', Building.PostCode) AS 'Address',(alt.NumBedrooms-alt.NumTenants) AS 'Number of Free Bedrooms' 
FROM (SELECT Apartment.ApartmentNo,Apartment.NumBedrooms,Apartment.BuildingID,lt.LeaseID,lt.NumTenants 
FROM Apartment 
INNER JOIN (SELECT LeaseTenants.LeaseID,LeaseTenants.TenantID, Lease.ApartmentID, COUNT(*) AS 'NumTenants' 
FROM LeaseTenants 
INNER JOIN Lease ON LeaseTenants.LeaseID = Lease.LeaseID WHERE (SUBDATE(CURRENT_DATE, INTERVAL Lease.Duration MONTH) < Lease.StartDate) GROUP BY LeaseTenants.LeaseID)lt ON lt.ApartmentID = Apartment.ApartmentID)alt 
INNER JOIN Building ON alt.BuildingID = Building.BuildingID WHERE (alt.NumBedrooms - alt.NumTenants >0)

-- David Mackenzie 40238376
-- Find the num of Apartments in the Building with ensuites
SELECT Building.BuildingID AS "Building", Apartment.ApartmentNo AS "Apartment No", Apartment.NumBedrooms AS "Bedrooms", Apartment.NumBathrooms AS "Bathrooms"
FROM Building 
LEFT JOIN Apartment ON Apartment.BuildingID = Building.BuildingID 
WHERE Apartment.NumBedrooms = Apartment.NumBathrooms;

-- Daniel White 40233631
-- Finds the 3 managers with the lease leases managed
SELECT Person.PersonID, Person.FName AS 'First Name', Person.SName AS 'Surname', COUNT(Lease.ManagerID) AS 'Leases Managed' FROM Person
INNER JOIN Employee on Person.PersonID = Employee.PersonID
INNER JOIN Manager on Employee.EmployeeID = Manager.EmployeeID
INNER JOIN Lease on Manager.ManagerID = Lease.ManagerID
GROUP BY Person.PersonID
ORDER BY COUNT(Lease.ManagerID) ASC
LIMIT 3;

--Peter Sleith 40237264
--Displays all managers and the number of active leases they manage
SELECT Manager.ManagerID, CONCAT(Person.FName, ' ', Person.SName)AS 'Manager Name', COUNT(*)AS 'Num of Leases'
FROM Manager
LEFT JOIN (SELECT Lease.LeaseID,Lease.ManagerID 
FROM Lease 
WHERE (SUBDATE(CURRENT_DATE, INTERVAL Lease.Duration MONTH) < Lease.StartDate))current ON current.ManagerID = Manager.managerID
INNER JOIN Employee ON Manager.EmployeeID = Employee.EmployeeID
INNER JOIN Person ON Employee.PersonID = Person.PersonID
GROUP BY Manager.ManagerID;
