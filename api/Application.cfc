<cfcomponent>
    <cfset this.name="bc">
    <cfset this.dsn="bc">
    <cfset this.applicationTimeout= createTimespan(0,0,30,0) >
    
 

		
    <cffunction name="onApplicationStart" output="false">
		<cfset var cfcs = structNew()>
		
		<cfset application.startTime = now()>
		<cfset application.appDir = getDirectoryFromPath(getCurrentTemplatePath()) />
		<cfset application.hostDomain = ".webqa.sterlingpayment.com">
		<cfset application.dsn="portal">
		<cfset application.dsn_spoon="spoon">
		<cfset application.validationRequirements = "">

		<cfset application.mode = "production">
		
		<!--- Email configuration --->
		<cfset application.email = {
				server="smtp.sendgrid.net"
				,spoolMail=0
				,username="info@perkz.biz"
				,password="$terling2013"
			}>
 		
		<!--- Initialize services --->
	 	
		<cfinclude template="model/services/act_initServices.cfm">
		<cfset application.cfcs = cfcs>
		
		<cfset restInitApplication("#expandPath('/')#","BC")>
		
	</cffunction>
	
	
	<cffunction name="onRequestStart">
		
		

		<cfif IsDefined("url.reload")>
			<cflock name="reloadApp" timeout="60" type="exclusive"> <!--- Create an exclusive lock to make this call thread safe --->
				<cfset onApplicationStart()>
			 </cflock>
		</cfif>
		
	    
	 
		
	</cffunction>
	 	
		


	
</cfcomponent>