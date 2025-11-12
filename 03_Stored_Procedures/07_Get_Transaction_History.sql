USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Get_Transaction_History', 'P') IS NOT NULL
    DROP PROCEDURE sp_Get_Transaction_History;
GO

-- Create the procedure
CREATE PROCEDURE sp_Get_Transaction_History
    @AccountID INT,
    @FromDate DATETIME = NULL,
    @ToDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the account exists
    IF NOT EXISTS (
        SELECT 1 FROM Accounts WHERE AccountID = @AccountID
    )
    BEGIN
        RAISERROR('Account does not exist.', 16, 1);
        RETURN;
    END

    -- Fetch transaction history with optional date filtering
    SELECT
        TransactionID,
        AccountID,
        TransactionType,
        Amount,
        TransactionDate,
        Description
    FROM Transactions
    WHERE AccountID = @AccountID
      AND (@FromDate IS NULL OR TransactionDate >= @FromDate)
      AND (@ToDate IS NULL OR TransactionDate <= @ToDate)
    ORDER BY TransactionDate DESC;
END;
GO
