 <!---
	jwt.cfc

	DESCRIPTION: Component for encoding and decoding JSON Web Tokens.

		Based on jwt-simple node.js library (https://github.com/hokaccha/node-jwt-simple)

	PARAMETERS: 
		key - HMAC key used for token signitures
	
			
--->

<cfcomponent output="false">
	
	<cffunction name="init" output="false">
		<cfargument name="key" required="true">

		<cfset variables.key = arguments.key>
		<!--- Supported algorithms --->
		<cfset variables.algorithmMap = {
			"HS256" = "HmacSHA256",
			"HS384" = "HmacSHA384",
			"HS512" = "HmacSHA512"
		}>

		<cfreturn this>
	</cffunction>

	<!--- 	decode(string) as struct
			Description:  Decode a JSON Web Token
	---> 
	<cffunction name="decode" output="false">
		<cfargument name="token" required="true">

		<!--- Token should contain 3 segments --->
		<cfif listLen(arguments.token,".") neq 3>
			<cfthrow type="Invalid Token" message="Token should contain 3 segments">
		</cfif>

		<!--- Get  --->
		<cfset var header = deserializeJSON(base64UrlDecode(listGetAt(arguments.token,1,".")))>
		<cfset var payload = deserializeJSON(base64UrlDecode(listGetAt(arguments.token,2,".")))>
		<cfset var signiture = listGetAt(arguments.token,3,".")>

		<!--- Make sure the algorithm listed in the header is supported --->
		<cfif listFindNoCase(structKeyList(algorithmMap),header.alg) eq false>
			<cfthrow type="Invalid Token" message="Algorithm not supported">
		</cfif>

		<!--- Verify signiture --->
		<cfset var signInput = listGetAt(arguments.token,1,".") & "." & listGetAt(arguments.token,2,".")>
		<cfif signiture neq sign(signInput,algorithmMap[header.alg])>
			<cfthrow type="Invalid Token" message="Signiture verification failed">
		</cfif>

		<cfreturn payload>
	</cffunction>

	<!--- 	encode(struct,[string]) as String
			Description:  encode a data structure as a JSON Web Token
	---> 
	<cffunction name="encode" output="false">
		<cfargument name="payload" required="true">
		<cfargument name="algorithm" default="HS256">

		<!--- Default hash algorithm --->
		<cfset var hashAlgorithm = "HS256">
		<cfset var segments = "">

		<!--- Make sure only supported algorithms are used --->
		<cfif listFindNoCase(structKeyList(algorithmMap),arguments.algorithm)>
			<cfset hashAlgorithm = arguments.algorithm>
		</cfif>

		<!--- Add Header - typ and alg fields--->
		<cfset segments = listAppend(segments, base64UrlEscape(toBase64(serializeJSON({ "typ" =  "JWT", "alg" = hashAlgorithm }))),".")>
		<!--- Add payload --->
		<cfset segments = listAppend(segments, base64UrlEscape(toBase64(serializeJSON(arguments.payload))),".")>
		<cfset segments = listAppend(segments, sign(segments,algorithmMap[hashAlgorithm]),".")>

		<cfreturn segments>
	</cffunction>

	<!--- 	verify(token) as Boolean
			Description:  Verify the token signiture
	---> 
	<cffunction name="verify" output="false">
		<cfargument name="token" required="true">

		<cfset var isValid = true>

		<cftry>
			<cfset decode(token)>
			<cfcatch>
				<cfset isValid = false>
			</cfcatch>
		</cftry>

		<cfreturn isValid>
	</cffunction>

	<!--- 	sign(string,[string]) as String
			Description: Create an MHAC of provided string using the secret key and algorithm
	---> 
	<cffunction name="sign" output="false" access="private">
		<cfargument name="msg" type="string" required="true">
		<cfargument name="algorithm" default="HmacSHA256">

		<cfset var key = createObject("java", "javax.crypto.spec.SecretKeySpec").init(variables.key.getBytes(), arguments.algorithm)>
		<cfset var mac = createObject("java", "javax.crypto.Mac").getInstance(arguments.algorithm)>
		<cfset mac.init(key)>

		<cfreturn base64UrlEscape(toBase64(mac.doFinal(msg.getBytes())))>
	</cffunction>

	<!--- 	base64UrlEscape(String) as String
			Description:  Escapes unsafe url characters from a base64 string
	---> 
	<cffunction name="base64UrlEscape" output="false" access="private">
		<cfargument name="str" required="true">

		<cfreturn reReplace(reReplace(reReplace(str, "\+", "-", "all"), "\/", "_", "all"),"=", "", "all")>
	</cffunction>

	<!--- 	base64UrlUnescape(String) as String
			Description: restore base64 characters from an url escaped string 
	---> 
	<cffunction name="base64UrlUnescape" output="false" access="private">
		<cfargument name="str" required="true">

		<!--- Unescape url characters --->
		<cfset var base64String = reReplace(reReplace(arguments.str, "\-", "+", "all"), "\_", "/", "all")>
		<cfset var padding = repeatstring("=",4 - len(base64String) mod 4)>

		<cfreturn base64String & padding>
	</cffunction>


	<!--- 	base64UrlDecode(String) as String
			Description:  Decode a url encoded base64 string
	---> 
	<cffunction name="base64UrlDecode" output="false" access="private">
		<cfargument name="str" required="true">

		<cfreturn toString(toBinary(base64UrlUnescape(arguments.str)))>
	</cffunction>

	
</cfcomponent>