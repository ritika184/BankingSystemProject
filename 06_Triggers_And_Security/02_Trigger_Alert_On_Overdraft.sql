USE banking_system;
GO

-- Trigger to prevent overdraft
CREATE OR ALTER TRIGGER trg_AlertOverdraft
ON Transactions
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Accounts a ON i.AccountID = a.AccountID
        WHERE i.TransactionType = 'Withdrawal' AND a.Balance - i.Amount < 0
    )
    BEGIN
        RAISERROR ('Overdraft Alert: Withdrawal would lead to negative balance!', 16, 1);
        ROLLBACK;
    END
END;
GO

-- Test with withdrawal > balance in any account
