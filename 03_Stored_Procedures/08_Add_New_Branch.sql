USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Add_New_Branch', 'P') IS NOT NULL
    DROP PROCEDURE sp_Add_New_Branch;
GO

-- Create the procedure
CREATE PROCEDURE sp_Add_New_Branch
    @BranchName NVARCHAR(100),
    @Location NVARCHAR(150),
    @ContactNumber VARCHAR(15) = NULL,
    @ManagerName NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the new branch
    INSERT INTO Branch (BranchName, Location, ContactNumber, ManagerName)
    VALUES (@BranchName, @Location, @ContactNumber, @ManagerName);

    -- Return the new BranchID
    SELECT SCOPE_IDENTITY() AS NewBranchID;
END;
GO
