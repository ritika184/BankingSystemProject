Banking System SQL Project

Internship Project | Domain: SQL | Duration: 02 June 2025 – 03 August 2025
Submitted By: Ritika Kumari
Roll Number: 2241011228
Organization: Celebal Technologies
Mentor: Anurag Yadav, Shubham Jaunjal


Project Overview
The Banking System SQL Project is a comprehensive database management system designed to simulate the core operations of a bank. The system allows for managing customer accounts, performing transactions, generating reports, and maintaining data integrity using SQL Server.This project is designed to enhance understanding of relational databases, stored procedures, triggers, views, and database security measures.

Features
Customer account management (Create, Update, Delete)
Transaction processing (Deposit, Withdrawal, Transfer)
Generation of account statements and reports
Stored procedures for repetitive tasks
Views to simplify data retrieval
Triggers to maintain data integrity
Backup and maintenance features for data safety

Database Design
Tables: Customer, Account, Transaction, Employee, Loan, etc.

Relationships:
One-to-many relationship between Customer and Account
One-to-many relationship between Account and Transaction
Constraints: Primary keys, foreign keys, unique constraints, and default values are implemented to ensure data accuracy.

SQL Implementation
Stored Procedures: Automate deposit, withdrawal, fund transfer, and report generation.
Views: Simplify complex queries and provide summarized account or transaction information.
Triggers: Automatically log transactions or prevent invalid operations.
Functions: Custom functions for balance calculation and account verification.
User Instructions
Open SQL Server Management Studio (SSMS).
Restore the database backup provided.

Execute SQL scripts in the following order:
01_CreateTables.sql
02_InsertData.sql
03_Deposit_Amount.sql
04_Withdraw_Amount.sql
05_Transfer_Amount.sql
06_Reports.sql
07_BackupAndMaintenance.sql
Run stored procedures and queries as required to interact with the system.

Security & Authentication
User authentication implemented for database access.
Role-based access control for employees and administrators.
Data integrity enforced using constraints and triggers.
Backup and Maintenance
Full database backup can be created using SSMS Backup option.
Transaction log backups maintain incremental changes.
Regular maintenance includes:
Index optimization
Integrity checks
Scheduled backups to ensure data safety

Conclusion / Learning Outcomes
Gained practical experience in designing and implementing a relational database system.
Learned to use SQL Server features like stored procedures, triggers, and views.
Developed an understanding of database security, backup, and maintenance strategies.
Enhanced problem-solving skills by simulating real-world banking operations.

References
SQL Server Documentation: https://learn.microsoft.com/en-us/sql/sql-server/
Celebal Technologies Internship Resources
