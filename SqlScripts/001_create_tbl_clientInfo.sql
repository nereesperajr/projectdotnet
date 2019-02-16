IF NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'ClientInfo')
BEGIN	

CREATE TABLE [dbo].[ClientInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientName] [nvarchar](200) NULL,
	[cellNo] [nvarchar](100) NULL,
	[bday] [datetime] NULL,
	[address] [nvarchar](max) NULL,
	[regDate] [datetime] NULL,
	[is_deleted] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END 
GO


