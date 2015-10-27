


	<cfstoredproc datasource="perkz" procedure="proc_Perkz_API_purchase">
		<cfprocresult name="purchase"  > 
		<cfprocparam cfsqltype="cf_sql_varchar" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK"><!--- authToken --->
		<cfprocparam cfsqltype="cf_sql_varchar" value="2222222223"><!--- phonenumber --->
		<cfprocparam cfsqltype="cf_sql_varchar" null="true"><!--- phonenumber countrycode --->
		<cfprocparam cfsqltype="cf_sql_varchar" value="5"><!--- transactionID --->
		<cfprocparam cfsqltype="cf_sql_varchar" value="4"><!--- transactionPoints --->
		<cfprocparam cfsqltype="cf_sql_varchar" value="7.89"><!--- transactionAmount --->
		<cfprocparam cfsqltype="cf_sql_varchar" value="2014/02/14 11:23:37"><!--- transactionDateTime --->
	</cfstoredproc>
				
	<cfdump var="#purchase#" abort>								
		
			
			
			<h1>Record a purchase  transaction</h1>

<cfhttp 
    url="http://api.devperkz.biz/rest/purchase/9048061289.json" 
    method="POST" 
    result="res"> 
	<cfhttpparam name="transactionID" value="7" type="formfield" />
	<cfhttpparam name="transactionAmount" value="12.34" type="formfield" />
	<cfhttpparam name="transactionDateTime" value="2014-02-14 11:23:37" type="formfield" />
	<cfhttpparam name="points" value="4" type="formfield" />
	<cfhttpparam name="authorization" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK" type="header" />

</cfhttp>
<cfdump var = "#res#" abort>




	<cfstoredproc datasource="perkz" procedure="proc_Perkz_API_redeem">
				<cfprocresult name="redeem"  > 
				<cfprocparam cfsqltype="cf_sql_varchar" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK"><!--- authToken --->
				<cfprocparam cfsqltype="cf_sql_varchar" value="7276568584"><!--- phonenumber --->
				<cfprocparam cfsqltype="cf_sql_varchar" null="true"><!--- phonenumber countrycode --->
				<cfprocparam cfsqltype="cf_sql_varchar" value="123345345345354354353fsa"><!--- transactionID --->
				<cfprocparam cfsqltype="cf_sql_varchar" value="8359"><!--- couponID --->
				<cfprocparam cfsqltype="cf_sql_timestamp" value="#now()#"><!--- transactionDateTime --->
				<cfprocparam cfsqltype="cf_sql_varchar" value="what"><!--- promoDesc --->
			</cfstoredproc>
			
<!---
<cfset  redeem = application.cfcs["perkz_api"].redeem(
									authToken="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK"
									,phoneNumber="7276568584"
									,transactionID="123345345345354354353fsa"
									,promoDesc="what"
									,couponID="8359"
									,transactionDateTime="#DateFormat(now(), "YYYY-MM-DD HH:MM:SS")#")>
									
	--->								
	<cfdump var="#redeem#">								
									
<h1>Redeem a Coupon</h1>
<cfhttp 
    url="http://api.devperkz.biz/rest/redeem/7276568584.json" 
    method="POST" 
    result="res"> 
	<cfhttpparam name="couponID" value="8359" type="formfield" />
	<cfhttpparam name="transactionID" value="987654321" type="formfield" />
	<cfhttpparam name="transactionDateTime" value="#now()#" type="formfield" />
	<cfhttpparam name="PromoDesc" value="11111111" type="formfield" />
	<cfhttpparam name="authorization" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK" type="header" />

</cfhttp>
<cfdump var = "#res#" abort>











<h1>Get Coupons</h1>
<cfhttp 
    url="http://api.devperkz.biz/rest/coupons/9048061289.json" 
    method="GET" 
    result="res"> 

	<cfhttpparam name="authorization" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK" type="header" />
</cfhttp>
<cfdump var = "#res#">


<h1>Get Balance</h1>
<cfhttp 
    url="http://api.devperkz.biz/rest/balance/9048061289.json" 
    method="GET" 
    result="res"> 
 
	<cfhttpparam name="authorization" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK" type="header" />
</cfhttp>
<cfdump var = "#res#">


<h1>Redeem a Coupon</h1>
<cfhttp 
    url="http://api.devperkz.biz/rest/redeem/9048061289.json" 
    method="POST" 
    result="res"> 
	<cfhttpparam name="couponID" value="7962" type="formfield" />
	<cfhttpparam name="transactionID" value="987654321" type="formfield" />
	<cfhttpparam name="transactionDateTime" value="#now()#" type="formfield" />
	<cfhttpparam name="PromoPLU" value="11111111" type="formfield" />
	<cfhttpparam name="authorization" value="NChVQzdGN0NMLktLWSImRkdFNVpZTUtRLSsmQCAK" type="header" />

</cfhttp>
<cfdump var = "#res#">
