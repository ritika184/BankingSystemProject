-- 08_Test_Loan_Closure.sql
USE banking_system;
GO

PRINT 'Test 2: Closing a Loan';

DECLARE @CustomerID INT = 1001;

-- Mark the latest loan as closed
UPDATE Loans
SET LoanStatus = 'Closed'
WHERE CustomerID = @CustomerID AND LoanStatus = 'Active';

-- Verify
SELECT * FROM Loans WHERE CustomerID = @CustomerID;
