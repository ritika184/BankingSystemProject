
USE banking_system;
GO

PRINT 'Test 1: Approving a Loan for an Existing Customer';

DECLARE @CustomerID INT = 1001;
DECLARE @BranchID INT = 1;

INSERT INTO Loans (
    CustomerID, BranchID, LoanAmount, InterestRate, TermMonths, StartDate, EndDate, LoanStatus
)
VALUES (
    @CustomerID, @BranchID, 250000, 8.5, 24, GETDATE(), DATEADD(MONTH, 24, GETDATE()), 'Active'
);

-- Verify
SELECT * FROM Loans WHERE CustomerID = @CustomerID;
