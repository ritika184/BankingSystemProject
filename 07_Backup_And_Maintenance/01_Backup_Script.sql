BACKUP DATABASE banking_system
TO BankingSystem1BackupDevice
WITH INIT, -- Overwrites existing backup
     NAME = 'Full Backup of BankingSystemDB',
     STATS = 10;