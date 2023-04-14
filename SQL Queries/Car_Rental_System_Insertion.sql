----- FINAL


USE Car_Rental_System;

--------------------------------------------------------------------
----------------------------------LEVEL 1 :-------------------------
--------------------------------------------------------------------



-------------------------------------------------------------------
---- Insert Location
-------------------------------------------------------------------


INSERT INTO Location (Address, City, State, Country, ZipCode)
VALUES
('2323 Main St', 'Dallas', 'TX', 'USA', 75201),
('4545 Oak Ave', 'San Diego', 'CA', 'USA', 92101),
('6767 Pine Rd', 'Philadelphia', 'PA', 'USA', 19102),
('8989 Maple Blvd', 'Phoenix', 'AZ', 'USA', 85004),
('111 Pine St', 'Portland', 'OR', 'USA', 97204),
('222 Elm St', 'Denver', 'CO', 'USA', 80202),
('333 Oak St', 'New Orleans', 'LA', 'USA', 70112),
('444 Pine Ave', 'Nashville', 'TN', 'USA', 37203),
('555 Maple St', 'Kansas City', 'MO', 'USA', 64106),
('666 Oak Rd', 'Las Vegas', 'NV', 'USA', 89109),
('777 Pine Blvd', 'Minneapolis', 'MN', 'USA', 55401),
('888 Maple St', 'Detroit', 'MI', 'USA', 48226),
('999 Oak St', 'Salt Lake City', 'UT', 'USA', 84101),
('1212 Pine Ave', 'San Antonio', 'TX', 'USA', 78205),
('1414 Maple St', 'Charlotte', 'NC', 'USA', 28202),
('1616 Oak Rd', 'Indianapolis', 'IN', 'USA', 46204),
('1818 Pine Blvd', 'Cincinnati', 'OH', 'USA', 45202),
('2020 Maple St', 'Raleigh', 'NC', 'USA', 27601),
('2222 Oak St', 'Tampa', 'FL', 'USA', 33602);


-------------------------------------------------------------------
----- Insert query for Person
-------------------------------------------------------------------

INSERT INTO Person (PersonFName, PersonLName, Gender, Email, PhoneNumber, LocationID, DOB)
VALUES
('(Ethan', 'Jones', 'Male', 'ethan.jones@drivenow.com', 1324567890, 1, '1995-04-03'),
('Sophia', 'Smith', 'Female', 'sophia.smith@gmail.com', 2345678901, 2, '1994-06-15'),
('Jackson', 'Taylor', 'Male', 'jackson.taylor@hotmail.com', 3456789012, 3, '1993-07-11'),
('Mia', 'Brown', 'Female', 'mia.brown@outlook.com', 4567890123, 4, '1997-09-02'),
('Aiden', 'Garcia', 'Male', 'aiden.garcia@gmail.com', 5678901234, 5, '1998-11-23'),
('Chloe', 'Lee', 'Female', 'chloe.lee@yahoo.com', 6789012345, 6, '2000-02-14'),
('Caleb', 'Wilson', 'Male', 'caleb.wilson@outlook.com', 7890123456, 7, '2001-03-10'),
('Avery', 'Miller', 'Female', 'avery.miller@gmail.com', 8901234567, 8, '2002-05-18'),
('Evelyn', 'Davis', 'Female', 'evelyn.davis@outlook.com', 9012345678, 9, '2003-06-22'),
('William', 'Clark', 'Male', 'william.clark@yahoo.com', 1011121314, 10, '2004-08-12'),
('Oliver', 'Johnson', 'Male', 'oliver.johnson@drivenow.com', 1213141516, 11, '2005-10-27'),
('Isabella', 'Anderson', 'Female', 'isabella.anderson@gmail.com', 1314151617, 12, '2006-12-31'),
('Noah', 'Martin', 'Male', 'noah.martin@outlook.com', 1415161718, 13, '1998-07-11'),
('Emma', 'Taylor', 'Female', 'emma.taylor@yahoo.com', 1516171819, 14, '1999-09-02'),
('Liam', 'White', 'Male', 'liam.white@drivenow.com', 1617181920, 15, '2000-11-09'),
('Aria', 'Jackson', 'Female', 'aria.jackson@gmail.com', 1718192021, 16, '2002-02-14'),
('Ethan', 'Lee', 'Male', 'ethan.lee@outlook.com', 1819202122, 17, '2003-04-05'),
('Zoe', 'Scott', 'Female', 'zoe.scott@yahoo.com', 1920212223, 18, '2004-06-15'),
('Jacob', 'Garcia', 'Male', 'jacob.garcia@drivenow.com', 2021222324, 19, '2005-08-25');

