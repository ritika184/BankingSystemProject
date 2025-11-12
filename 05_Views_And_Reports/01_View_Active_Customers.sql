USE banking_system;
GO

CREATE OR ALTER VIEW View_Active_Customers AS
SELECT 
    c.CustomerID,
    c.FullName,
    c.Email,
    c.ContactNumber,
    a.AccountID,
    a.AccountType,
    a.Balance,
    a.OpenedDate,
    CASE 
        WHEN a.IsActive = 1 THEN 'Active' 
        ELSE 'Closed' 
    END AS AccountStatus
FROM 
    Customers c
JOIN 
    Accounts a ON c.CustomerID = a.CustomerID
WHERE 
    a.IsActive = 1;
GO

--  Test the view
SELECT * FROM View_Active_Customers;
