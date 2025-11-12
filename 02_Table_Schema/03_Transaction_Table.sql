USE banking_system;
GO

DROP TABLE IF EXISTS Transactions;
GO

CREATE TABLE Transactions (
    TransactionID INT IDENTITY(9001,1),     -- Will become PRIMARY KEY later
    AccountID INT,                          -- Will be FOREIGN KEY to Accounts table later
    TransactionType VARCHAR(20),            -- e.g., 'Deposit', 'Withdrawal', 'Transfer'
    Amount DECIMAL(18,2),                   -- Transaction amount
    TransactionDate DATETIME,               -- Timestamp of transaction
    Description NVARCHAR(255)               -- Optional remarks or notes
);
