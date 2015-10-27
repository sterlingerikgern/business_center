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
    			on (c.SettleDate = ci.SettleDate
   				and c.CrCaptID = ci.CrCaptID)
   				
   				--Do ORs in Joins work???
   				or (
					a.MerID = c.MerID
					and a.SettleDate = c.SettleDate
					and a.TraceNo = c.TraceNo
					and a.AuthTime = c.AuthTime
   				)
   				
  		join Acct on Acct.MerID = a.MerID
  		join Site on Site.SiteID = Acct.SiteID
  
  where a.SettleDate = '6/20/2015'
    and (a.TranType in ('S','F') or (a.TranType = 'A' and a.AuthResponseType = 'D'))
    --and a.FrontEnd = 'PMTC'
    and (a.VoidCode is null or a.VoidCode = 'R')