INSERT INTO Person (PersonFName, PersonLName, Gender, Email, PhoneNumber, LocationID, DOB)
VALUES
('Pavan', 'Shekhar', 'Male', 'pavan.shekhar@drivenow.com', 6171231234, 9, '1997-08-25'),
('Dhruv', 'Patel', 'Male', 'dhruv.patel@drivenow.com', 6171231235, 9, '1999-02-28'),
('Daksh', 'Patel', 'Male', 'daksh.patel@drivenow.com', 6171231236, 9, '1999-03-25'),
('Sreyansi', 'Patel', 'Female', 'sreya.patel@drivenow.com', 6171231237, 9, '1998-05-02'),
('Vidhi', 'Sejpal', 'Female', 'vidhi.sejpal@drivenow.com', 6171231238, 9, '2000-08-20');

INSERT INTO Person (PersonFName, PersonLName, Gender, Email, PhoneNumber, LocationID, DOB)
VALUES
('John', 'Doe', 'Male', 'john.doe@drivenow.com', 6171231239, 15, '1990-08-25');


-------------------------------------------------------------------
-- Insert data into the Car_Category
-------------------------------------------------------------------
INSERT INTO Car_Category (CarCategoryType, SeatingCapacity, CarFixedCost)
VALUES
	('Sedan', 5, 20.00),
	('SUV', 7, 35.00),
	('Hatchback', 4, 15.00),
	('Coupe', 2, 25.00),
	('Minivan', 8, 40.00),
	('Convertible', 2, 30.00),
	('Pickup Truck', 3, 28.00),
	('Crossover', 5, 32.00),
	('Sports Car', 2, 50.00),
	('Luxury Car', 4, 60.00);



-------------------------------------------------------------------
-- Insert data into the Car_Maintenance
-------------------------------------------------------------------
INSERT INTO Car_Maintenance (CarID, CarServiceType, ServiceDueDate)
VALUES 
	(4, 'Oil Change', '2023-10-03'),
	(5, 'Tire Rotation', '2023-04-03'),
	(7, 'Oil Change', '2023-08-03'),
	(10, 'Brake Service', '2025-04-03'),
	(6, 'Tire Rotation', '2023-07-03'),
	(9, 'Oil Change', '2023-09-03'),
	(1, 'Brake Service', '2024-10-03'),
	(8, 'Tire Rotation', '2023-10-03'),
	(3, 'Oil Change', '2024-07-03'),
	(9, 'Transmission Service', '2026-04-03');



-------------------------------------------------------------------
-- Insert query for Discount table
-------------------------------------------------------------------

