USE banking_system;
GO

DROP TABLE IF EXISTS Loans;
GO

CREATE TABLE Loans (
    LoanID INT IDENTITY(7001,1),           -- Will be PRIMARY KEY later
    CustomerID INT,                        -- FK to Customers (added later)
    BranchID INT,                          -- Optional: FK to Branch (added later)
    LoanAmount DECIMAL(18,2),
    InterestRate DECIMAL(5,2),             -- Example: 8.5%
    TermMonths INT,                        -- Loan duration in months
    StartDate DATE,
    EndDate DATE,
    LoanStatus VARCHAR(20)                 -- e.g., 'Active', 'Closed'
);
