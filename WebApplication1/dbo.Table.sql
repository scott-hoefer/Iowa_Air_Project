CREATE TABLE [dbo].[Table]
(
	[accountNumber] INT NOT NULL PRIMARY KEY, 
    [username] NCHAR(10) NULL, 
	[email address] NCHAR(10) NULL,
    [password] NCHAR(10) NULL, 
    [account type] NCHAR(10) NULL DEFAULT user, 
    [confirmed] BIT NULL DEFAULT 0, 
    
)
