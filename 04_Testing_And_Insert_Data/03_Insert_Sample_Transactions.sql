USE banking_system;
GO

INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate, Description)
VALUES
(5001, 'Deposit', 2000.00, GETDATE(), 'Initial deposit'),
(5001, 'Withdrawal', 500.00, GETDATE(), 'ATM withdrawal'),
(5002, 'Deposit', 5000.00, GETDATE(), 'Salary credited'),
(5003, 'Transfer', 1500.00, GETDATE(), 'Rent transfer'),
(5004, 'Deposit', 3000.00, GETDATE(), 'Online transfer'),
(5004, 'Withdrawal', 1000.00, GETDATE(), 'Bill payment'),
(5005, 'Transfer', 2000.00, GETDATE(), 'Transfer to friend'),
(5006, 'Deposit', 700.00, GETDATE(), 'Cash deposit'),
(5007, 'Withdrawal', 600.00, GETDATE(), 'Shopping'),
(5008, 'Deposit', 1200.00, GETDATE(), 'Bonus credited'),
(5009, 'Withdrawal', 300.00, GETDATE(), 'Online purchase'),
(5010, 'Deposit', 2500.00, GETDATE(), 'Monthly deposit');
