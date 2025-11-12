USE banking_system;
GO

-- Drop the procedure if it exists
IF OBJECT_ID('sp_Withdraw_Amount', 'P') IS NOT NULL
    DROP PROCEDURE sp_Withdraw_Amount;
GO

CREATE PROCEDURE sp_Withdraw_Amount
    @AccountID INT,
    @Amount DECIMAL(18, 2),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        
        IF NOT EXISTS (
            SELECT 1 FROM Accounts 
            WHERE AccountID = @AccountID AND IsActive = 1
        )
        BEGIN
            RAISERROR('Account not found or is not active.', 16, 1);
            RETURN;
        END

       
        DECLARE @CurrentBalance DECIMAL(18,2);
        SELECT @CurrentBalance = Balance 
        FROM Accounts 
        WHERE AccountID = @AccountID;

        IF @CurrentBalance < @Amount
        BEGIN
            RAISERROR('Insufficient funds.', 16, 1);
            RETURN;
        END

        
        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountID = @AccountID;

        
        INSERT INTO Transactions (AccountID, TransactionType, Amount, Description)
        VALUES (@AccountID, 'Withdrawal', @Amount, @Description);
    END TRY
    BEGIN CATCH
        DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT;
        SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY();
        RAISERROR(@ErrMsg, @ErrSeverity, 1);
    END CATCH
END;
GO
