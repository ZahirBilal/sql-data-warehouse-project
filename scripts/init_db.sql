-- Create Database 'DataWarehouse'
/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
	this script creates a new database after checking whether it exists. 
	and additionaly it creates the medallion architecture schema
WARNING:
running this script will drop the entire 'DataWarehouse' db if exists. 
run carefully and always have backups
*/

USE master;
GO

-- Drop and recreate the datawarehouse db
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
-- stop all users transactions temporarily
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create Warehouse
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO -- seperator in sql
CREATE SCHEMA gold;
GO