INSERT INTO Discount (DiscountName, DiscountValidity, DiscountPercentage)
VALUES 
('Summer Sale', '2023-06-30 18:00:00', 15.00),
('Back to School', '2023-08-31 23:59:59', 10.00),
('Early Bird Special', '2023-09-15 09:00:00', 20.00),
('Fall Clearance', '2023-11-15 20:30:00', 25.00),
('Winter Wonderland', '2023-12-15 22:00:00', 10.00),
('New Year, New You', '2024-01-31 21:00:00', 15.00),
('Spring Fling', '2024-04-15 15:30:00', 10.00),
('Memorial Day Weekend', '2024-05-27 23:00:00', 20.00),
('Independence Day', '2024-07-04 18:45:00', 15.00),
('Labor Day Sale', '2024-09-02 16:00:00', 10.00),
('Oktoberfest', '2024-10-05 22:30:00', 25.00),
('Black Friday', '2024-11-29 23:59:59', 30.00),
('Cyber Monday', '2024-12-02 23:59:59', 35.00),
('Valentine''s Day', '2025-02-14 20:15:00', 15.00),
('St. Patrick''s Day', '2025-03-17 12:00:00', 10.00);



-------------------------------------------------------------------
-- Insert query for Insurance Data
-------------------------------------------------------------------

INSERT INTO Insurance (InsuranceCompany, InsuranceType, InsuranceCost)
VALUES 
('Allianz', 'Comprehensive', 100.00),
('AIG', 'Collision', 150.50),
('GEICO', 'Liability Only', 75.75),
('State Farm', 'Comprehensive', 125.00),
('Progressive', 'Personal Injury', 90.25),
('Allstate', 'Comprehensive', 120.00),
('Nationwide', 'Comprehensive', 180.50),
('Farmers', 'Comprehensive', 135.25),
('Liberty Mutual', 'Collision', 110.00),
('Esurance', 'Personal Injury', 100.00),
('Travelers', 'Comprehensive', 140.00),
('USAA', 'Liability Only', 65.50),
('Hartford', 'Comprehensive', 155.00),
('MetLife', 'Personal Injury', 95.75),
('Mercury', 'Comprehensive', 110.50);



-------------------------------------------------------------------
-- Insert for Penalty Data
-------------------------------------------------------------------
INSERT INTO Penalty (PenaltyReason, PenaltyCost) VALUES
('Late payment', 100),
('Damaged property', 500),
('Noise violation', 200),
('Smoking in non-smoking area', 300),
('Parking violation', 150),
('Excessive trash', 75),
('Unauthorized pet', 250),
('Late dropoff penalty per hour', 50),
('Damaged interior', 25),
('Graffiti', 400);

INSERT INTO Penalty (PenaltyReason, PenaltyCost) 
VALUES ('Broken windshield', 100), 
       ('Scratched paint', 75), 
       ('Missing license plate', 50), 
       ('Flat tire', 80), 
       ('Damaged headlight', 90), 
       ('Broken side mirror', 60), 
       ('Dented door', 110), 
       ('Broken taillight', 85), 
       ('Damaged bumper', 120), 
       ('Broken rearview mirror', 70), 
       ('Cracked windshield', 95), 
       ('Missing side mirror', 55), 
       ('Broken headlight', 100), 
       ('Dented hood', 125), 
       ('Scratched windshield', 80);
      
      
      
      
 --------------------------------------------------------------------
----------------------------------LEVEL 2 :-------------------------
--------------------------------------------------------------------
      
      
-------------------------------------------------------------------
--Insert for Employee
-------------------------------------------------------------------
INSERT INTO Employee (PersonID, EmployeeDesignation)
VALUES (1, 'Employee'),
       (11, 'Manager'),
       (15, 'Manager'),
       (19, 'Employee');

INSERT INTO Employee (PersonID, EmployeeDesignation)
VALUES 
(22, 'CTO'),
(25, 'CEO'),
(26, 'Marketing Lead'),
(27, 'Priciple Engineer'),
(28, 'HR'),
(29, 'Employee');


-------------------------------------------------------------------
--Insert for Customers
-------------------------------------------------------------------
INSERT INTO Customers (PersonID, DrivingLicense)
VALUES 
(1, 'XYZ123'),
(2, 'ABC456'),
(3, 'DEF789'),
(4, 'GHI012'),
(6, 'JKL345'),
(7, 'MNO678'),
(8, 'PQR901'),
(9, 'STU234'),
(10, 'VWX567'),
(12, 'YZA890'),
(13, 'DEF012'),
(14, 'GHI345'),
(16, 'JKL678'),
(17, 'MNO901'),
(18, 'PQR234');


