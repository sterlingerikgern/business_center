<cfparam name="attributes.role" default="">
<cfparam name="attributes.result" default="">     
<cfset "caller.#attributes.result#" = queryNew("errorCode,errorMessage"
												, "Varchar,Varchar"
												, [['000', 'Permission Granted']])>
	
<cfif NOT IsUserInRole(attributes.role)>
	<cfset "caller.#attributes.result#" = queryNew("errorCode,errorMessage"
										  , "Varchar,Varchar"
										  , [['501', 'You do not have permissions to execute this procedure']])>
</cfif>
	





