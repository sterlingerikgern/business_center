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
  

  UPDATE 	por
  SET		por.[Password] = CAST(sp.[Password] as Varchar(100))
  		    ,por.TempPasswordFlag = sp.TempPasswordFlag
  		    ,por.ReplFlag = sp.ReplFlag
  		    ,por.CommPreference = sp.CommPreference
  		    ,por.[status] = sp.[status]
  FROM		portal.dbo.WebUser as por
  			join spoonDMZ.dbo.WebUser as sp on sp.userID = por.userID
			