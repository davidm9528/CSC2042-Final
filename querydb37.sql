--Nathan 40226743
SELECT alt.LeaseID, alt.ApartmentNo, CONCAT(Building.BuildingNameorNum, ' ', Building.Street, ' ', Building.PostCode) AS 'ADDRESS',(alt.NumBedrooms-alt.NumTenants) AS 'NumFreeBedrooms' 
FROM (SELECT Apartment.ApartmentNo,Apartment.NumBedrooms,Apartment.BuildingID,lt.LeaseID,lt.NumTenants 
FROM Apartment 
INNER JOIN (SELECT LeaseTenants.LeaseID,LeaseTenants.TenantID, Lease.ApartmentID, COUNT(*) AS 'NumTenants' 
FROM LeaseTenants 
INNER JOIN Lease ON LeaseTenants.LeaseID = Lease.LeaseID WHERE (SUBDATE(CURRENT_DATE, INTERVAL Lease.Duration MONTH) < Lease.StartDate) GROUP BY LeaseTenants.LeaseID)lt ON lt.ApartmentID = Apartment.ApartmentID)alt 
INNER JOIN Building ON alt.BuildingID = Building.BuildingID WHERE (alt.NumBedrooms - alt.NumTenants >0);