-------------------------------------------------------------------
-- Insert data into the Cars 
-------------------------------------------------------------------
INSERT INTO Cars (CarBrand, CarType, CarCategoryID, CarLicensePlate, CarModel, CarModelYear)
VALUES
	('Toyota', 'Camry', 1, 'ABC-123', 'LE', 2022),
	('Honda', 'Pilot', 2, 'DEF-456', 'EX-L', 2021),
	('Volkswagen', 'Golf', 3, 'GHI-789', 'GTI', 2022),
	('Chevrolet', 'Corvette', 4, 'JKL-012', 'Stingray', 2021),
	('Chrysler', 'Pacifica', 5, 'MNO-345', 'Touring', 2022),
	('BMW', '4 Series', 6, 'PQR-678', '430i', 2021),
	('Ford', 'F-150',7, 'STU-901', 'Lariat', 2022),
	('Mercedes-Benz', 'GLC', 8, 'VWX-234', '300', 2022),
	('Porsche', '911', 9, 'YZA-567', 'Carrera', 2021),
	('Audi', 'A8', 10, 'BCD-890', 'L', 2022);



--------------------------------------------------------------------
----------------------------------LEVEL 3 :-------------------------
--------------------------------------------------------------------


-------------------------------------------------------------------
----- Insert Complaint
-------------------------------------------------------------------

INSERT INTO Complaint (CustomerID, ComplaintDate, ComplaintType, ComplaintDescription) VALUES
(3, '2022-02-01', 'Service', 'Rude customer service representative'),
(1, '2021-09-12', 'Product', 'Defective laptop'),
(4, '2022-03-05', 'Service', 'Long wait time on the phone'),
(5, '2022-01-20', 'Product', 'Missing parts in package'),
(8, '2022-02-15', 'Service', 'Billing error'),
(6, '2021-12-25', 'Product', 'Wrong item shipped'),
(2, '2022-03-01', 'Service', 'Incorrect account information'),
(9, '2022-04-02', 'Product', 'Damaged product'),
(7, '2022-02-10', 'Service', 'Internet outage'),
(1, '2021-11-08', 'Product', 'Wrong color product'),
(5, '2022-01-25', 'Service', 'Poor customer service'),
(2, '2022-03-05', 'Product', 'Product not as advertised'),
(6, '2021-12-18', 'Service', 'Difficulty reaching customer support'),
(3, '2022-02-07', 'Product', 'Product arrived late'),
(8, '2022-02-28', 'Service', 'Unauthorized charges on bill'),
(4, '2022-03-10', 'Product', 'Wrong size product'),
(10, '2022-04-01', 'Service', 'No response from customer support'),
(9, '2022-04-03', 'Product', 'Product did not work'),
(7, '2022-02-12', 'Service', 'Difficulty setting up account'),
(1, '2021-10-15', 'Product', 'Product not compatible with device'),
(2, '2022-03-03', 'Service', 'Inaccurate billing'),
(6, '2021-12-21', 'Product', 'Product missing accessories'),
(5, '2022-01-27', 'Service', 'Technical support not helpful'),
(3, '2022-02-11', 'Product', 'Product damaged during shipping'),
(8, '2022-02-25', 'Service', 'Difficulty canceling service'),
(4, '2022-03-12', 'Product', 'Product not functional'),
(10, '2022-04-02', 'Service', 'Unauthorized account access'),
(7, '2022-02-08', 'Product', 'Product not as described'),
(9, '2022-04-05', 'Service', 'Billing dispute');



