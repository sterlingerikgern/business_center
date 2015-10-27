<cffunction name="getAuthUserName" output="false">
	<cfreturn listLast(GetAuthUser())>
</cffunction>