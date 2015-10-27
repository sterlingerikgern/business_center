<cfcomponent output="false" hint="Programs DAO">
	

	<cfset variables.dsn = "">
	<cfset variables.recursion = "">
	
	
	<cffunction name="init" output="false">
		<cfargument name="dsn" required="true" type="string">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>	
	</cffunction>
	

	
	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfargument name="f" type="string" required="false" default="">
		<cfargument name="a" type="string" required="false" default="">
		<cfargument name="token" type="any" required="false" default="">
		
			<cfset var errors = arrayNew(1)>
			<cfset var args = DeserializeJSON(a)>
			<cfset var validations = "">
			<cfset var validationType = "any">
			<cfset var i = "">	
			<cfset var parameter = "">	
			<cfset var parameterValue = "">	
			<cfset var parameterMin = "0">	
			<cfset var parameterMax = "1000000000000">	
			<cfset var parameterMaxLength = "">
			<cfset var parameterMinLength = "">	
			<cfset var parameterMessage = "Invalid data.">	

		
			
			<cfif NOT IsStruct(application.validationRequirements)>
				<cfset application.validationRequirements = loadRequirements()>
			</cfif>	
			
		
			<cfif StructKeyExists(application.validationRequirements, f)>	
				<cfset validations = StructFind(application.validationRequirements, f)>
				
				
			
				
				<cfloop from="1" to="#arrayLen(validations)#" index="i">
					
					
			
					<cfset validationType = validations[i].type>
					<cfset isRequired = false>
					<cfset parameter = validations[i].parameter>
					<cfset parameterValue = "" >
					<cfset parameterMaxLength = "">	
					<cfset parameterMinLength = "">	
					<cfset paramterErrorcode = "-1">	
					<cfset parameterMessage = "Invalid data.">
					
					<cfif StructKeyExists(args, parameter)>
						<cfset parameterValue = args[parameter] >
					</cfif>
					
					<cfif parameter IS "token">
						<cfset parameterValue = arguments.token >
					</cfif>
			
					<cfif StructKeyExists(validations[i], 'required')>
						<cfset isRequired = validations[i].required>
					</cfif>
					
					<cfif StructKeyExists(validations[i], 'min')>
						<cfset parameterMin = validations[i].min>
					</cfif>
					
					<cfif StructKeyExists(validations[i], 'max')>
						<cfset parameterMax = validations[i].max>
					</cfif>
					
					<cfif StructKeyExists(validations[i], 'maxlength')>
						<cfset parameterMaxLength = validations[i].maxlength>
					</cfif>
					
					
					<cfif StructKeyExists(validations[i], 'minlength')>
						<cfset parameterMinLength = validations[i].minlength>
					</cfif>
					
					<cfif StructKeyExists(validations[i], 'message')>
						<cfset parameterMessage = validations[i].message>
					</cfif>
					
					<cfif StructKeyExists(validations[i], 'errorcode')>
						<cfset paramterErrorcode = validations[i].errorcode>
					</cfif>
					
					
					
					<cfswitch expression="#validationType#">
						
						<cfcase value="password">
							<cfif parameterValue IS NOT "" AND NOT
								( len(parameterValue) GTE 6
								AND refind('[A-Z]',parameterValue)
								AND refind('[a-z]',parameterValue)
								AND refind('[0-9]',parameterValue)
								AND refind('[!@##$&*]',parameterValue)
								 )>
								<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
								<cfcontinue>
							</cfif>
							
							<!---
							Passwords must contain at least one capital letter, one lowercase letter, one number and 1 special character (!@##$&*) and by at least at characters in length.
							--->
						</cfcase>
						
						
						<cfcase value="jwt">
						
							<cfif  (isRequired AND parameterValue IS "")  OR ( parameterValue IS NOT "" AND NOT application.cfcs["jwt"].verify(parameterValue) )>
								<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
								<cfcontinue>
							</cfif>
							
						</cfcase>
						
						
						<cfcase value="guid">
							<cfif parameterValue IS NOT "" AND (len(parameterValue) NEQ 32 OR REFind("[^[:xdigit:]]", parameterValue) GT 0)>
								<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
								<cfcontinue>
							</cfif>
						</cfcase>
						
						<cfcase value="range">
							<cfif parameterValue IS NOT "" AND NOT IsValid("range", parameterValue, parameterMin, parameterMax)>
								<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
								<cfcontinue>
							</cfif>
						</cfcase>
						
						<cfdefaultcase>
							<cfif parameterValue IS NOT "" AND NOT IsValid("#validationType#", parameterValue)>
								<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#","errorcode" = "#paramterErrorcode#"})>
								<cfcontinue>
							</cfif>
						</cfdefaultcase>
							
					</cfswitch>
					
					<cfif isRequired && parameterValue IS "">
						<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
						<cfcontinue>
					</cfif>
					
					<cfif parameterMinLength IS NOT "" && len(parameterValue) LT parameterMinLength>
						<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
						<cfcontinue>
					</cfif>	
					
					<cfif parameterMaxLength IS NOT "" && len(parameterValue) GT parameterMaxLength>
						<cfset arrayAppend(errors, {"parameter" = "#parameter#", "ErrorMessage" = "#parameterMessage#","errorcode" = "#paramterErrorcode#"})>
					</cfif>	
				
					
				</cfloop>
			
			</cfif> <!--- StructKeyExists() --->
			
			
		<cfreturn errors>
	</cffunction>
	
	
	
		
		
	<cffunction name="loadRequirements" access="private" returntype="struct" output="false">
		<cfset var validationRequirements = "">
		<cfset var validationRequirementsStruct = "">
		
		<cffile action="read"  file="#expandPath('model/services/validationRequirements.json')#" variable="validationRequirements">
		
		<cfset validationRequirementsStruct = DeserializeJSON(validationRequirements)>
		
		<cfreturn validationRequirementsStruct>
		
	</cffunction>
	


    
    

	
	
</cfcomponent>