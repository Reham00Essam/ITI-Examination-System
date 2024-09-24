CREATE database Final_Project

on
(
name ='EX_System',Size=10,
Filegrowth=64,
maxsize=unlimited,
filename ='D:\ITI\Grad Project\Final Project\DB\EX_System.mdf'
)
log on (
name ='EX_System-Log',Size=5,
Filegrowth=64,
maxsize=unlimited,
filename ='D:\ITI\Grad Project\Final Project\DB\EX_System-Log.ldf'
)



use Final_Project
GO


----add secondary file group----------------
Alter database Final_Project
ADD filegroup SecondaryFG;

-- Add a file to the new filegroup
ALTER DATABASE Final_Project
ADD FILE (
    NAME = N'SecondaryFG',
    FILENAME = N'D:\ITI\Grad Project\Final Project\DB\SecondaryFG.ndf',
    SIZE = 5MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 64
)
TO FILEGROUP secondaryFG;


