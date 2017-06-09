
EXEC('
USE master

IF NOT EXISTS (SELECT name 
                FROM [sys].[server_principals]
                WHERE [type] = ''S'' AND name = N''unittest'')
	CREATE LOGIN [unittest] WITH PASSWORD = ''Yukon900'', DEFAULT_DATABASE=[AdventureWorks_UnitTest], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
	ALTER SERVER ROLE [sysadmin] ADD MEMBER [unittest]
');

