<cfcomponent restpath="student" rest="true">
  
 <cffunction name="getMethod" access="remote" output="false" returntype="string" httpmethod="get" description="A method to handle get calls in student resource" >
   
  <!--- invoke name from database and return --->
  <!--- for now returning sample name --->
  <cfreturn "foo">
 </cffunction>
  
</cfcomponent>