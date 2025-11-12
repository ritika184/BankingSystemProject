

USE banking_system;
GO


--  Shrink the log file (Update with actual log file name if needed)
DBCC SHRINKFILE (banking_system_log, 1);  -- Usually *_log, confirm with sp_helpfile
GO

--  Clean up old backup history from msdb (older than 30 days)
DECLARE @DeleteBefore DATETIME = DATEADD(DAY, -30, GETDATE());

EXEC msdb.dbo.sp_delete_backuphistory @oldest_date = @DeleteBefore;
GO

PRINT ' Cleanup completed: log file shrunk and old backup history removed.';
