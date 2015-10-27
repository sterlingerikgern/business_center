USE [Portal]
GO
/****** Object:  StoredProcedure [dbo].[proc_portal_login]    Script Date: 10/25/2015 2:03:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DROP PROCEDURE [dbo].[proc_portal_login]
*/

ALTER PROCEDURE [dbo].[proc_portal_login]
@token varchar(2000) = NULL,
@arguments varchar(MAX)


AS
BEGIN

--PARSE@Arguments JSON into a table
DECLARE @args Hierarchy
INSERT INTO @args
select * from parseJSON(@arguments)

declare @UserID int
declare @userID_return int
declare @currentDate datetime
declare @username varchar(200)
declare @password varchar(100)
declare @fingerprint varchar(1000)
declare @jti varchar(500)
declare @WebNonceJTITable table (jti varchar(500))
declare @sessionACL varchar(max)




-- check username and password match
select	@password =  (select StringValue from @args where name='password')
		,@username = (select StringValue from @args where name='username')
		,@fingerprint = (select StringValue from @args where name='fingerprint');






select  @UserID = UserID 
		,@currentDate = getDate()
from 	Portal.dbo.WebUser 
where 	UserName = @username 
		and cast([Password] as binary(20)) = hashbytes('SHA1','$j2'+ @password +'Q{8') 
		and Upper(Status) = 'OPEN';
		


EXEC @userID_return = dbo.proc_private_nonce	
	 @fingerprint= @fingerprint
	,@userID = @UserID
	,@actions = 'issue';


if IsNull(@UserID, '') != '' AND @userID_return > 0
	begin  

	-- Resultset 2:  User Info
	select 	@UserID as userID
			,FirstName 
			,LastName 
			,EmailAddr
			,LastLoginDateTime      
	from 	Portal.dbo.WebUser 
	where 	userID = @UserID ;


	update 	Portal.dbo.WebUser 
	set 	LastLoginDateTime = getDate()
	where 	userID = @UserID ;
	

	end
else 
	begin

	select '403' AS ErrorCode,'Invalid username/password combination'  AS ErrorMessage;

	end
END





