
 
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