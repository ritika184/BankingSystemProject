USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Get_Loan_History', 'P') IS NOT NULL
    DROP PROCEDURE sp_Get_Loan_History;
GO

-- Create the procedure
CREATE PROCEDURE sp_Get_Loan_History
    @CustomerID INT,
    @Status VARCHAR(20) = NULL,          -- Optional filter: 'Active' or 'Closed'
    @FromDate DATE = NULL,               -- Optional: Filter StartDate
    @ToDate DATE = NULL                  -- Optional: Filter EndDate
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the customer exists
    IF NOT EXISTS (
        SELECT 1 FROM Customers WHERE CustomerID = @CustomerID
    )
    BEGIN
        RAISERROR('Customer does not exist.', 16, 1);
        RETURN;
    END

    -- Fetch loans for the customer with optional filters
    SELECT
        LoanID,
        BranchID,
        LoanAmount,
        InterestRate,
        TermMonths,
        StartDate,
        EndDate,
        LoanStatus
    FROM Loans
    WHERE CustomerID = @CustomerID
      AND (@Status IS NULL OR LoanStatus = @Status)
      AND (@FromDate IS NULL OR StartDate >= @FromDate)
      AND (@ToDate IS NULL OR StartDate <= @ToDate)
    ORDER BY StartDate DESC;
END;
GO