-------------------------------------------------------------------
------ Insert for Car_Reservation
-------------------------------------------------------------------

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (2, 2, 3, 5, 22, 23, '2023-04-03 5:30:00', '2023-04-04 10:30:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (3, 5, 4, 0, 22, 23, '2023-04-03 4:30:00', '2023-04-04 10:30:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (1, 1, 1, 1, 27, 21, '2023-05-01 23:00:00', '2023-05-01 1:00:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (1, 1, 1, 1, 27, 21, '2023-07-29 20:00:00', '2023-08-01 1:00:00');
)

UPDATE Car_Reservation SET ActualDropoffTime = '2023-08-01 1:30:00'
WHERE ReservationID = 12;

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (5, 4, 2, 0, 22, 22, '2023-07-29 20:00:00', '2023-07-29 19:00:00');
)

UPDATE Car_Reservation SET ActualDropoffTime = '2023-08-01 1:30:00'
WHERE ReservationID = 12;

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (7, 7, 6, 3, 26, 26, '2023-12-30 3:00:00', '2023-12-31 20:00:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (7, 7, 8, 0, 26, 23, '2023-05-14 2:00:00', '2023-05-15 1:30:00');
)

UPDATE Car_Reservation SET ActualDropoffTime = '2023-05-15 3:30:00'
WHERE ReservationID = 21;

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (10, 7, 8, 0, 26, 23, '2023-05-14 2:00:00', '2023-05-15 1:30:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (6, 3, 8, 7, 22, 28, '2023-08-14 6:00:00', '2023-08-16 1:30:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (8, 6, 2, 0, 22, 22, '2023-07-29 10:00:00', '2023-08-20 23:00:00');
)


INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (7, 9, 4, 8, 27, 21, '2023-08-07 11:15:00', '2023-08-8 23:15:00');
)

INSERT
INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickupLocation, DropoffLocation, PickupTime, DropoffTime)      
VALUES (5, 10, 8, 4, 23, 23, '2023-04-06 01:05:00', '2023-04-7 23:59:00');
)

INSERT INTO Car_Reservation (CustomerID, CarID, InsuranceID, DiscountID, PickUpLocation, DropoffLocation, PickUpTime, DropoffTime)
VALUES 
(4, 2, 6, 0, 21, 28, '2021-11-01 15:00:00.000', '2021-11-02 15:00:00.000'),
(4, 2, 3, 0, 25, 28, '2020-06-10 09:00:00.000', '2020-06-12 15:00:00.000'),
(9, 8, 7, 2, 27, 21, '2020-10-10 08:00:00.000', '2020-10-12 12:00:00.000'),
(2, 3, 1, 6, 23, 24, '2020-09-01 12:00:00.000', '2020-09-02 12:00:00.000'),
(1, 1, 2, 0, 21, 25, '2020-05-30 09:00:00.000', '2020-05-31 09:00:00.000'),
(3, 5, 4, 3, 22, 24, '2020-08-05 14:00:00.000', '2020-08-07 14:00:00.000'),
(6, 6, 6, 0, 28, 28, '2021-11-20 10:00:00.000', '2021-11-22 10:00:00.000'),
(7, 7, 8, 1, 23, 26, '2021-07-12 18:00:00.000', '2021-07-13 18:00:00.000'),
(8, 9, 1, 0, 22, 21, '2021-06-05 08:00:00.000', '2021-06-06 08:00:00.000'),
(5, 10, 3, 7, 22, 27, '2021-10-05 09:00:00.000', '2021-10-06 09:00:00.000')


