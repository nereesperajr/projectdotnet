IF NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Interment')
BEGIN	
	CREATE TABLE [dbo].[Interment](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[code] [nvarchar](100) NULL,
		[area] [nvarchar](100) NULL,
		[blk] [nvarchar](100) NULL,
		[lot] [nvarchar](100) NULL,
		[street] [nvarchar](max) NULL,
		[status] [nvarchar](100) NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


