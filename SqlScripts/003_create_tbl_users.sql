IF NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Users')
BEGIN
	CREATE TABLE [dbo].[Users](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[userid] [nvarchar](max) NULL,
		[fullname] [nvarchar](max) NULL,
		[contactno] [nvarchar](50) NULL,
		[password] [nvarchar](max) NULL,
		[is_active] [int] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


