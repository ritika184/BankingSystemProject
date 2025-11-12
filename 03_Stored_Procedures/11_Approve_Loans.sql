USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Approve_Loan', 'P') IS NOT NULL
    DROP PROCEDURE sp_Approve_Loan;
GO

-- Create the procedure
CREATE PROCEDURE sp_Approve_Loan
    @LoanID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the loan exists and is not already approved
    IF EXISTS (
        SELECT 1 FROM Loans
        WHERE LoanID = @LoanID AND LoanStatus <> 'Active'
    )
    BEGIN
        -- Approve the loan
        UPDATE Loans
        SET LoanStatus = 'Active'
        WHERE LoanID = @LoanID;

        PRINT ' Loan approved successfully.';
    END
    ELSE
    BEGIN
        PRINT ' Loan either does not exist or is already active.';
    END
END;
GO
