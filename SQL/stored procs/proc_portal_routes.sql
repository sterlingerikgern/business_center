USE [Portal]
GO
/****** Object:  StoredProcedure [dbo].[proc_portal_routes]    Script Date: 10/25/2015 2:03:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
DROP PROCEDURE [dbo].[proc_portal_routes]
*/

ALTER PROCEDURE [dbo].[proc_portal_routes]
@token varchar(MAX) = null,
@arguments varchar(MAX) = null


AS
BEGIN


declare @UserID int
declare @fingerprint varchar(1000)


--PARSE@Arguments JSON into a table
DECLARE @args Hierarchy
INSERT INTO @args
select * from parseJSON(@arguments)

select	@fingerprint = (select StringValue from @args where name='fingerprint');

EXEC @userID = dbo.proc_private_nonce	
	 @fingerprint= @fingerprint
	,@token = @token
	,@actions = 'use,issue';

	IF IsNull(@userID, 0) > 0
		BEGIN
	
			--return ACL
	
			SELECT [ObjectID]
			  ,[ParentObjectID]
			  ,[ObjectName]
			  ,[ObjectURL]
			  ,[ObjectType]
			  ,[ObjectTarget]
			  ,[SortOrder]
			  ,[HasAttachedDocs]
			  ,[DateLastUpdate]
			  ,[oldToolID]
			  ,[oldFunctionID]
			  ,[oldParentToolID]
		  FROM [Portal].[dbo].[WebObject]

		END
	ELSE
		BEGIN
			select @userID as userid;
		END

END;








