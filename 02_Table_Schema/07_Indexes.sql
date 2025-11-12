USE banking_system;
GO

----------------------------------------------------
-- 📌 Indexes for Customers
----------------------------------------------------
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Customers_Email' AND object_id = OBJECT_ID('Customers'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Customers_Email ON Customers (Email);
END;

IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Customers_FullName' AND object_id = OBJECT_ID('Customers'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Customers_FullName ON Customers (FullName);
END;

----------------------------------------------------
-- 📌 Indexes for Accounts
----------------------------------------------------
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Accounts_CustomerID' AND object_id = OBJECT_ID('Accounts'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Accounts_CustomerID ON Accounts (CustomerID);
END;

IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Accounts_AccountType' AND object_id = OBJECT_ID('Accounts'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Accounts_AccountType ON Accounts (AccountType);
END;

----------------------------------------------------
-- 📌 Indexes for Transactions
----------------------------------------------------
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Transactions_AccountID' AND object_id = OBJECT_ID('Transactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Transactions_AccountID ON Transactions (AccountID);
END;

IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Transactions_Date' AND object_id = OBJECT_ID('Transactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Transactions_Date ON Transactions (TransactionDate);
END;

----------------------------------------------------
-- 📌 Indexes for Loans
----------------------------------------------------
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Loans_CustomerID' AND object_id = OBJECT_ID('Loans'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Loans_CustomerID ON Loans (CustomerID);
END;

IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Loans_BranchID' AND object_id = OBJECT_ID('Loans'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Loans_BranchID ON Loans (BranchID);
END;

IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Loans_Status' AND object_id = OBJECT_ID('Loans'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Loans_Status ON Loans (LoanStatus);
END;

----------------------------------------------------
-- 📌 Indexes for Branch
----------------------------------------------------
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Branch_Name' AND object_id = OBJECT_ID('Branch'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Branch_Name ON Branch (BranchName);
END;
