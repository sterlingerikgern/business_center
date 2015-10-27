USE [Portal]
GO

/****** Object:  Table [dbo].[WebUser]    Script Date: 10/25/2015 2:07:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[WebUser](
	[UserID] [int] NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[EmailAddr] [varchar](255) NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[LastLoginDateTime] [datetime] NULL,
	[TempPasswordFlag] [char](1) NOT NULL CONSTRAINT [DF_SrWebUser_TempPasswordFlag]  DEFAULT ('N'),
	[Birthdate] [datetime] NULL,
	[Addr1] [varchar](50) NULL,
	[Addr2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[Zip] [varchar](10) NULL,
	[AnniversaryDate] [datetime] NULL,
	[CellPhoneNo] [char](12) NULL,
	[CellPhoneCarrier] [varchar](20) NULL,
	[CommPreference] [varchar](5) NULL,
	[ReplFlag] [char](1) NOT NULL CONSTRAINT [DF_WebUser_ReplFlag]  DEFAULT ('Y'),
	[datelastupdate] [datetime] NULL,
	[dayPhone] [varchar](500) NULL,
	[website] [varchar](4000) NULL,
	[faxPhone] [varchar](500) NULL,
	[companyName] [varchar](500) NULL,
	[salesOfficeID] [varchar](250) NULL,
	[fullname] [varchar](2000) NULL,
	[defaultPhone] [varchar](250) NULL,
	[managerUserID] [int] NULL,
	[empHandbookLastAck] [datetime] NULL,
	[title] [varchar](1500) NULL,
	[dateWelcomeSent] [datetime] NULL,
	[emailAddressPersonal] [varchar](1000) NULL,
	[personalAddrLine1] [varchar](500) NULL,
	[personalAddrLine2] [varchar](500) NULL,
	[personalCity] [varchar](200) NULL,
	[personalState] [varchar](50) NULL,
	[personalZip] [varchar](50) NULL,
	[personalPhoneHome] [varchar](50) NULL,
	[personalPhoneMobile] [varchar](50) NULL,
	[personalPhoneMobileCarrier] [varchar](50) NULL,
	[personalPhoneAlt] [varchar](50) NULL,
	[personalEmrgContact] [varchar](500) NULL,
	[personalEmrgPhone] [varchar](50) NULL,
	[flags] [varchar](1000) NULL CONSTRAINT [DF_portal_users_flagTravelTeam]  DEFAULT ((0)),
	[typeId] [int] NULL,
	[dateLastLogin] [datetime] NULL,
	[active] [bit] NOT NULL CONSTRAINT [DF_portal_users_active]  DEFAULT ((1)),
	[perkzCode] [varchar](35) NULL,
	[passwordHash] [varchar](128) NULL,
	[passwordResetCode] [varchar](35) NULL,
	[passwordResetCodeTimestamp] [datetime] NULL,
	[passwordChangeOnLogin] [bit] NOT NULL CONSTRAINT [DF_portal_users_passwordChangeOnLogin]  DEFAULT ((0)),
	[accountMigrated] [bit] NOT NULL CONSTRAINT [DF_portal_users_accountMigrated]  DEFAULT ((1)),
	[firstLogin] [bit] NOT NULL CONSTRAINT [DF_portal_users_firstLogin]  DEFAULT ((1)),
	[logincount] [int] NOT NULL DEFAULT ((0)),
	[departmentId] [int] NULL,
	[userPic] [varchar](60) NULL,
	[oldSnapUserID] [int] NULL,
 CONSTRAINT [PC_WebUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [Portal_Core]
) ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO

