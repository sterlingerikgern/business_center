/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [InvoiceID]
      ,[AccountNum]
      ,[ArchiveRefNum]
      ,[CaptureMethod]
      ,[CustomerName]
      ,[MerchantAcctNum]
      ,[PurchaseDate]
      ,[PurchaseTime]
      ,[InvoiceNum]
      ,[Amount]
      ,[OperatorName]
      ,[OperatorLocation]
      ,[DueDate]
      ,[RequestersName]
      ,[RequestersAddress]
      ,[RequestersCity]
      ,[RequestersState]
      ,[RequestersZip]
      ,[RequestersFaxNum]
      ,[SignedCopyInd]
      ,[CardID]
      ,[CreatedDate]
FROM [SpoonDMZ].[dbo].[Voyager_Spoon_Invoice] as i


 

select
Coalesce(CustomerName,'TOTAL') as CustomerName
, coalesce(cardid,NULL) as cardid
, coalesce(dueDate,NULL) as dueDate
, case GROUPING_ID(CustomerName, RequestersName, dueDate) 
  when 0 then RequestersName when 1 then 'CustomerName Total:' else 'Grand Total:' end as RequestersName, 
  count(amount) as NumOrders, sum(amount) as TotPrice
from [SpoonDMZ].[dbo].[Voyager_Spoon_Invoice]
GROUP BY GROUPING SETS ( (CustomerName, cardid, RequestersName, dueDate), ROLLUP (CustomerName));






select CustomerName, ArchiveRefNum, cardid, RequestersName, count(amount) as NumOrders, sum(amount) as TotPrice
from [SpoonDMZ].[dbo].[Voyager_Spoon_Invoice]
group by CustomerName,ArchiveRefNum, cardid, RequestersName with ROLLUP
having GROUPING(cardid)=GROUPING(RequestersName)
		and GROUPING(RequestersName) = GROUPING(ArchiveRefNum)
		
		
		set transaction isolation level read uncommitted
 
select count(*)

		
		
select Acct.MerID
		, Site.DbaName
		, Site.State
		, a.AuthDate
		, a.TermNo
		, a.CardNo
		, a.Amt as AuthAmt
		, a.CardType
		, a.TranType
		, a.EntryType
		, a.AuthResponseType
		, a.VoidCode
		, c.SettleDate as CaptureDate
		, c.Amt as CaptureAmt
		, NULL as SettleDate
  from CrAuth as a
  		join CrAuthInfo as ai
    			on ai.SettleDate = a.SettleDate
   				and ai.CrAuthID = a.CrAuthID
  		left join CrCaptInfo as ci
    			on ci.GUID = ai.GUID
  		left join CrCapt as c
    			on c.SettleDate = ci.SettleDate
   				and c.CrCaptID = ci.CrCaptID
  		join Acct on Acct.MerID = a.MerID
  		join Site on Site.SiteID = Acct.SiteID
  
  where a.SettleDate = '6/20/2015'
    and (a.TranType in ('S','F') or (a.TranType = 'A' and a.AuthResponseType = 'D'))
    and a.FrontEnd = 'PMTC'
    and (a.VoidCode is null or a.VoidCode = 'R')
    
  UNION
  
  
  select Acct.MerID
		, Site.DbaName
		, Site.State
		, a.AuthDate
		, a.TermNo
		, a.CardNo
		, a.Amt as AuthAmt
		, a.CardType
		, a.TranType
		, a.EntryType
		, a.AuthResponseType
		, a.VoidCode
		, c.SettleDate as CaptureDate
		, c.Amt as CaptureAmt
		, NULL as SettleDate
  from CrAuth as a
  		left join CrCapt as c
    			a.MerID = c.MerID
				and a.SettleDate = c.SettleDate
				and a.TraceNo = c.TraceNo
				and a.AuthTime = c.AuthTime
  		join Acct on Acct.MerID = a.MerID
  		join Site on Site.SiteID = Acct.SiteID
  
  where a.SettleDate = '6/20/2015'
    and (a.TranType in ('S','F') or (a.TranType = 'A' and a.AuthResponseType = 'D'))
    and a.FrontEnd = 'TSYS'
    and (a.VoidCode is null or a.VoidCode = 'R')
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    