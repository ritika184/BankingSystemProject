USE banking_system;
GO


INSERT INTO Customers (FullName, Email, ContactNumber, Address, Gender, DateOfBirth, CreatedAt)
VALUES 
('John Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Male', '1990-01-01', GETDATE());
DECLARE @Cust1 INT = SCOPE_IDENTITY();

INSERT INTO Customers (FullName, Email, ContactNumber, Address, Gender, DateOfBirth, CreatedAt)
VALUES 
('Jane Smith', 'jane.smith@example.com', '9876543210', '456 Elm St', 'Female', '1992-05-15', GETDATE());
DECLARE @Cust2 INT = SCOPE_IDENTITY();


-- Test 1: Non-existent account

PRINT 'Test 1: Non-existing account';
EXEC sp_Close_Account @AccountID = 9999; -- Should fail with error

-- Test 2: Account with balance ≠ 0

PRINT 'Test 2: Account with non-zero balance';
INSERT INTO Accounts (CustomerID, AccountType, Balance, OpenedDate, IsActive)
VALUES (@Cust1, 'Savings', 1000.00, GETDATE(), 1);
DECLARE @AccWithBalance INT = SCOPE_IDENTITY();

EXEC sp_Close_Account @AccountID = @AccWithBalance; -- Should fail due to non-zero balance


-- Test 3: Account with balance = 0 (valid closure)

PRINT 'Test 3: Valid account closure';
INSERT INTO Accounts (CustomerID, AccountType, Balance, OpenedDate, IsActive)
VALUES (@Cust2, 'Checking', 0.00, GETDATE(), 1);
DECLARE @ZeroBalanceAcc INT = SCOPE_IDENTITY();

EXEC sp_Close_Account @AccountID = @ZeroBalanceAcc; -- Should succeed
SELECT AccountID, IsActive FROM Accounts WHERE AccountID = @ZeroBalanceAcc;


SELECT * FROM Transactions 
WHERE AccountID = @ZeroBalanceAcc AND TransactionType = 'Closure';
