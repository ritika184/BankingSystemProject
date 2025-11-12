USE banking_system;
GO


IF EXISTS (
    SELECT 1 FROM sys.foreign_keys 
    WHERE name = 'FK_Accounts_Customers'
)
BEGIN
    ALTER TABLE Accounts
    DROP CONSTRAINT FK_Accounts_Customers;
END
GO


IF EXISTS (
    SELECT 1 FROM sys.foreign_keys 
    WHERE name = 'FK_Loans_Customers'
)
BEGIN
    ALTER TABLE Loans
    DROP CONSTRAINT FK_Loans_Customers;
END
GO


IF EXISTS (
    SELECT 1 FROM sys.key_constraints 
    WHERE name = 'PK_Customers'
)
BEGIN
    ALTER TABLE Customers
    DROP CONSTRAINT PK_Customers;
END
GO
ALTER TABLE Customers
ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID);
GO
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes WHERE name = 'UQ_Customers_Email'
)
BEGIN
    ALTER TABLE Customers
    ADD CONSTRAINT UQ_Customers_Email UNIQUE (Email);
END
GO
IF NOT EXISTS (
    SELECT 1 FROM sys.check_constraints WHERE name = 'CHK_Customers_Gender'
)
BEGIN
    ALTER TABLE Customers
    ADD CONSTRAINT CHK_Customers_Gender
    CHECK (Gender IN ('Male', 'Female', 'Other'));
END
GO

IF NOT EXISTS (
    SELECT 1 
    FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('Customers') 
    AND COL_NAME(parent_object_id, parent_column_id) = 'CreatedAt'
)
BEGIN
    ALTER TABLE Customers
    ADD CONSTRAINT DF_Customers_CreatedAt 
    DEFAULT GETDATE() FOR CreatedAt;
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Accounts_Customers'
)
BEGIN
    ALTER TABLE Accounts
    ADD CONSTRAINT FK_Accounts_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID);
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Loans_Customers'
)
BEGIN
    ALTER TABLE Loans
    ADD CONSTRAINT FK_Loans_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID);
END
GO
