CREATE TABLE [dbo].[Table]
(
	[accountNumber] INT NOT NULL PRIMARY KEY, 
    [username] NVARCHAR(50) NULL, 
	[email address] NVARCHAR(100) NULL,
    [password] NVARCHAR(100) NULL, 
    [account type] NCHAR(10) NULL DEFAULT user, 
    [confirmed] BIT NULL DEFAULT 0, 
    
)
