USE banking_system;
GO

IF OBJECT_ID('sp_Transfer_Amount', 'P') IS NOT NULL
    DROP PROCEDURE sp_Transfer_Amount;
GO

CREATE PROCEDURE sp_Transfer_Amount
    @FromAccountID INT,
    @ToAccountID INT,
    @Amount DECIMAL(18, 2),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate both accounts are active
        IF NOT EXISTS (
            SELECT 1 FROM Accounts WHERE AccountID = @FromAccountID AND IsActive = 1
        )
        BEGIN
            RAISERROR('Sender account not found or inactive.', 16, 1);
            RETURN;
        END

        IF NOT EXISTS (
            SELECT 1 FROM Accounts WHERE AccountID = @ToAccountID AND IsActive = 1
        )
        BEGIN
            RAISERROR('Receiver account not found or inactive.', 16, 1);
            RETURN;
        END

        -- Check if sender has sufficient balance
        DECLARE @FromBalance DECIMAL(18, 2);
        SELECT @FromBalance = Balance FROM Accounts WHERE AccountID = @FromAccountID;

        IF @FromBalance < @Amount
        BEGIN
            RAISERROR('Insufficient funds in sender account.', 16, 1);
            RETURN;
        END

        -- Start transaction block
        BEGIN TRANSACTION;

        -- Deduct from sender
        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountID = @FromAccountID;

        -- Add to receiver
        UPDATE Accounts
        SET Balance = Balance + @Amount
        WHERE AccountID = @ToAccountID;

        -- Log sender transaction
        INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate, Description)
        VALUES (
            @FromAccountID, 'Transfer', @Amount, GETDATE(),
            ISNULL(@Description, '') + ' (Transferred to Account ' + CAST(@ToAccountID AS NVARCHAR) + ')'
        );

        -- Log receiver transaction
        INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate, Description)
        VALUES (
            @ToAccountID, 'Deposit', @Amount, GETDATE(),
            ISNULL(@Description, '') + ' (Received from Account ' + CAST(@FromAccountID AS NVARCHAR) + ')'
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Only rollback if transaction has begun
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT;
        SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY();
        RAISERROR(@ErrMsg, @ErrSeverity, 1);
    END CATCH
END;
GO
