USE [Portal]
GO

/****** Object:  Table [dbo].[WebAccessControlUser]    Script Date: 10/25/2015 2:06:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[WebAccessControlUser](
	[userACID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[Permission] [char](1) NULL,
	[active] [char](1) NOT NULL
) ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO


