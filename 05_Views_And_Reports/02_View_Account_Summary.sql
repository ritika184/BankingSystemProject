USE banking_system;
GO

CREATE OR ALTER VIEW View_Account_Summary AS
SELECT 
    a.AccountID,
    c.FullName AS CustomerName,
    a.AccountType,
    a.Balance,
    a.OpenedDate,
    CASE 
        WHEN a.IsActive = 1 THEN 'Active'
        ELSE 'Closed'
    END AS AccountStatus
FROM 
    Accounts a
JOIN 
    Customers c ON a.CustomerID = c.CustomerID;
GO

-- Test the view
SELECT * FROM View_Account_Summary;
