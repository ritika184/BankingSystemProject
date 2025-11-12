USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Apply_Loan', 'P') IS NOT NULL
    DROP PROCEDURE sp_Apply_Loan;
GO

-- Create the loan application procedure
CREATE PROCEDURE sp_Apply_Loan
    @CustomerID INT,
    @BranchID INT,
    @LoanAmount DECIMAL(18,2),
    @InterestRate DECIMAL(5,2),
    @TermMonths INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate customer exists
    IF NOT EXISTS (SELECT 1 FROM Customers WHERE CustomerID = @CustomerID)
    BEGIN
        RAISERROR(' Customer does not exist.', 16, 1);
        RETURN;
    END

    -- Validate branch exists
    IF NOT EXISTS (SELECT 1 FROM Branch WHERE BranchID = @BranchID)
    BEGIN
        RAISERROR(' Branch does not exist.', 16, 1);
        RETURN;
    END

    -- Validate positive values
    IF @LoanAmount <= 0 OR @InterestRate <= 0 OR @TermMonths <= 0
    BEGIN
        RAISERROR(' LoanAmount, InterestRate, and TermMonths must be positive.', 16, 1);
        RETURN;
    END

    DECLARE @StartDate DATE = GETDATE();
    DECLARE @EndDate DATE = DATEADD(MONTH, @TermMonths, @StartDate);

    -- Insert loan application
    INSERT INTO Loans (CustomerID, BranchID, LoanAmount, InterestRate, TermMonths, StartDate, EndDate, LoanStatus)
    VALUES (@CustomerID, @BranchID, @LoanAmount, @InterestRate, @TermMonths, @StartDate, @EndDate, 'Active');

    PRINT ' Loan application successful.';
END;
GO
