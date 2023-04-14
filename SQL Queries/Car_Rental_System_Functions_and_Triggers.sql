----Final


--------------------------------------------------------------------------------------------------
--Function to check the age
--------------------------------------------------------------------------------------------------
CREATE FUNCTION CheckAgeRequirement (@personID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @age INT
    
    SELECT @age = DATEDIFF(YEAR, Person.DOB, GETDATE())
    FROM Person
    WHERE PersonID = @personID
    
    IF @age < 18
        RETURN 0
    
    RETURN 1
END


--------------------------------------------------------------------------------------------------
--Function to check the drop off time
--------------------------------------------------------------------------------------------------
CREATE FUNCTION fn_CheckDropOffTime
(
    @PickupTime datetime,
    @DropoffTime datetime
)
RETURNS int
AS
BEGIN
    DECLARE @Result int

    IF (@PickupTime > @DropoffTime)
        SET @Result = 1
    ELSE
        SET @Result = 0

    RETURN @Result
END;



--------------------------------------------------------------------------------------------------
-- Function to calculate penalty amount for a given reservation ID
--------------------------------------------------------------------------------------------------
CREATE FUNCTION CalculatePenaltyAmount(@ReservationID int)
RETURNS FLOAT
AS
BEGIN
	DECLARE @TotalPenalty FLOAT
	DECLARE @LateDropoffPenaltyPerHour FLOAT

	-- Get the late dropoff penalty per hour amount from the Penalty table
	SELECT @LateDropoffPenaltyPerHour = PenaltyCost 
	FROM Penalty
	WHERE PenaltyID  = 8

	-- Calculate the total penalty for the reservation
	SELECT @TotalPenalty = ISNULL(SUM(P.PenaltyCost), 0)
	FROM Billing_Penalty BP
	INNER JOIN Penalty P ON BP.PenaltyID = P.PenaltyID
	WHERE BP.BillingID IN (
		SELECT BillingID
		FROM Billing
		WHERE ReservationID = @ReservationID
	) AND BP.PenaltyID IN 
	( SELECT PenaltyID FROM Penalty WHERE PenaltyID <> 8)

	-- Calculate the penalty cost for "Late dropoff penalty per hour" penalty type
	DECLARE @LateDropoffTimeDiff INT
	SELECT @LateDropoffTimeDiff = DATEDIFF(HOUR, DropoffTime, ActualDropoffTime)
	FROM Car_Reservation
	WHERE ReservationID = @ReservationID

	IF @LateDropoffTimeDiff > 0
	BEGIN
		DECLARE @LateDropoffPenalty FLOAT = @LateDropoffTimeDiff * @LateDropoffPenaltyPerHour
		SELECT @TotalPenalty = @TotalPenalty + @LateDropoffPenalty
	END

	RETURN @TotalPenalty
END



--------------------------------------------------------------------------------------------------
-- Function to calculate variable and total costs for a given reservation ID
--------------------------------------------------------------------------------------------------
CREATE FUNCTION dbo.CalculateCosts (@ReservationID int)
RETURNS @Costs TABLE (
    VariableCost FLOAT,
    TotalCost FLOAT,
    Taxes FLOAT
)
AS
BEGIN
    DECLARE @InsuranceCost FLOAT, @DiscountPercentage FLOAT, @PenaltyAmount FLOAT, @FixedCost FLOAT, @Taxes FLOAT
    DECLARE @VariableCost FLOAT, @TotalCost FLOAT, @DiscountAmount FLOAT
    
    SELECT @InsuranceCost = InsuranceCost, @DiscountPercentage = DiscountPercentage, @FixedCost = FixedCost
    FROM Car_Reservation cr
    INNER JOIN Insurance i ON cr.InsuranceID = i.InsuranceID
    INNER JOIN Discount d ON cr.DiscountID = d.DiscountID
    INNER JOIN BILLING b ON cr.ReservationID = b.ReservationID
    WHERE cr.ReservationID = @ReservationID
    
    SET @PenaltyAmount = dbo.CalculatePenaltyAmount(@ReservationID)
    SET @VariableCost = @InsuranceCost + @PenaltyAmount
    SET @DiscountAmount = (@DiscountPercentage / 100) * (@FixedCost + @VariableCost)
    SET @Taxes = 0.2 * (@FixedCost + @VariableCost) 
    SET @TotalCost = @FixedCost + @VariableCost + @Taxes - @DiscountAmount
    
    INSERT INTO @Costs (VariableCost, TotalCost, Taxes) VALUES (@VariableCost, @TotalCost, @Taxes)
    
    RETURN
END


------------------------------------------------
--------------- TRIGGERS-------------------------
-------------------------------------------------

--------------------------------------------------------------------------------------------------
--Trigger to check the car availability
--------------------------------------------------------------------------------------------------
CREATE TRIGGER tr_CheckCarAvailability
ON Car_Reservation
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM Cars
        WHERE CarID = (SELECT CarID FROM inserted)
          AND NOT CarID IN (
            SELECT CarID
            FROM Car_Reservation
            WHERE ReservationID <> (SELECT ReservationID FROM inserted)
              AND (
                (PickupTime BETWEEN (SELECT PickupTime FROM inserted) AND (SELECT DropoffTime FROM inserted))
                OR (DropoffTime BETWEEN (SELECT PickupTime FROM inserted) AND (SELECT DropoffTime FROM inserted))
                OR ((SELECT PickupTime FROM inserted) BETWEEN PickupTime AND DropoffTime)
                OR ((SELECT DropoffTime FROM inserted) BETWEEN PickupTime AND DropoffTime)
              )
          )
    )
    BEGIN
        PRINT 'Car is available for reservation.'
    END
    ELSE
    BEGIN
        RAISERROR('Car is not available for reservation within the selected time period.', 16, 1)
        ROLLBACK TRANSACTION
    END
