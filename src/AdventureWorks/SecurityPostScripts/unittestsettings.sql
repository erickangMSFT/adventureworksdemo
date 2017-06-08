
EXEC('
USE master

IF NOT EXISTS (SELECT name 
                FROM [sys].[server_principals]
                WHERE [type] = ''S'' AND name = N''unittest'')
	CREATE LOGIN [unittest] WITH PASSWORD = ''Yukon900'', DEFAULT_DATABASE=[AdventureWorks_UnitTest], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;


USE [AdventureWorks_UnitTest]

IF NOT EXISTS (SELECT name 
				FROM [sys].[database_principals]
				WHERE [type] = ''S'' AND name = N''unittest'')
	BEGIN
		CREATE USER [unittest] 
		FOR LOGIN [unittest] WITH DEFAULT_SCHEMA=[dbo]
		ALTER ROLE [db_datareader] ADD MEMBER [unittest]
		ALTER ROLE [db_datawriter] ADD MEMBER [unittest]
		GRANT VIEW Definition TO [unittest]
		GRANT EXECUTE TO [unittest]
		GRANT CREATE TABLE TO [unittest]
		GRANT ALTER ANY SCHEMA TO [unittest]
		GRANT INSERT TO [unittest]
		GRANT SELECT TO [unittest]
		GRANT UPDATE TO [unittest]
		GRANT VIEW DATABASE STATE TO [unittest]
	END
');
