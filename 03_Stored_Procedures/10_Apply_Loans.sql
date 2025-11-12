USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Apply_Loan', 'P') IS NOT NULL
    DROP PROCEDURE sp_Apply_Loan;
GO

-- Create the procedure
CREATE PROCEDURE sp_Apply_Loan
    @CustomerID INT,
    @BranchID INT,
    @LoanAmount DECIMAL(18,2),
    @InterestRate DECIMAL(5,2),
    @TermMonths INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartDate DATE = GETDATE();
    DECLARE @EndDate DATE = DATEADD(MONTH, @TermMonths, @StartDate);

    -- Insert the loan
    INSERT INTO Loans (CustomerID, BranchID, LoanAmount, InterestRate, TermMonths, StartDate, EndDate, LoanStatus)
    VALUES (@CustomerID, @BranchID, @LoanAmount, @InterestRate, @TermMonths, @StartDate, @EndDate, 'Active');

    PRINT '✅ Loan application successful.';
END;
GO
