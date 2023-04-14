-------- FINAL

CREATE DATABASE Car_Rental_System;

USE Car_Rental_System;

--------------------------------------------------------------------
----------------------------------LEVEL 1 :-------------------------
--------------------------------------------------------------------

----LOCATION----

DROP TABLE IF EXISTS Location;

CREATE TABLE Location(
	LocationID int IDENTITY NOT NULL PRIMARY KEY ,
	Address varchar(255) NOT NULL,
	City varchar(45) NOT NULL,
	State varchar(45) NOT NULL,
	Country varchar(45) NOT NULL,
	ZipCode int NOT NULL
);


----PERSON----

DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
	PersonID int NOT NULL PRIMARY KEY IDENTITY,
	PersonFName varchar(45) NOT NULL,
	PersonLName varchar(45) NOT NULL,
	Gender varchar(45) NOT NULL,
	Email varchar(45) NOT NULL UNIQUE,
	PhoneNumber bigint NOT NULL UNIQUE,
	LocationID int NOT NULL REFERENCES Location(LocationID),
	DOB date NOT NULL,
	CONSTRAINT CK_Person_Age CHECK (dbo.CheckAgeRequirement(PersonID) = 1)
);


---CAR_CATEGORY---

DROP TABLE IF EXISTS Car_Category;

CREATE TABLE Car_Category(
 	CarCategoryID int Identity NOT NULL PRIMARY KEY,
 	CarCategoryType varchar(45) NOT NULL,
 	SeatingCapacity int NOT NULL,
 	CarFixedCost float NOT NULL,
);

---CAR_MAINTENANCE---

DROP TABLE IF EXISTS Car_Maintenance;

CREATE TABLE Car_Maintenance(
	CarMaintenanceID int IDENTITY NOT NULL PRIMARY KEY,
	CarID int NOT NULL REFERENCES Cars(CarID),
	CarServiceType varchar(255) NOT NULL,
	ServiceDueDate date NOT NULL,
);

---DISCOUNT---

DROP TABLE IF EXISTS Discount;

CREATE TABLE Discount(
 	DiscountID int Identity NOT NULL PRIMARY KEY,
 	DiscountName varchar(45) NOT NULL,
 	DiscountValidity date NOT NULL,
 	DiscountPercentage float NOT NULL,
);

----INSURANCE----

DROP TABLE IF EXISTS Insurance;

CREATE TABLE Insurance(
 	InsuranceID int Identity NOT NULL PRIMARY KEY,
 	InsuranceCompany varchar(45) NOT NULL,
 	InsuranceType varchar(45) NOT NULL,
 	InsuranceCost float NOT NULL,
);


----PENALTY---

DROP TABLE IF EXISTS Penalty;

CREATE TABLE Penalty(
	PenaltyID int IDENTITY NOT NULL PRIMARY KEY,
	PenaltyReason varchar(255) NOT NULL,
	PenaltyCost int NOT NULL
);

--------------------------------------------------------------------
----------------------------------LEVEL 2 :-------------------------
--------------------------------------------------------------------

----EMPLOYEE---

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
  EmployeeID int Identity NOT NULL PRIMARY KEY,
  PersonID int NOT NULL REFERENCES Person(PersonID),
  EmployeeDesignation varchar(255) NOT NULL,
  
);

---CUSTOMERS---

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  CustomerID int Identity NOT NULL PRIMARY KEY,
  PersonID int NOT NULL REFERENCES Person(PersonID),
  DrivingLicense varchar(255) NOT NULL,
  
);

----CARS---

DROP TABLE IF EXISTS Cars;

CREATE TABLE Cars(
  CarID int NOT NULL IDENTITY PRIMARY KEY,
  CarBrand varchar(45) NOT NULL,
  CarType varchar(45) NOT NULL,
  CarCategoryID int NOT NULL REFERENCES Car_Category(CarCategoryID),
  CarLicensePlate varchar(45) NOT NULL,
  CarModel varchar(45) NOT NULL,
  CarModelYear int NOT NULL,
);

--------------------------------------------------------------------
----------------------------------LEVEL 3 :-------------------------
--------------------------------------------------------------------


----COMPLAINT---

DROP TABLE IF EXISTS Complaint;

CREATE TABLE Complaint(
	ComplaintID int Identity NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL REFERENCES Customers(CustomerID),
	ComplaintDate date NOT NULL,
	ComplaintType varchar(45) NOT NULL,
	ComplaintDescription varchar(255) NOT NULL,

);

---CAR_RESERVATION---

DROP TABLE IF EXISTS Car_Reservation;

CREATE TABLE Car_Reservation(
  ReservationID int NOT NULL IDENTITY PRIMARY KEY,
  CustomerID int NOT NULL REFERENCES Customers(CustomerID),
  CarID int NOT NULL REFERENCES Cars(CarID),
  InsuranceID int NOT NULL REFERENCES Insurance(InsuranceID),
  DiscountID int NOT NULL REFERENCES Discount(DiscountID),
  PickUpLocation int NOT NULL REFERENCES Location(LocationID),
  DropoffLocation int NOT NULL REFERENCES Location(LocationID),
  PickUpTime datetime NOT NULL,
  DropoffTime datetime NOT NULL,
  ActualDropoffTime datetime NULL,
  );

 
---CUSTOMER_SUPPORT---
 
DROP TABLE IF EXISTS Customer_Support;

CREATE TABLE Customer_Support(
	CustomerSupportID int Identity NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL REFERENCES Customers(CustomerID),
	EmployeeID int NOT NULL REFERENCES Employee(EmployeeID),
	CustomerSupportRequestTimeStamp DATETIME NOT NULL,
);


--------------------------------------------------------------------
----------------------------------LEVEL 4 :-------------------------
--------------------------------------------------------------------

----BILLING---

DROP TABLE IF EXISTS Billing;


CREATE TABLE Billing(
	BillingID int IDENTITY NOT NULL PRIMARY KEY,
	BillingDate date NOT NULL,
	FixedCost float NOT NULL,
	VariableCost float NOT NULL,
	Taxes float NOT NULL,
	TotalCost float NOT NULL,
	ReservationID int NOT NULL REFERENCES Car_Reservation(ReservationID),
);


----CANCELLED_RESERVATION---

DROP TABLE IF EXISTS Cancelled_Reservation;

CREATE TABLE Cancelled_Reservation(
	CancelledReservationID int IDENTITY NOT NULL PRIMARY KEY,
	ReservationID int NOT NULL REFERENCES Car_Reservation(ReservationID),
	Reason varchar(255) NOT NULL,
	CancelByCustomers tinyint NOT NULL,
);

--------------------------------------------------------------------
----------------------------------LEVEL 5 :-------------------------
--------------------------------------------------------------------

---BILLING_PENALTY----

DROP TABLE IF EXISTS Billing_Penalty;

CREATE TABLE Billing_Penalty(
	BillingID int NOT NULL REFERENCES Billing(BillingID),
	PenaltyID int NOT NULL REFERENCES Penalty(PenaltyID),
);



---PAYMENT---

DROP TABLE IF EXISTS Payment;

CREATE TABLE Payment(
	PaymentID int IDENTITY NOT NULL PRIMARY KEY,
	PaymentType varchar(45) NOT NULL,
	TransactionID varchar(255) NOT NULL,
	PaymentAmount float NOT NULL,
	PaymentStatus varchar(45) NOT NULL,
	TransactionTime datetime NOT NULL,
	BillingID int NOT NULL REFERENCES Billing(BillingID),
);


