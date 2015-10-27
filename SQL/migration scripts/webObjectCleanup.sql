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