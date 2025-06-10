/*
============================================================
Create Database and Schemas
============================================================
Script Purpose:
	This script will check if the database exists and if it does,
	it will drop and recreate it again. The script also sets up 
	three schemas withing the database: 'bronze', 'silver' and 'gold'

WARNING:
	Running this script will drop the entire data warehouse it already exists. 
	All data in the databse will be permanantely deleted. Proceed with caution 
	and make sure you have proper backups before running this script
*/

USE master;
GO

--Drop and recreate the 'DataWarehouse' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO


-- Create the DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Switch to 'Datawarehouse' database from master
USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO


