USE banking_system;
GO
CREATE TABLE Accounts (
    AccountID INT IDENTITY(5001,1),           -- Will become PRIMARY KEY later
    CustomerID INT,                           -- Will be FOREIGN KEY to Customers later
    AccountType VARCHAR(50),                  -- e.g., Savings, Current, etc.
    Balance DECIMAL(18,2),                    -- Balance amount in the account
    OpenedDate DATE,                          -- Date the account was opened
    IsActive BIT                              -- 1 = active, 0 = closed (CHECK constraint later if needed)
);