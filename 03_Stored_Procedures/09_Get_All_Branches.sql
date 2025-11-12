USE banking_system;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('sp_Get_All_Branches', 'P') IS NOT NULL
    DROP PROCEDURE sp_Get_All_Branches;
GO

-- Create the procedure
CREATE PROCEDURE sp_Get_All_Branches
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        BranchID,
        BranchName,
        Location,
        ContactNumber,
        ManagerName
    FROM Branch
    ORDER BY BranchName;
END;
GO
