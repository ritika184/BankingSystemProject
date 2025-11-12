USE banking_system;
GO

----------------------------------------------------
-- 🔓 STEP 1: DROP FOREIGN KEY CONSTRAINTS FIRST
----------------------------------------------------

-- Transactions → Accounts
IF OBJECT_ID('FK_Transactions_Accounts', 'F') IS NOT NULL
    ALTER TABLE Transactions DROP CONSTRAINT FK_Transactions_Accounts;

-- Accounts → Customers
IF OBJECT_ID('FK_Accounts_Customers', 'F') IS NOT NULL
    ALTER TABLE Accounts DROP CONSTRAINT FK_Accounts_Customers;

-- Loans → Customers
IF OBJECT_ID('FK_Loans_Customers', 'F') IS NOT NULL
    ALTER TABLE Loans DROP CONSTRAINT FK_Loans_Customers;

-- Loans → Branch
IF OBJECT_ID('FK_Loans_Branch', 'F') IS NOT NULL
    ALTER TABLE Loans DROP CONSTRAINT FK_Loans_Branch;
GO

----------------------------------------------------
-- 🔄 STEP 2: DROP EXISTING CONSTRAINTS IF ANY
----------------------------------------------------

-- Customers Table
IF OBJECT_ID('PK_Customers', 'PK') IS NOT NULL
    ALTER TABLE Customers DROP CONSTRAINT PK_Customers;

IF OBJECT_ID('UQ_Customers_Email', 'UQ') IS NOT NULL
    ALTER TABLE Customers DROP CONSTRAINT UQ_Customers_Email;

IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'CHK_Customers_Gender')
    ALTER TABLE Customers DROP CONSTRAINT CHK_Customers_Gender;

IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = 'DF_Customers_CreatedAt')
    ALTER TABLE Customers DROP CONSTRAINT DF_Customers_CreatedAt;

-- Accounts Table
IF OBJECT_ID('PK_Accounts', 'PK') IS NOT NULL
    ALTER TABLE Accounts DROP CONSTRAINT PK_Accounts;

-- Transactions Table
IF OBJECT_ID('PK_Transactions', 'PK') IS NOT NULL
    ALTER TABLE Transactions DROP CONSTRAINT PK_Transactions;

IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'CHK_Transactions_Type')
    ALTER TABLE Transactions DROP CONSTRAINT CHK_Transactions_Type;

IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = 'DF_Transactions_Date')
    ALTER TABLE Transactions DROP CONSTRAINT DF_Transactions_Date;

-- Branch Table
IF OBJECT_ID('PK_Branch', 'PK') IS NOT NULL
    ALTER TABLE Branch DROP CONSTRAINT PK_Branch;

-- Loans Table
IF OBJECT_ID('PK_Loans', 'PK') IS NOT NULL
    ALTER TABLE Loans DROP CONSTRAINT PK_Loans;

IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'CHK_Loans_Status')
    ALTER TABLE Loans DROP CONSTRAINT CHK_Loans_Status;
GO

----------------------------------------------------
-- 🔐 STEP 3: ADD CONSTRAINTS BACK IN ORDER
----------------------------------------------------

-- Customers
ALTER TABLE Customers
ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID);

ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_Email UNIQUE (Email);

ALTER TABLE Customers
ADD CONSTRAINT CHK_Customers_Gender CHECK (Gender IN ('Male', 'Female', 'Other'));

ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_CreatedAt DEFAULT GETDATE() FOR CreatedAt;

-- Accounts
ALTER TABLE Accounts
ADD CONSTRAINT PK_Accounts PRIMARY KEY (AccountID);

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

-- Transactions
ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions PRIMARY KEY (TransactionID);

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT CHK_Transactions_Type CHECK (TransactionType IN ('Deposit', 'Withdrawal', 'Transfer'));

ALTER TABLE Transactions
ADD CONSTRAINT DF_Transactions_Date DEFAULT GETDATE() FOR TransactionDate;

-- Branch
ALTER TABLE Branch
ADD CONSTRAINT PK_Branch PRIMARY KEY (BranchID);

-- Loans
ALTER TABLE Loans
ADD CONSTRAINT PK_Loans PRIMARY KEY (LoanID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Branch FOREIGN KEY (BranchID)
REFERENCES Branch(BranchID);

ALTER TABLE Loans
ADD CONSTRAINT CHK_Loans_Status CHECK (LoanStatus IN ('Active', 'Closed'));
