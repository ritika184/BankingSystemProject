USE banking_system;
GO

-- Tracking table for transaction logs
IF OBJECT_ID('TransactionLogs') IS NOT NULL
    DROP TABLE TransactionLogs;
GO

CREATE TABLE TransactionLogs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(18,2),
    LoggedAt DATETIME DEFAULT GETDATE()
);
GO

-- Trigger to log every new transaction
CREATE OR ALTER TRIGGER trg_TrackTransaction
ON Transactions
AFTER INSERT
AS
BEGIN
    INSERT INTO TransactionLogs (TransactionID, AccountID, TransactionType, Amount)
    SELECT 
        i.TransactionID, i.AccountID, i.TransactionType, i.Amount
    FROM inserted i;
END;
GO

--  Test the trigger (insert a transaction, then SELECT * FROM TransactionLogs)
