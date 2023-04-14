---- Final


-------------------------------------------------VIEWS-------------------------------------------------------------

Use Car_Rental_System;


--------------------------------------------------------------------------------------------------------------
---Count of customer support requests for each employee (View 1)

--------------------------------------------------------------------------------------------------------------

CREATE VIEW Employee_Customer_Support_Count AS
SELECT e.EmployeeID, e.PersonID, e.EmployeeDesignation, COUNT(*) AS CustomerSupportCount
FROM Employee e
JOIN Customer_Support cs ON e.EmployeeID = cs.EmployeeID
GROUP BY e.EmployeeID, e.PersonID, e.EmployeeDesignation;

select * from Employee_Customer_Support_Count;



--------------------------------------------------------------------------------------------------------------
--Car rental statistics (View 2)

--------------------------------------------------------------------------------------------------------------
CREATE VIEW Car_Rental_Stats AS
SELECT
cc.CarCategoryType,
COUNT(c.CarID) AS TotalCars,
SUM(br.TotalCost) AS TotalRevenue,
AVG(br.TotalCost) AS AvgRentalPrice,
COUNT(DISTINCT cr.CustomerID) AS UniqueCustomers,
COUNT(CASE WHEN cr2.CancelByCustomers = 1 THEN 1 ELSE NULL END) AS CancelledReservations
FROM
Car_Category cc
JOIN Cars c ON cc.CarCategoryID = c.CarCategoryID
JOIN Car_Reservation cr ON c.CarID = cr.CarID
JOIN Billing br ON cr.ReservationID = br.ReservationID
JOIN Customers cust ON cr.CustomerID = cust.CustomerID
LEFT JOIN Cancelled_Reservation cr2 ON cr.ReservationID = cr2.ReservationID
GROUP BY
cc.CarCategoryType;

SELECT * from Car_Rental_Stats;


--------------------------------------------------------------------------------------------------------------
--- To display all the car categories along with their associated Car and Car_Reservation details (View 3)

-------------------------------------------------------------------------------------------------------------

CREATE VIEW Car_Category_Details AS
SELECT cc.CarCategoryID, cc.CarCategoryType, cc.SeatingCapacity, cc.CarFixedCost, 
       c.CarID, c.CarBrand, c.CarType, c.CarLicensePlate, c.CarModel, c.CarModelYear,
       cr.ReservationID, cr.CustomerID
FROM Car_Category cc
INNER JOIN Cars c ON cc.CarCategoryID = c.CarCategoryID
INNER JOIN Car_Reservation cr ON c.CarID = cr.CarID;



select * from Car_Category_Details;




--------------------------------------------------------------------------------------------------------------
-- Consolidated view presenting the entire car reservation details of all the reservations (View 4)

--------------------------------------------------------------------------------------------------------------

CREATE VIEW Car_Reservation_Details AS
SELECT CR.ReservationID, Ca.CarID,C.CustomerID, C.DrivingLicense, 
    PUL.Address AS PickupAddress, PUL.City AS PickupCity, PUL.State AS PickupState, PUL.Country AS PickupCountry, PUL.ZipCode AS PickupZipCode,
    DOL.Address AS DropoffAddress, DOL.City AS DropoffCity, DOL.State AS DropoffState, DOL.Country AS DropoffCountry, DOL.ZipCode AS DropoffZipCode,
    CR.PickUpTime, CR.DropoffTime, CR.ActualDropoffTime,
    B.FixedCost, B.VariableCost, B.Taxes, B.TotalCost, B.BillingDate, 
    P.PaymentID, P.PaymentType, P.TransactionID, P.PaymentAmount, P.PaymentStatus, P.TransactionTime
FROM Car_Reservation CR
INNER JOIN Customers C ON CR.CustomerID = C.CustomerID
INNER JOIN Cars Ca ON CR.CarID = Ca.CarID
INNER JOIN Location PUL ON CR.PickUpLocation = PUL.LocationID
INNER JOIN Location DOL ON CR.DropoffLocation = DOL.LocationID
INNER JOIN Billing B ON CR.ReservationID = B.ReservationID
INNER JOIN Payment P ON B.BillingID = P.BillingID;




select * from Car_Reservation_Details;





--------------------------------------------------------------------------------------------------------------
--- A view to display all the complaints along with their associated Customer and Car_Reservation details (View 5)  

--------------------------------------------------------------------------------------------------------------

CREATE VIEW ComplaintDetails AS
SELECT c.ComplaintID,Ca.CarID,cu.CustomerID, cu.PersonID, c.ComplaintDate, c.ComplaintType, c.ComplaintDescription, 
        cu.DrivingLicense,cr.ReservationID, cr.PickUpTime, cr.DropoffTime, cr.ActualDropoffTime
FROM Complaint c
INNER JOIN Customers cu ON c.CustomerID = cu.CustomerID
INNER JOIN Car_Reservation cr ON cu.CustomerID = cr.CustomerID
INNER JOIN Cars ca ON cr.CarID = ca.CarID;


SELECT * from ComplaintDetails;




