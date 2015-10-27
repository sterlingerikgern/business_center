<cffunction name="getAuthUserId" output="false">
	<cfreturn listFirst(GetAuthUser())>
</cffunction>