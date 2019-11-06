-- David Mackenzie 40238376
-- Find the num of Apartments in the Building with ensuites
SELECT Building.BuildingID AS "Building", Apartment.ApartmentNo AS "Apartment No", Apartment.NumBedrooms AS "Bedrooms", Apartment.NumBathrooms AS "Bathrooms"
FROM Building 
LEFT JOIN Apartment ON Apartment.BuildingID = Building.BuildingID 
WHERE Apartment.NumBedrooms = Apartment.NumBathrooms;