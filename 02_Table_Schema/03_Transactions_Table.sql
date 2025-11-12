USE BankingSystemDB_1;
GO

-- Drop table if it already exists (for fresh setup/testing)
IF OBJECT_ID('Transactions', 'U') IS NOT NULL
    DROP TABLE Transactions;
GO

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT NOT NULL,                          -- Foreign key to Accounts
    TransactionType VARCHAR(20) NOT NULL CHECK (TransactionType IN ('Deposit', 'Withdraw', 'Transfer')),
    Amount DECIMAL(18,2) NOT NULL CHECK (Amount > 0),
    TransactionDate DATETIME NOT NULL DEFAULT GETDATE(),
    Remarks NVARCHAR(255),

    -- For transfers, we can track the destination account (nullable)
    ToAccountID INT NULL,  -- Only used for transfers

    -- Foreign key constraint will be added in 06_Constraints_And_Indexes.sql
);
GO
