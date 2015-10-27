<cfcomponent>
    <cfset this.name="v1">
    <cfset this.dsn="perkz">
    <cfset this.applicationTimeout= createTimespan(0,0,30,0) >
	<cfset this.javaSettings = {
		loadPaths: ['lib']
		, loadColdFusionClassPath: true
		, reloadOnChange: true
		, watchInterval: 1
	}>
		

		
    <cffunction name="onApplicationStart" output="false">
		<cfset var cfcs = structNew()>
		
		<cfset application.startTime = now()>
		<cfset application.appDir = getDirectoryFromPath(getCurrentTemplatePath()) />
		<cfset application.hostDomain = ".devperkz.biz">
		<cfset application.dsn="perkz">
		
	
		<cfset application.jsoup = createObject("java", "org.jsoup.Jsoup")>
		
		  
		<cfset application.mode = "production">
		
		<!--- Email configuration --->
		
		<cfset application.email = {
				server="smtp.sendgrid.net"
				,spoolMail=0
				,username="info@perkz.biz"
				,password="$terling2013"
			}>
 		
		<!--- Initialize services --->
	 	
		<cfinclude template="../../../perkz/model/services/act_initServices.cfm">
		<cfset application.cfcs = cfcs>
		
	</cffunction>
	
	
		
	 	
		
			
    <cffunction name="onRequestStart" output="false">
		
		<cfif IsDefined("url.reload")>
			<cfset onApplicationStart()>
			<cfset restInitApplication("#expandPath('/v1/')#", "v1")>
		</cfif>
		
		<cfset var qentityDetails = "">

	</cffunction>


	
</cfcomponent>