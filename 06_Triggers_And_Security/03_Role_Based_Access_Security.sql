USE banking_system;
GO

-- Create roles
CREATE ROLE Teller;
CREATE ROLE BranchManager;

-- Grant basic Teller permissions
GRANT SELECT, INSERT ON Customers TO Teller;
GRANT SELECT, INSERT ON Accounts TO Teller;
GRANT SELECT, INSERT ON Transactions TO Teller;

-- Grant extended permissions to BranchManager
GRANT SELECT, INSERT, UPDATE, DELETE ON Customers TO BranchManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Accounts TO BranchManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Transactions TO BranchManager;

