USE banking_system;
GO

CREATE OR ALTER VIEW View_Top_5_Transactions AS
SELECT TOP 5
    t.TransactionID,
    t.AccountID,
    c.FullName AS CustomerName,
    t.TransactionType,
    t.Amount AS TransactionAmount,
    t.TransactionDate,
    t.Description
FROM 
    Transactions t
JOIN 
    Accounts a ON t.AccountID = a.AccountID
JOIN 
    Customers c ON a.CustomerID = c.CustomerID
ORDER BY 
    t.Amount DESC;
GO

--  Test the view
SELECT * FROM View_Top_5_Transactions;
