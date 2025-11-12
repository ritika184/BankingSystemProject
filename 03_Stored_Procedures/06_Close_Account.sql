USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Close_Account', 'P') IS NOT NULL
    DROP PROCEDURE sp_Close_Account;
GO

-- Create the procedure
CREATE PROCEDURE sp_Close_Account
    @AccountID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the account exists and is active
    IF NOT EXISTS (
        SELECT 1 FROM Accounts WHERE AccountID = @AccountID AND IsActive = 1
    )
    BEGIN
        RAISERROR('Account either does not exist or is already closed.', 16, 1);
        RETURN;
    END

    -- Check if balance is zero
    DECLARE @Balance DECIMAL(18, 2);
    SELECT @Balance = Balance FROM Accounts WHERE AccountID = @AccountID;

    IF @Balance <> 0
    BEGIN
        RAISERROR('Account cannot be closed. Balance must be zero.', 16, 1);
        RETURN;
    END

    -- Close the account
    UPDATE Accounts
    SET IsActive = 0
    WHERE AccountID = @AccountID;

    -- Optional: Log closure in Transactions table
    INSERT INTO Transactions (AccountID, TransactionType, Amount, Description)
    VALUES (@AccountID, 'Closure', 0.00, 'Account closed');

    PRINT 'Account closed successfully.';
END;
GO
