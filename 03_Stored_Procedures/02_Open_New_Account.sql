USE banking_system;
GO


IF OBJECT_ID('sp_Open_New_Account', 'P') IS NOT NULL
    DROP PROCEDURE sp_Open_New_Account;
GO


CREATE PROCEDURE sp_Open_New_Account
    @CustomerID INT,
    @AccountType NVARCHAR(50),
    @InitialDeposit DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;

    
    IF NOT EXISTS (
        SELECT 1 FROM Customers WHERE CustomerID = @CustomerID
    )
    BEGIN
        RAISERROR('Customer ID %d does not exist.', 16, 1, @CustomerID);
        RETURN;
    END

    
    IF @InitialDeposit < 1000
    BEGIN
        RAISERROR('Minimum initial deposit is ₹1000.', 16, 1);
        RETURN;
    END

    INSERT INTO Accounts (CustomerID, AccountType, Balance, OpenedDate, IsActive)
    VALUES (@CustomerID, @AccountType, @InitialDeposit, GETDATE(), 1);

    PRINT ' Account opened successfully.';
END;
GO
