
CREATE DATABASE TestDb;
GO

USE TestDb;
GO

CREATE TABLE Countries (
             CountryID   INT PRIMARY KEY IDENTITY(1 , 1) ,
             CountryName NVARCHAR(50) NOT NULL ,
             PhoneCode   NVARCHAR(24) ,
             CreatedDate DATETIME DEFAULT(GETDATE())
                       );
GO

CREATE TABLE Cities (
             CityID      INT PRIMARY KEY IDENTITY(1 , 1) ,
             CityName    NVARCHAR(50) NOT NULL ,
             PhoneCode   NVARCHAR(24) NULL ,
             CreatedDate DATETIME DEFAULT(GETDATE()) ,
             CountryID   INT FOREIGN KEY REFERENCES Countries(CountryID)
                    );
GO

CREATE TABLE Districts (
             DistrictID   INT PRIMARY KEY IDENTITY(1 , 1) ,
             DistrictName NVARCHAR(50) NOT NULL ,
             PostalCode   NVARCHAR(15) ,
             CreatedDate  DATETIME DEFAULT(GETDATE()) ,
             CityID       INT FOREIGN KEY REFERENCES Cities(CityID)
                       );
GO

CREATE TABLE Towns (
             TownID      INT PRIMARY KEY IDENTITY(1 , 1) ,
             TownName    NVARCHAR(50) NOT NULL ,
             CreatedDate DATETIME DEFAULT(GETDATE()) ,
             DistrictID  INT FOREIGN KEY REFERENCES Districts(DistrictID)
                   );


