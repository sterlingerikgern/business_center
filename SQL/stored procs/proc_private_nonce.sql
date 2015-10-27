USE [Portal]
GO
/****** Object:  StoredProcedure [dbo].[proc_private_nonce]    Script Date: 10/25/2015 2:02:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
drop  PROCEDURE [dbo].[proc_private_nonce]
*/
ALTER PROCEDURE [dbo].[proc_private_nonce]
 @token varchar(MAX) = null
,@fingerprint varchar(1000)
,@userID int = 0
,@actions varchar(1000) = ''

AS
BEGIN

declare @inc_token varchar(MAX)
declare @iat datetime
declare @exp datetime
declare @usedDateTime datetime
declare @sub varchar(500)
declare @jti varchar(500)
declare @jti_original varchar(500)
declare @WebNonceJTITable table (jti varchar(500))
declare @token_userid int
declare @prior_fingerprint varchar(1000) = ''
declare @sessionSecondsToLive int = 1200

if CHARINDEX('use',@actions) > 0
	begin
	
		if IsNull(@token, '') = ''
			select @inc_token = '{}';
		else 
			select @inc_token = @token;

		--PARSE@token JSON into a table
		DECLARE @tokenItems Hierarchy
		INSERT INTO @tokenItems
		select * from parseJSON(@inc_token)

		select	@exp =  (select StringValue from @tokenItems where name='exp')
				,@iat = (select StringValue from @tokenItems where name='iat')
				,@sub = (select StringValue from @tokenItems where name='sub')
				,@token_userid = (select StringValue from @tokenItems where name='userid')
				,@jti = (select StringValue from @tokenItems where name='jti')
				,@jti_original = (select StringValue from @tokenItems where name='jti')
				;


		select  @usedDateTime = usedDateTime
				,@prior_fingerprint = fingerprint
				from 	Portal.dbo.WebNonce 
				where 	userID = @token_userid
						and fingerprint = @fingerprint
						and jti = @jti;
		
			if IsNull(@token, '') = ''
				begin
					select '498' AS ErrorCode,'Token is missing and is requried.'  AS ErrorMessage;
					select @userID = 0;
				end

			else if IsNull(@usedDateTime, '') != ''
				begin
					select '498' AS ErrorCode,'Invalid JTI - Already used.'  AS ErrorMessage;
					select @userID = 0;
				end
	
			 else if cast(@exp AS datetime) < getDate()
				begin
					select '498' AS ErrorCode,'Invalid JTI - Token has expired.'  AS ErrorMessage;
					select @userID = 0
				end
			 
			 else if @prior_fingerprint != @fingerprint
				begin
					select '498' AS ErrorCode,'Invalid JTI - Browser mismatch.'  AS ErrorMessage;
					select @userID = 0
				end
		
			
			update 	Portal.dbo.WebNonce 
			set		usedDateTime = getDate()
					,active='N'
			where 	userID = @token_userid
					and jti = @jti_original;
			
			select @userID = @token_userid;
			
		
	end  -- action='use'



if CharIndex('issue', @actions) > 0 and @userID > 0
	begin


		--  issue a new JTI
		insert into Portal.dbo.WebNonce (
			 UserID
			,fingerprint
			,ExpirationDateTime
			,Active
		) output inserted.jti into  @WebNonceJTITable
		select @UserID
			   ,@fingerprint
			   ,DATEADD(SECOND,@sessionSecondsToLive, getDate())
			   ,'Y';

		-- set the @jti variable
		select @jti = jti from @WebNonceJTITable;

		-- Resultset 1:  Token Info
		select 	 n.jti
				,n.issueDateTime as iat
				,n.ExpirationDateTime as exp
				,n.userid
				,u.username as sub
				,u.firstName
				,u.lastName 
		from 	Portal.dbo.WebNonce n
				left join portal.dbo.WebUser u on u.userid = n.userID
		where 	n.userID = @UserID
				and n.jti = @jti ;


	end  -- action='issue'



	return @userID;
		
END





