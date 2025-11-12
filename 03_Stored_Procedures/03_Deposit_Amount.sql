USE banking_system;
GO

IF OBJECT_ID('sp_Deposit_Amount', 'P') IS NOT NULL
    DROP PROCEDURE sp_Deposit_Amount;
GO

CREATE PROCEDURE sp_Deposit_Amount
    @AccountID INT,
    @Amount DECIMAL(18,2),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1 FROM Accounts 
        WHERE AccountID = @AccountID AND IsActive = 1
    )
    BEGIN
        RAISERROR('Account ID %d does not exist or is not active.', 16, 1, @AccountID);
        RETURN;
    END

    IF @Amount <= 0
    BEGIN
        RAISERROR('Deposit amount must be greater than 0.', 16, 1);
        RETURN;
    END

    UPDATE Accounts
    SET Balance = Balance + @Amount
    WHERE AccountID = @AccountID;

    INSERT INTO Transactions (AccountID, TransactionType, Amount, Description)
    VALUES (@AccountID, 'Deposit', @Amount, @Description);

    PRINT 'Deposit successful.';
END;
GO
