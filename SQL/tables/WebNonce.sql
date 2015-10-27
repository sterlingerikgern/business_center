USE [Portal]
GO

/****** Object:  Table [dbo].[WebNonce]    Script Date: 10/25/2015 2:07:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[WebNonce](
	[jti] [varchar](255) NOT NULL CONSTRAINT [DF_WebNonces_jti]  DEFAULT (replace(newid(),'-','')),
	[UserID] [int] NOT NULL,
	[fingerprint] [varchar](1000) NOT NULL,
	[IssueDateTime] [datetime] NOT NULL DEFAULT (getdate()),
	[ExpirationDateTime] [datetime] NOT NULL DEFAULT (getdate()),
	[UsedDateTime] [datetime] NULL,
	[Active] [char](1) NOT NULL CONSTRAINT [DF_WebNonces_Active]  DEFAULT ('Y'),
 CONSTRAINT [PC_WebNonces] PRIMARY KEY CLUSTERED 
(
	[jti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Portal_Core]
) ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[WebNonce]  WITH CHECK ADD  CONSTRAINT [CK_WebNonces_Active] CHECK  (([Active]='Y' OR [Active]='N'))
GO

ALTER TABLE [dbo].[WebNonce] CHECK CONSTRAINT [CK_WebNonces_Active]
GO


