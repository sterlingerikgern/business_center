<cffunction name="getMeta" output="false">
	<cfargument name="obj" required="yes" default="">
	<cfargument name="deftext" required="no" default="">


	<cfreturn iif(IsDefined(obj), obj, deftext)>

</cffunction>