-------------------------------------------------------------------
-- Insert data into the Customer_Support 
-------------------------------------------------------------------
INSERT INTO Customer_Support(CustomerID, EmployeeID, CustomerSupportRequestTimeStamp)
VALUES
    (1, 3, '2023-04-03 10:00:00'),
    (2, 1, '2023-04-03 10:15:00'),
    (3, 2, '2023-04-03 10:30:00'),
    (4, 3, '2023-04-03 10:45:00'),
    (5, 1, '2023-04-03 11:00:00'),
    (6, 2, '2023-04-03 11:15:00'),
    (7, 3, '2023-04-03 11:30:00'),
    (8, 4, '2023-04-03 11:45:00'),
    (9, 1, '2023-04-03 12:00:00'),
    (10, 2, '2023-04-03 12:15:00'),
    (11, 3, '2023-04-03 12:30:00'),
    (12, 4, '2023-04-03 12:45:00'),
    (13, 1, '2023-04-03 13:00:00'),
    (14, 2, '2023-04-03 13:15:00'),
    (15, 3, '2023-04-03 13:30:00');
   
   
   
--------------------------------------------------------------------
----------------------------------LEVEL 4 :-------------------------
--------------------------------------------------------------------

-------------------------------------------------------------------
------ Insert for Cancelled_Reservation
-------------------------------------------------------------------


INSERT INTO Cancelled_Reservation Values
(69, 'Change of plans', 1),
(79, 'Budget constraints', 1),
(80, 'Unavailability of preferred car model', 1),
(81, 'Booking error', 0),
(82, 'Change in travel companions', 1),
(83, 'Found a better deal', 1),
(89, 'Personal reasons', 1),
(90, 'Weather conditions', 1),
(91, 'Payment issues', 0),
(92, 'Server Error', 0),
(93, 'Booking error', 0)



--------------------------------------------------------------------
----------------------------------LEVEL 5 :-------------------------
--------------------------------------------------------------------


-------------------------------------------------------------------
--Insert for Billing_Penalty
-------------------------------------------------------------------

INSERT INTO Billing_Penalty (BillingID, PenaltyID) VALUES
(15,7), 
(15,13), 
(15,12), 
(15,5), 
(15,9), 
(15,22)

INSERT INTO Billing_Penalty (BillingID, PenaltyID) VALUES
(18,24)

INSERT INTO Billing_Penalty (BillingID, PenaltyID) VALUES
(20,19), 
(20,18)


INSERT INTO Billing_Penalty (BillingID, PenaltyID) VALUES
(21,08)

INSERT INTO Billing_Penalty (BillingID, PenaltyID) VALUES
(22,08)


INSERT INTO Billing_Penalty Values (4, 8);



-------------------------------------------------------------------
------ Insert for Payment
-------------------------------------------------------------------

INSERT INTO Payment (PaymentType, TransactionID, PaymentAmount, PaymentStatus, TransactionTime, BillingID)
VALUES 
('Credit Card', '12345', 259.325, 'Processed', '2023-04-05 14:30:00', 1),
('PayPal', '23456', 250, 'Processed', '2023-04-05 14:35:00', 4),
('Debit Card', '34567', 128, 'Pending', '2023-04-04 15:00:00', 4),
('Credit Card', '12341', 128, 'Processed', '2023-04-04 15:05:00', 4),
('Google Pay', '45678', 168, 'Processed', '2023-04-05 15:05:00', 7)

INSERT INTO Payment (PaymentType, TransactionID, PaymentAmount, PaymentStatus, TransactionTime, BillingID)
VALUES 
('Venmo', 56789, 840.6, 'Pending', '2023-08-20 23:00:02', 12),
('Credit Card', 67890, 753.00, 'Processed', '2023-12-31 20:00:30', 15),
('PayPal', 78901, 315.9, 'Processed', '2023-05-14 2:10:00', 16),
('Debit Card', 89012, 350, 'Pending', '2023-08-16 1:34:34', 18),
('Google Pay', 90123, 1218.6, 'Processed', '2023-08-23 00:02:12', 20),
('Venmo', 12340, 1182.9875, 'Failed', '2023-04-10 20:36:47', 22),
('Venmo', 12340, 325, 'Failed', '2023-08-08 23:15:16', 21),
('Venmo', 12340, 325, 'Processed', '2023-08-08 23:16:27', 21);
)


