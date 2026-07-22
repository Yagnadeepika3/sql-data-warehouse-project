/*
=========================================================================================
Create Database and Schemas
=========================================================================================
Script Purpose:
   This script creates a new database named "DataWarehouse" after checking if it already exists.
   If the database already exists it is dropped and recreated. Aditionally the script sets up three schemas
   within the database:"bronze", "silver" and "gold".

WARNING:

Running this script will automatically delete the whole 'DataWarehouse' if exists.
all the data in the databases will be permenantly deleted. proceed with caution and ensure you have 
proper backups before running this script.

*/
USE master;
GO

--DROP and RECREATE the 'DataWarehouse' Database
IF EXISTS ( select 1 from sys.databases where name= 'DataWarehouse'	
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER with ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
----Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

---- Create schemas
CREATE schema bronze;
GO
CREATE schema silver;
GO
CREATE schema gold;
GO
