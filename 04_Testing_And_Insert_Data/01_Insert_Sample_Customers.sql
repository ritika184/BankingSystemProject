USE banking_system;
GO

-- Insert sample customers (CustomerID will auto-generate from 1001)
INSERT INTO Customers (FullName, Email, ContactNumber, Address, Gender, DateOfBirth, CreatedAt)
VALUES 
('Ravi Sharma',     'ravi.sharma@example.com',   '9876543210', 'Delhi',      'Male',   '1990-01-15', GETDATE()),
('Priya Mehta',     'priya.mehta@example.com',   '9876543211', 'Mumbai',     'Female', '1992-03-20', GETDATE()),
('Amit Verma',      'amit.verma@example.com',    '9876543212', 'Kolkata',    'Male',   '1989-07-08', GETDATE()),
('Neha Singh',      'neha.singh@example.com',    '9876543213', 'Bangalore',  'Female', '1993-12-01', GETDATE()),
('Karan Patel',     'karan.patel@example.com',   '9876543214', 'Ahmedabad',  'Male',   '1988-11-25', GETDATE()),
('Sneha Rao',       'sneha.rao@example.com',     '9876543215', 'Hyderabad',  'Female', '1991-06-10', GETDATE()),
('Rahul Yadav',     'rahul.yadav@example.com',   '9876543216', 'Lucknow',    'Male',   '1994-05-22', GETDATE()),
('Anjali Jain',     'anjali.jain@example.com',   '9876543217', 'Jaipur',     'Female', '1990-09-17', GETDATE()),
('Deepak Mishra',   'deepak.mishra@example.com', '9876543218', 'Pune',       'Male',   '1987-10-30', GETDATE()),
('Sakshi Agarwal',  'sakshi.agarwal@example.com','9876543219', 'Chandigarh', 'Female', '1995-04-12', GETDATE());
GO
