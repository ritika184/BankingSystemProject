USE banking_system;
GO


-- TEST CASE 1: Successful Transfer
PRINT 'Test 1: Successful transfer from 5001 to 5002';
EXEC sp_Transfer_Amount 
    @FromAccountID = 5001, 
    @ToAccountID = 5002, 
    @Amount = 200.00, 
    @Description = 'Test Case: Rent payment';


-- TEST CASE 2: Insufficient Balance

PRINT ' Test 2: Insufficient balance';
EXEC sp_Transfer_Amount 
    @FromAccountID = 5001, 
    @ToAccountID = 5002, 
    @Amount = 9999999.99, 
    @Description = 'Test Case: Overdraft attempt';


--  TEST CASE 3: Sender Account Does Not Exist
PRINT ' Test 3: Sender account invalid';
EXEC sp_Transfer_Amount 
    @FromAccountID = 9999, 
    @ToAccountID = 5002, 
    @Amount = 100.00, 
    @Description = 'Test Case: Invalid sender';


--  TEST CASE 4: Receiver Account Does Not Exist
PRINT ' Test 4: Receiver account invalid';
EXEC sp_Transfer_Amount 
    @FromAccountID = 5001, 
    @ToAccountID = 9999, 
    @Amount = 100.00, 
    @Description = 'Test Case: Invalid receiver';


--  TEST CASE 5: Receiver Account Inactive

PRINT ' Test 5: Receiver account inactive';
UPDATE Accounts SET IsActive = 0 WHERE AccountID = 5002;

EXEC sp_Transfer_Amount 
    @FromAccountID = 5001, 
    @ToAccountID = 5002, 
    @Amount = 50.00, 
    @Description = 'Test Case: Receiver inactive';

UPDATE Accounts SET IsActive = 1 WHERE AccountID = 5002;


--  TEST CASE 6: Sender Account Inactive
PRINT ' Test 6: Sender account inactive';
-- Temporarily deactivate account
UPDATE Accounts SET IsActive = 0 WHERE AccountID = 5001;

EXEC sp_Transfer_Amount 
    @FromAccountID = 5001, 
    @ToAccountID = 5002, 
    @Amount = 50.00, 
    @Description = 'Test Case: Sender inactive';

-- Reactivate the account
UPDATE Accounts SET IsActive = 1 WHERE AccountID = 5001;


--  Final Check: Balances and Transactions

PRINT ' Final Balance Check for Accounts 5001 and 5002';
SELECT AccountID, Balance, IsActive FROM Accounts WHERE AccountID IN (5001, 5002);

PRINT ' Last 5 Transactions';
SELECT TOP 5 * FROM Transactions 
ORDER BY TransactionID DESC;
