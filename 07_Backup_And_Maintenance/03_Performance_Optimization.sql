-- Rebuild all indexes in the database
USE banking_system;
GO
EXEC sp_MSforeachtable 'ALTER INDEX ALL ON ? REBUILD';

-- Update statistics
EXEC sp_MSforeachtable 'UPDATE STATISTICS ?';

-- Check database integrity
DBCC CHECKDB (BankingSystemDB);
