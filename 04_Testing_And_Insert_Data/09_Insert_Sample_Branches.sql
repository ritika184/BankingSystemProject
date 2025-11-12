
USE banking_system;
GO

DROP TABLE IF EXISTS Branches;
GO

CREATE TABLE Branches (
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(100),
    IFSCCode VARCHAR(20) UNIQUE,
    Address NVARCHAR(255)
);

INSERT INTO Branches (BranchName, IFSCCode, Address)
VALUES
('Patna Main', 'PATN0001234', 'Fraser Road, Patna'),
('Ranchi Central', 'RANC0002345', 'Main Road, Ranchi'),
('Delhi HQ', 'DELH0003456', 'Connaught Place, Delhi');

-- Verify
SELECT * FROM Branches;
