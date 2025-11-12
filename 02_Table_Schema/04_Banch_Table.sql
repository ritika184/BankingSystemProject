USE banking_system;
GO

DROP TABLE IF EXISTS Branch;
GO

CREATE TABLE Branch (
    BranchID INT IDENTITY(3001,1),         -- Will become PRIMARY KEY later
    BranchName NVARCHAR(100),              -- Name of the branch
    Location NVARCHAR(150),                -- City or full address
    ContactNumber VARCHAR(15),             -- Optional branch contact
    ManagerName NVARCHAR(100)              -- Name of branch manager (optional)
);
