USE BankingSystemDB;
GO

-- ==========================
-- 🔗 Add Constraints to Transactions
-- ==========================





    CONSTRAINT FK_Transactions_ToAccount FOREIGN KEY (ToAccountID)
    REFERENCES Accounts(AccountID);

-- ==========================
-- 🔗 Add Constraints to Loans
-- ==========================
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customer FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT FK_Loans_Account FOREIGN KEY (AccountID)
    REFERENCES Accounts(AccountID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
