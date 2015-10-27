USE [Portal]
GO

/****** Object:  Table [dbo].[WebObject]    Script Date: 10/25/2015 2:07:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[WebObject](
	[ObjectID] [int] IDENTITY(1,1) NOT NULL,
	[ParentObjectID] [int] NULL,
	[ObjectHID] [hierarchyid] NULL,
	[ObjectName] [varchar](400) NULL,
	[ObjectURL] [varchar](3000) NULL,
	[ObjectType] [varchar](20) NULL,
	[ObjectTarget] [varchar](100) NULL,
	[SortOrder] [int] NULL,
	[HasAttachedDocs] [bit] NULL,
	[DateLastUpdate] [datetime] NULL,
	[oldToolID] [int] NULL,
	[oldFunctionID] [int] NULL,
	[oldParentToolID] [int] NULL,
 CONSTRAINT [PK_WebObject] PRIMARY KEY CLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

