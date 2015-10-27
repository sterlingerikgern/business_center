USE [Portal]
GO

/****** Object:  Table [dbo].[WebAccessControlGroup]    Script Date: 10/25/2015 2:06:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[WebAccessControlGroup](
	[groupACID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[active] [char](1) NOT NULL CONSTRAINT [DF_accessControlGroup_active]  DEFAULT ('Y')
) ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO


