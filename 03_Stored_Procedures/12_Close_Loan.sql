USE banking_system;
GO

-- Drop the procedure if it exists
IF OBJECT_ID('sp_Close_Loan', 'P') IS NOT NULL
    DROP PROCEDURE sp_Close_Loan;
GO

-- Create the stored procedure
CREATE PROCEDURE sp_Close_Loan
    @LoanID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if loan exists and is currently active
    IF EXISTS (
        SELECT 1 FROM Loans
        WHERE LoanID = @LoanID AND LoanStatus = 'Active'
    )
    BEGIN
        -- Close the loan
        UPDATE Loans
        SET 
            LoanStatus = 'Closed',
            EndDate = GETDATE()
        WHERE LoanID = @LoanID;

        PRINT ' Loan closed successfully.';
    END
    ELSE
    BEGIN
        PRINT ' Loan either does not exist or is not active.';
    END
END;
GO
