<cfcomponent rest="true" restpath="bc_connect">

		<cffunction name="getCatch" access="remote" httpmethod="GET" restpath="" returntype="any">
					<cfset resultObj.ErrorCode = "r000">
					<cfset resultObj.Message = "Method not allowed.">
			<cfreturn resultObj>
		</cffunction>  



		 


    <cffunction restpath="" httpMethod="POST" consumes="application/x-www-form-urlencoded" name="form_auth_user" access="remote" returnType="any">
       
				<cfargument name="f" required="false" restargsource="Form" type="string" default=""/>
				<cfargument name="a" required="false" restargsource="Form" type="string" default=""/>
				<cfargument name="r" required="false" restargsource="Form" type="string" default=""/>
				<cfargument name="token" required="false"  restargsource="header" type="string" default=""/>

		
				
       			<cfset var resultObj = fn_connect(arguments.f, arguments.a, arguments.token, arguments.r)>
				<cfset var results = "">
        		
        		<cfif IsArray(resultObj.token) AND StructKeyExists(resultObj.token[1], "errorMessage")>
        			<cfthrow type="RestError" message="#resultObj.token[1].ErrorMessage#" errorcode="#resultObj.token[1].errorCode#">
        		</cfif>
        		
				<cfif IsDefined("resultObj.token.errorcode")>
        			<cfthrow type="RestError" message="#resultObj.token.ErrorMessage#" errorcode="#resultObj.token.errorCode#">
        		</cfif>
        		

        		
        		<cfset results = resultObj>
        		<cfif IsDefined("resultObj.token")>
					<cfset var new_token = application.cfcs["jwt"].encode(resultObj.token)>
					<cfset results.token = new_token>
				</cfif>				
			
        <cfreturn results>
    
    </cffunction>  
    

    <cffunction restpath="" httpMethod="POST" consumes="application/json" name="json_auth_user" access="remote" returnType="any">
				<cfargument name="body" />       
				<cfargument name="token" required="false"  restargsource="header" type="string" default=""/>

				<cfparam name="arguments.body.f" default="">
				<cfparam name="arguments.body.a" default="">
				<cfparam name="arguments.body.r" default="">
				
			
        		<cfset var resultObj = fn_connect(arguments.body.f, arguments.body.a, arguments.token, arguments.body.r)> 
        		<cfset var results = "">


				<cfif IsArray(resultObj.token) AND StructKeyExists(resultObj.token[1], "errorMessage")>
        			<cfthrow type="RestError" message="#resultObj.token[1].ErrorMessage#" errorcode="#resultObj.token[1].errorCode#">
        		</cfif>
        		
        		
				<cfif IsDefined("resultObj.token.errorcode")>
        			<cfthrow type="RestError" message="#resultObj.token.ErrorMessage#" errorcode="#resultObj.token.errorCode#">
        		</cfif>
        		
        		
        		
        	
        		<cfset results = resultObj>
        		<cfif IsDefined("resultObj.token")>
					<cfset var new_token = application.cfcs["jwt"].encode(resultObj.token)>
					<cfset results.token = new_token>
				</cfif>		
        		
        <cfreturn results>
    </cffunction> 
    

	<cffunction name="fn_connect" access="private" returnType="struct">      
		<cfargument name="f" required="true"  type="string" default=""/>
		<cfargument name="a" required="true"  type="string" default=""/>
		<cfargument name="token" required="false" type="any" default=""/>
		<cfargument name="resultType" required="false" type="string" default="query"/>

			<cfset var resultObj = structNew()>
			<cfset var RT = "">
			<cfset var R1 = "">
			<cfset var R2 = "">
			<cfset var R3 = "">
			<cfset var R4 = "">
			<cfset var R5 = "">
			<cfset var R6 = "">
			<cfset var R7 = "">
			<cfset var R8 = "">
			<cfset var R9 = "">
			<cfset var R10 = "">
			<cfset var a_token = "">
			<cfset var b_token = "">
			<cfset var masked_args = "#fn_maskCreditCards(arguments.a)#">
			
			<cfset errors = application.cfcs["bc_validation"].validate(f=f,a=a,token=token)>

			
			<cfif arraylen(errors)>
				<cfset resultObj.token = errors>
			<cfelse>
			
			
				<cfif arguments.token IS NOT "">
					<cfset b_token = application.cfcs["jwt"].decode(arguments.token)>
					<cfset a_token = SerializeJson(b_token[1])>
				</cfif>
			

			
				<cfstoredproc datasource="#application.dsn#" procedure="proc_portal_#arguments.f#">
					<cfprocparam cfsqltype="cf_sql_varchar" value="#a_token#"> <!--- token --->
					<cfprocparam cfsqltype="cf_sql_varchar" value="#masked_args#"> <!--- arguments --->
					<cfprocresult name="RT" resultset="1">
					<cfprocresult name="R1" resultset="2">
					<cfprocresult name="R2" resultset="3">
					<cfprocresult name="R3" resultset="4">
					<cfprocresult name="R4" resultset="5">
					<cfprocresult name="R5" resultset="6">
					<cfprocresult name="R6" resultset="7">
					<cfprocresult name="R7" resultset="8">
					<cfprocresult name="R8" resultset="9">
					<cfprocresult name="R9" resultset="10">
					<cfprocresult name="R10" resultset="11">
				</cfstoredproc>
			
			
				
				<cfif IsQuery(RT)><cfset resultObj.token = fn_convert2Array(RT)></cfif>
				<cfif IsQuery(R1)><cfif arguments.resultType IS "kvp"><cfset resultObj.R1 = fn_convert2Array(R1)><cfelse><cfset resultObj.R1 = R1></cfif></cfif>
				<cfif IsQuery(R2)><cfif arguments.resultType IS "kvp"><cfset resultObj.R2 = fn_convert2Array(R2)><cfelse><cfset resultObj.R2 = R2></cfif></cfif>
				<cfif IsQuery(R3)><cfif arguments.resultType IS "kvp"><cfset resultObj.R3 = fn_convert2Array(R3)><cfelse><cfset resultObj.R3 = R3></cfif></cfif>
				<cfif IsQuery(R4)><cfif arguments.resultType IS "kvp"><cfset resultObj.R4 = fn_convert2Array(R4)><cfelse><cfset resultObj.R4 = R4></cfif></cfif>
				<cfif IsQuery(R5)><cfif arguments.resultType IS "kvp"><cfset resultObj.R5 = fn_convert2Array(R5)><cfelse><cfset resultObj.R5 = R5></cfif></cfif>
				<cfif IsQuery(R6)><cfif arguments.resultType IS "kvp"><cfset resultObj.R6 = fn_convert2Array(R6)><cfelse><cfset resultObj.R6 = R6></cfif></cfif>
				<cfif IsQuery(R7)><cfif arguments.resultType IS "kvp"><cfset resultObj.R7 = fn_convert2Array(R7)><cfelse><cfset resultObj.R7 = R7></cfif></cfif>
				<cfif IsQuery(R8)><cfif arguments.resultType IS "kvp"><cfset resultObj.R8 = fn_convert2Array(R8)><cfelse><cfset resultObj.R8 = R8></cfif></cfif>
				<cfif IsQuery(R9)><cfif arguments.resultType IS "kvp"><cfset resultObj.R9 = fn_convert2Array(R9)><cfelse><cfset resultObj.R9 = R9></cfif></cfif>
				<cfif IsQuery(R10)><cfif arguments.resultType IS "kvp"><cfset resultObj.R10 = fn_convert2Array(R10)><cfelse><cfset resultObj.R10 = R10></cfif></cfif>
				
				<!---
				<cfset resultObj.args = masked_args>
				--->
				
			</cfif>
							
		<cfreturn resultObj>
	</cffunction>   


	<cffunction name="fn_convert2Array" access="private" returnType="any" returnFormat="json">      
		<cfargument name="q" required="true"  type="query" default=""/>
		
			<cfset var queryConvertedToArray = []>
			
				<cfloop query="q">
					<cfset queryConvertedToArray[ currentrow ] = {}>
					
					<cfloop list="#q.columnList#" index="col">
						<cfset queryConvertedToArray[currentrow][lcase(col)] = q[col][currentrow]>
					</cfloop>
				</cfloop>
		
		<cfreturn queryConvertedToArray>
	</cffunction>   
	
	

	<cffunction name="fn_maskCreditCards" access="private" returnType="string">      
		<cfargument name="source" required="true"  type="string" default=""/>
		
			<cfset var visa = "(4[\s-.]*){1}(\d[\s-.]*){14}\d">
			<cfset var mc = "(5[\s-.]*){1}(\d[\s-.]*){14}\d">
			<cfset var amex = "(3[\s-.]*){1}(\d[\s-.]*){13}\d">
			<cfset var discover = "(6[\s-.]*){1}(?:(0[\s-.]*){1}(1[\s-.]*){1}(1[\s-.]*){1}|(5[\s-.]*){1}(\d[\s-.]*){2})(\d[\s-.]*){11}\d">
			<cfset var regex = "#visa#|#mc#|#amex#|#discover#\b">
			<cfset var matches = reMatch(regex, source)>
			<cfset var masked = "">
			<cfset var cleaned = source>
			<cfset var ccFound = false>


			<cfif arrayLen(matches) GT 0>
				<cfloop array="#matches#" index="item">
				
					<cfset item_nospaces = REReplace(item, "\D", "", "ALL")>
						<cfif len(item_nospaces) GTE "15" AND IsValid('creditcard', item_nospaces)>
							<cfset masked = "#left(item_nospaces,6)##repeatString('*', len(replace(item_nospaces, " ", "", "ALL"))-10)##right(item_nospaces,4)#">
							<cfset cleaned = replace(cleaned, item, "#replace(masked, " ", "", "ALL")#", "ALL")>
							<cfset ccFound = true>
						</cfif>
				</cfloop>	
			</cfif>
			
			<cfif ccFound IS false>
				<cfset cleaned = source>
			</cfif>
			
		<cfreturn cleaned>
	</cffunction>   
		
    





</cfcomponent>