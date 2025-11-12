USE banking_system;
GO

DROP TABLE IF EXISTS Customers;
GO

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1001,1),      -- Will set PRIMARY KEY later
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),                  -- Will set UNIQUE constraint later
    ContactNumber VARCHAR(15) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Gender VARCHAR(10),                  -- CHECK constraint later
    DateOfBirth DATE NULL,
    CreatedAt DATETIME                   -- DEFAULT constraint later
);