END;


--------------------------------------------------------------------------------------------------
--Trigger to check the drop off time
--------------------------------------------------------------------------------------------------
CREATE TRIGGER tr_CheckDropOffTime
ON Car_Reservation
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Result int
    SELECT @Result = dbo.fn_CheckDropOffTime(i.PickupTime, i.DropoffTime) 
    FROM inserted i

    IF (@Result > 0)
    BEGIN
        RAISERROR('Pickup time should be greater than Dropoff time, please check the dates and times.', 20, 1)
        ROLLBACK TRANSACTION
    END
END;


--------------------------------------------------------------------------------------------------
-- Trigger to insert data into billing table when car reservation is made to generate the initial bill
--------------------------------------------------------------------------------------------------
CREATE TRIGGER tr_insert_billing
ON Car_Reservation
AFTER INSERT
AS
BEGIN
	DECLARE @ReservationID INT, @CarID INT, @PickupTime DATETIME, @CarFixedCost FLOAT, @DropoffTime DATETIME

	-- Get the ReservationID, CarID, PickupTime from the inserted row
	SELECT @ReservationID = i.ReservationID, @CarID = i.CarID, @PickupTime = i.PickupTime, @DropoffTime = i.DropoffTime 
	FROM inserted i

	-- Get the CarFixedCost from the CarCategory table based on the CarID
	SELECT @CarFixedCost = c.CarFixedCost
	FROM Car_Category c
	INNER JOIN Cars car ON c.CarCategoryID = car.CarCategoryID
	WHERE car.CarID = @CarID
	
	DECLARE @NoOfDays INT = DATEDIFF(DAY, @PickUpTime , @DropoffTime)
	IF @NoOfDays = 0
	BEGIN 
		SET @NoOfDays = 1
	END
	
	-- Update CarFixedCost Depending on the number of days
	SET @CarFixedCost = @CarFixedCost * @NoOfDays


	-- Insert a new row into the Billing table with default values
	INSERT INTO Billing (BillingDate, FixedCost, VariableCost, Taxes, TotalCost, ReservationID)
	VALUES (@PickupTime, @CarFixedCost, 0, 0, 0, @ReservationID)
END




--------------------------------------------------------------------------------------------------
-- Trigger to update billing table when actual dropoff time is available
--------------------------------------------------------------------------------------------------
CREATE TRIGGER UpdateBilling
ON Car_Reservation
AFTER UPDATE
AS
BEGIN
    IF UPDATE(ActualDropoffTime)
    BEGIN
        DECLARE @ReservationID int, @VariableCost FLOAT, @TotalCost FLOAT, @Taxes FLOAT
        
        SELECT @ReservationID = inserted.ReservationID
        FROM inserted
        
        SELECT @VariableCost = VariableCost, @TotalCost = TotalCost, @Taxes = Taxes
        FROM dbo.CalculateCosts(@ReservationID)
        
        UPDATE BILLING
        SET VariableCost = @VariableCost, TotalCost = @TotalCost, Taxes = @Taxes
        WHERE ReservationID = @ReservationID
    END
END










