drop TABLE portal.[dbo].[Departments];
drop TABLE portal.[dbo].[WebAccessControlGroup];
drop TABLE portal.[dbo].[WebAccessControlUser];
drop TABLE portal.[dbo].[WebGroup];
drop TABLE portal.[dbo].[WebGroupUserXwalk];
drop TABLE portal.[dbo].[WebObject];
drop TABLE portal.[dbo].[WebSession];
drop TABLE portal.[dbo].[WebUser];
drop TABLE portal.[dbo].[WebUserTypes];
drop TABLE portal.[dbo].[WebView];
drop TABLE portal.[dbo].[WebViewObjectXwalk];

/**********************************************************/
/********************Create Tables*************************/
/**********************************************************/

CREATE TABLE portal.[dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[OldDepartmentID] [int] NULL
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


CREATE TABLE portal.[dbo].[WebAccessControlGroup](
	[groupACID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[active] [char](1) NOT NULL CONSTRAINT [DF_accessControlGroup_active]  DEFAULT ('Y')
) ON [Portal_Core];


CREATE TABLE portal.[dbo].[WebAccessControlUser](
	[userACID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[Permission] [char](1) NULL,
	[active] [char](1) NOT NULL
) ON [Portal_Core];


CREATE TABLE portal.[dbo].[WebGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](250) NULL,
	[DateLastUpdate] [datetime] NULL,
	[OldGroupID] [int] NULL,
 CONSTRAINT [PK_portal_groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


CREATE TABLE portal.[dbo].[WebGroupUserXwalk](
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_user_group_bus] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY];

CREATE TABLE portal.[dbo].[WebObject](
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
) ON [PRIMARY];






CREATE TABLE portal.[dbo].[WebView](
	[ViewID] [int] IDENTITY(1,1) NOT NULL,
	[viewName] [varchar](100) NULL,
	[viewDisplay] [varchar](400) NULL,
	[SortOrder] [int] NULL,
	[dateCreated] [datetime] NOT NULL,
	[dateUpdated] [datetime] NOT NULL,
	[Active] [char](1) NULL
) ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE portal.[dbo].[WebView] ADD  CONSTRAINT [DF_WebViews_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO

ALTER TABLE portal.[dbo].[WebView] ADD  CONSTRAINT [DF_WebViews_dateUpdated]  DEFAULT (getdate()) FOR [dateUpdated]
GO

ALTER TABLE portal.[dbo].[WebView] ADD  CONSTRAINT [DF_WebView_Active]  DEFAULT ('Y') FOR [Active]
GO





CREATE TABLE portal.[dbo].[WebViewObjectXwalk](
	[ViewObjectID] [int] IDENTITY(1,1) NOT NULL,
	[ViewID] [int] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[SortOrder] [int] NULL,
	[dateCreated] [datetime] NULL,
	[dateUpdated] [datetime] NULL,
	[Active] [char](1) NULL,
 CONSTRAINT [PK_WebViewObjectXwalk] PRIMARY KEY CLUSTERED 
(
	[ViewObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Portal_Core]
) ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE portal.[dbo].[WebViewObjectXwalk] ADD  CONSTRAINT [DF_WebViewObjectXwalk_Active]  DEFAULT ('Y') FOR [Active]
GO




CREATE TABLE portal.[dbo].[WebSession](
	[SessionToken] [varchar](255) NOT NULL CONSTRAINT [DF_WebSessions_SessionToken]  DEFAULT (replace(newid(),'-','')),
	[UserID] [int] NOT NULL,
	[LoginDateTime] [datetime] NOT NULL CONSTRAINT [DF_WebSessions_LoginDateTime]  DEFAULT (getdate()),
	[LastActionDateTime] [datetime] NOT NULL CONSTRAINT [DF_WebSessions_LastActionDateTime]  DEFAULT (getdate()),
	[SessionType] [varchar](20) NULL,
	[SessionACL] [varchar](max) NULL,
	[SessionPayload] [varchar](max) NULL,
	[PinnedHID] [varchar](255) NULL,
	[Active] [char](1) NOT NULL CONSTRAINT [DF_WebSessions_Active]  DEFAULT ('Y'),
 CONSTRAINT [PC_WebSessions] PRIMARY KEY CLUSTERED 
(
	[SessionToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Portal_Core]
) ON [Portal_Core] TEXTIMAGE_ON [Portal_Core]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE portal.[dbo].[WebSession]  WITH CHECK ADD  CONSTRAINT [CK_WebSessions_Active] CHECK  (([Active]='Y' OR [Active]='N'))
GO

ALTER TABLE portal.[dbo].[WebSession] CHECK CONSTRAINT [CK_WebSessions_Active]
GO



CREATE TABLE portal.[dbo].[WebUser](
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
) ON [Portal_Core];


CREATE TABLE portal.[dbo].[WebUserTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[OldTypeID] [int] NULL,
 CONSTRAINT [PK_webuser_types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


/**********************************************************/
/********************WebUser*******************************/
/**********************************************************/

drop table #holdkey;
drop table #holddups;
drop table #CleanMeUp;

SELECT sterlingUserID, count(*) as count
INTO #holdkey
FROM snap.[dbo].[portal_users]
GROUP BY sterlingUserID
HAVING count(*) > 1;

--select * from #holdKey;


SELECT DISTINCT snap.[dbo].[portal_users].userID,  snap.[dbo].[portal_users].sterlingUserID
INTO #holddups
FROM snap.[dbo].[portal_users], #holdkey
WHERE snap.[dbo].[portal_users].sterlingUserID = #holdkey.sterlingUserID;

select sterlingUserID, min(userID) as userID
INTO #CleanMeUp
 from #holddups
group by sterlingUserID;

--select userID from #CleanMeUp;

update snap.[dbo].[portal_users] 
set sterlinguserID = ''
 where userID IN (
select userID from #CleanMeUp
)

 

--update snap.[dbo].[portal_users] set sterlinguserID = '' where userID IN (2545,3256,734);
--update snap.[dbo].[portal_users] set sterlinguserID = '' where userID IN (4698,7742,4297);
--update snap.[dbo].[portal_users] set sterlinguserID = '' where sterlinguserID = 0;




--INSERT THE data


USE [Portal]
GO

INSERT INTO [portal].[dbo].[WebUser]
           ([UserID]
           ,[UserName]
           ,[Password]
		   ,[FirstName]
           ,[LastName]
           ,[EmailAddr]
           ,[Status]
           ,[CreatedDateTime]
           ,[LastLoginDateTime]
           ,[TempPasswordFlag]
           ,[Birthdate]
           ,[Addr1]
           ,[Addr2]
           ,[City]
           ,[State]
           ,[Zip]
           ,[AnniversaryDate]
           ,[CellPhoneNo]
           ,[CellPhoneCarrier]
           ,[CommPreference]
           ,[ReplFlag]
           ,[datelastupdate]
           ,[dayPhone]
           ,[website]
           ,[faxPhone]
           ,[companyName]
           ,[salesOfficeID]
           ,[fullname]
           ,[defaultPhone]
           ,[managerUserID]
           ,[empHandbookLastAck]
           ,[title]
           ,[dateWelcomeSent]
           ,[emailAddressPersonal]
           ,[personalAddrLine1]
           ,[personalAddrLine2]
           ,[personalCity]
           ,[personalState]
           ,[personalZip]
           ,[personalPhoneHome]
           ,[personalPhoneMobile]
           ,[personalPhoneMobileCarrier]
           ,[personalPhoneAlt]
           ,[personalEmrgContact]
           ,[personalEmrgPhone]
           ,[flags]
           ,[typeId]
           ,[dateLastLogin]
           ,[active]
           ,[perkzCode]
           ,[passwordHash]
           ,[passwordResetCode]
           ,[passwordResetCodeTimestamp]
           ,[passwordChangeOnLogin]
           ,[accountMigrated]
           ,[firstLogin]
           ,[logincount]
           ,[departmentId]
           ,[userPic]
           ,[oldSnapUserID]
		   )
     
     SELECT  [SterlingUserID]
			,[UserName]
			,''
			
			,left([firstName],20)
			,left([lastName],20)
			,left([emailAddress],255)
			,'s'
			,[dateCreated]
			,[dateLastLogin]
			,''
			,[birthdate]
			,left([addressLine1],50)
			,left([addressLine2],50)
			,left([city],50)
			,left([state],2)
			,left([zip],10)
			,[anniversary]
			,left([mobilePhone],12)
			,left([cellPhoneCarrier],20)
			,'g'
			,'g'
			,[datelastupdate]
			,left([dayPhone],500)
			,left([website],4000)
			,left([faxPhone],500)
			,left([companyName],500)
			,left([salesOfficeID],250)
			,left([fullname],2000)
			,left([defaultPhone],250)
			,[managerUserID]
			,[empHandbookLastAck]
			,[title]
			,[dateWelcomeSent]
			,[emailAddressPersonal]
			,[personalAddrLine1]
			,[personalAddrLine2]
			,[personalCity]
			,[personalState]
			,[personalZip]
			,[personalPhoneHome]
			,[personalPhoneMobile]
			,[personalPhoneMobileCarrier]
			,[personalPhoneAlt]
			,[personalEmrgContact]
			,[personalEmrgPhone]
			,[flags]
			,[typeId]
			,[dateLastLogin]
			,[active]
			,[perkzCode]
			,[passwordHash]
			,[passwordResetCode]
			,[passwordResetCodeTimestamp]
			,[passwordChangeOnLogin]
			,[accountMigrated]
			,[firstLogin]
			,[logincount]
			,[departmentId]
			,[userPic]
			,[userID]
			
  FROM [SNAP].[dbo].[portal_users]
  where SterlingUserID > 0
  ;

  UPDATE 	por
  SET		por.[Password] = CAST(sp.[Password] as Varchar(100))
  		    ,por.TempPasswordFlag = sp.TempPasswordFlag
  		    ,por.ReplFlag = sp.ReplFlag
  		    ,por.CommPreference = sp.CommPreference
  		    ,por.[status] = sp.[status]
  FROM		portal.dbo.WebUser as por
  			join spoonDMZ.dbo.WebUser as sp on sp.userID = por.userID;
  			
  			
  			
/**********************************************************/
/********************WebUserTypes**************************/
/**********************************************************/			
			
INSERT INTO [dbo].[WebUserTypes]
           ([TypeName]
           ,[OldTypeId])
SELECT 	[typeName]
		,[typeId]
FROM 	snap.[sterling].[portal_user_types];

UPDATE 	wu
SET		wu.typeId = wt.typeId
FROM		portal.dbo.WebUser as wu
		join portal.dbo.WebUserTypes as wt on wt.OldTypeId = wu.typeId;
		
  			
/**********************************************************/
/********************WebObjects****************************/
/**********************************************************/			

INSERT INTO portal.[dbo].[WebObject]
           ([ObjectName]
           ,[ObjectURL]
           ,[ObjectType]
           ,[ObjectTarget]
           ,[SortOrder]
           ,[HasAttachedDocs]
           ,[DateLastUpdate]
           ,[oldToolID]
           ,[oldParentToolID])
SELECT 
  [toolName]
  ,[toolURL]
  ,[toolType]
  ,[linkTarget]
  ,[toolSortOrder]
  ,[hasAttachedDocs]
  ,[dateLastUpdate]
  ,toolID
  ,[parentToolID]
FROM [SNAP].[sterling].[portal_tools];

INSERT INTO portal.[dbo].[WebObject]
	   ([oldParentToolID]
	   ,[ObjectName]
	   ,[ObjectType]
	   ,[oldFunctionID])
SELECT 
   [toolID]
  ,[functionName]
  ,'component'
  ,[functionID]
FROM [SNAP].[sterling].[portal_toolFunctions];

UPDATE 	wo
SET		wo.ParentObjectID = wo2.objectID
FROM		portal.dbo.WebObject as wo
		join portal.dbo.WebObject as wo2 on wo2.oldToolID = wo.oldParentToolID;
  			
  			
DECLARE @insertedParentWebObject table (objectID int);
		

INSERT INTO [dbo].[WebObject]([ObjectName],[ObjectType],[SortOrder],[DateLastUpdate])
OUTPUT INSERTED.ObjectID INTO @insertedParentWebObject
VALUES ('System','top-level',-1,getDate());

UPDATE 	portal.dbo.WebObject
SET parentObjectID = (select objectID from @insertedParentWebObject)
WHERE parentObjectID IS NULL and objectID != (select objectID from @insertedParentWebObject);
          
INSERT INTO [dbo].[WebObject]([ParentObjectID],[ObjectName],[ObjectType],[SortOrder],[DateLastUpdate])
VALUES (NULL, 'Merchant View','View',1,getDate());

INSERT INTO [dbo].[WebObject]([ParentObjectID],[ObjectName],[ObjectType],[SortOrder],[DateLastUpdate])
VALUES (NULL, 'B2B View','View',2,getDate());

INSERT INTO [dbo].[WebObject]([ParentObjectID],[ObjectName],[ObjectType],[SortOrder],[DateLastUpdate])
VALUES (NULL, 'Sales Partner View','View',3,getDate());

INSERT INTO [dbo].[WebObject]([ParentObjectID],[ObjectName],[ObjectType],[SortOrder],[DateLastUpdate])
VALUES (NULL, 'Sterling Staff View','View',4,getDate());

INSERT INTO [dbo].[WebObject]([ParentObjectID],[ObjectName],[ObjectType],[SortOrder],[DateLastUpdate])
VALUES (NULL, 'Account Settings','View',5,getDate());



  					
-- SETUP HIERARCHY OF WebObjects


DECLARE @ObjectID int, @hidLastChildID HIERARCHYID, @hidParentID HIERARCHYID;

/* Get System entity type */
update portal.dbo.WebObject 
set  ObjectHID= hierarchyid::GetRoot()
where objectName = 'System'
;


GO 

DECLARE @ObjectID int, @hidLastChildID HIERARCHYID, @hidParentID HIERARCHYID;


/* Get parent hierarchy node */ -- only for initial load
SELECT TOP 1 @hidParentID = ObjectHID FROM portal.dbo.WebObject where objectName = 'System' ;

/* Get last child hierarchy node from parent */
SELECT @hidLastChildID = MAX(ObjectHID) FROM portal.dbo.WebObject WHERE ObjectHID.GetAncestor(1) = @hidParentID;

DECLARE curAgent INSENSITIVE CURSOR
	FOR 
	
	WITH Hierarchy(ChildId, ChildName, Generation, ParentObjectID)
AS
(
    SELECT ObjectID, ObjectName, 0, ParentObjectID
        FROM portal.dbo.WebObject AS FirtGeneration
        WHERE ParentObjectID IS NULL        
    UNION ALL
    SELECT NextGeneration.ObjectID, NextGeneration.ObjectName, Parent.Generation + 1, Parent.ChildId
        FROM portal.dbo.WebObject AS NextGeneration
        INNER JOIN Hierarchy AS Parent ON NextGeneration.ParentObjectID = Parent.ChildId    
)
SELECT ChildID as ObjectID
    FROM Hierarchy
	order by Generation
    OPTION(MAXRECURSION 32767)
    

OPEN curAgent;

FETCH NEXT FROM curAgent INTO @ObjectID;

WHILE @@FETCH_STATUS = 0
BEGIN


	/* Get parent hierarchy node */ -- only for initial load
	SELECT @hidParentID = ObjectHID FROM portal.dbo.WebObject where ObjectID = (select parentObjectID from portal.dbo.WebObject where objectID = @ObjectID);

	/* Get last child hierarchy node from parent */
	SELECT @hidLastChildID = MAX(ObjectHID) FROM portal.dbo.WebObject WHERE ObjectHID.GetAncestor(1) = @hidParentID;


	update portal.dbo.WebObject 
	set [ObjectHID] =  @hidParentID.GetDescendant(@hidLastChildID, NULL)
	where objectID =   @ObjectID;

	FETCH NEXT FROM curAgent INTO @ObjectID;
END;

CLOSE curAgent;
DEALLOCATE curAgent;
GO 



UPDATE portal.dbo.WebObject
SET 	objectType = 'app'
WHERE	objectType = 'FW1';

GO


UPDATE portal.dbo.WebObject
SET 	objectType = 'tab'
WHERE	objectType = 'toolkit'
	and ObjectHID.GetLevel() = 2;



UPDATE portal.dbo.WebObject
SET 	objectType = 'subtab'
WHERE	objectType = 'toolkit'
	and ObjectHID.GetLevel() > 2;

GO




/**********************************************************/
/********************WebViews******************************/
/**********************************************************/	

DECLARE @insertedWebView table (ViewID int);
		

INSERT INTO [dbo].[WebView]([ViewName],[ViewDisplay],[SortOrder])
OUTPUT INSERTED.ViewID INTO @insertedWebView
VALUES ('merchantview','Merchant View',1);


INSERT INTO [dbo].[WebViewObjectXwalk]([ViewID],[ObjectID],[SortOrder])
VALUES ((select ViewID from @insertedWebView),(select ObjectID from dbo.WebObject where objectName = ''),1);


UPDATE 	portal.dbo.WebView
SET parentViewID = (select ViewID from @insertedWebView)
WHERE parentViewID IS NULL and ViewID != (select ViewID from @insertedWebView);
					
  	
  	
  	
  	
	
/**********************************************************/
/********************WebGroup******************************/
/**********************************************************/		


 
INSERT INTO portal.[dbo].[WebGroup]
   (OldGroupID
   ,[groupName]
   ,[dateLastUpdate])
SELECT 	groupID
		,[groupName]
		,[dateLastUpdate]
FROM 	[SNAP].[sterling].[portal_groups];

			
INSERT INTO portal.[dbo].[WebGroupUserXwalk]
	   ([UserID]
	   ,[GroupID]
	 )
SELECT 
  userID,
  GroupID
FROM [SNAP].[dbo].[user_group_bus];


UPDATE 	x
SET		x.userID = wu.userID
FROM		portal.dbo.WebGroupUserXwalk as x
		join portal.dbo.WebUser as wu on wu.OldSnapUserID = x.userID;
		
UPDATE 	x
SET		x.groupID = wg.groupID
FROM		portal.dbo.WebGroupUserXwalk as x
		join portal.dbo.WebGroup as wg on wg.OldGroupID = x.groupID;
  		
  		
  	  			
  					
/**********************************************************/
/***************WebAccessControlGroup**********************/
/**********************************************************/		

	
  		
	
INSERT INTO portal.[dbo].[WebAccessControlGroup]
	   ([GroupID]
	   ,[ObjectID]
	 )
SELECT 
  GroupID,
  FunctionID
FROM [SNAP].[dbo].[group_toolFunction_bus];		

		
UPDATE 	acg
SET		acg.GroupID = wg.GroupID
FROM		portal.dbo.WebAccessControlGroup as acg
		join portal.dbo.WebGroup as wg on wg.oldGroupID = acg.GroupID;			
					
UPDATE 	acg
SET		acg.ObjectID = wo.ObjectID
FROM		portal.dbo.WebAccessControlGroup as acg
		join portal.dbo.WebObject as wo on wo.oldFunctionID = acg.ObjectID;		
		
		
		
UPDATE 	ac
SET		ac.ObjectID = wo.parentObjectID
FROM		portal.dbo.[WebAccessControlGroup] as ac
		join portal.dbo.[WebObject] as wo on wo.objectID = ac.objectID and objectName IN ('use_tool', 'run_report');
			
			
delete from portal.dbo.[WebObject] 
WHERE objectName IN ('use_tool', 'run_report');  	  		
  	  			
  					
/**********************************************************/
/***************Department**********************/
/**********************************************************/		

	
  				
  			
INSERT INTO portal.[dbo].[Departments]
	   ([DepartmentName]
		,[oldDepartmentID])
 SELECT  [DepartmentName]
		 ,[DepartmentID]
FROM [SNAP].[dbo].[departments];

UPDATE 	wu
SET		wu.DepartmentID = dp.DepartmentID
FROM		portal.dbo.WebUser as wu
		join portal.dbo.Departments as dp on dp.OldDepartmentID = wu.DepartmentID;
			