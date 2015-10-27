<cffunction name="dateTimeOffsetFormat" output="true">
	<cfargument name="dateTime" required="yes" default="">
	<cfargument name="dateFormatString" required="no" default="mm/dd/yyyy">
	<cfargument name="timeFormatString" required="no" default="h:mm tt">
	<cfargument name="offset" required="no" default="0">
	
	<cfif IsDate(arguments.dateTime)>
	<cfset dateTimeNew = arguments.dateTime>
	<cfset offset = arguments.offset>
		
	<cfif IsDefined('rc.entity.meta_program_timeOffsetHours')>
		<cfset offset = rc.entity.meta_program_timeOffsetHours>
	</cfif>	
	
	<cfif offset GT 0>
		<cfset dateTimeNew = dateAdd('h', offset, arguments.dateTime)>
	</cfif>
	
	<cfoutput>#DateFormat(dateTimeNew, dateFormatString)# #TimeFormat(dateTimeNew, timeFormatString)#</cfoutput>
	</cfif>
	<cfreturn>
</cffunction>


<cffunction name="phoneFormat" output="false">
	<cfargument name="string" required="yes" default="">
	<cfargument name="defaultValue" required="no" default="">
	
	<cfset var formattedPx = right(ReReplaceNoCase(arguments.string,"[^0-9]","","ALL"),10)>
	

	<cfif formattedPx IS "8135551212" or formattedPx IS "">
		<cfset formattedPx = defaultValue>
	</cfif>

		
	<cfif formattedPx IS NOT "">
		<cfset formattedPx = "(#left(formattedPx,3)#) #mid(formattedPx,4,3)#-#mid(formattedPx,7,4)#">	
	</cfif>

	<cfreturn formattedPx>
</cffunction>

<cffunction name="emailFormat" output="false">
	<cfargument name="string" required="yes" default="">
	<cfargument name="makelink" required="no" default="1">
	
	<cfset var formattedEx = string>
	
	<cfif string IS "none@none.com">
		<cfset formattedEx = "">
	</cfif>
	
	<cfif makelink IS "1">
		<cfset formattedEx = "<a href='mailto:#formattedEx#'>#formattedEx#</a>">
	</cfif>


	<cfreturn formattedEx>
</cffunction>



<cffunction name="titleCase" output="false">
	<cfargument name="string" required="yes" default="">

	<cfscript>
	
		if (len(string) gt 1) {
			string = lcase(string);
	
			if (refind("^[a-z]", string))  {
				string = ucase(left(string, 1)) & right(string,(len(string) - 1 ));
			}
	
			next = refind("[[:space:][:punct:]][a-z]", string);
	
			while (next)  {
				if (next lt (len(string) - 1)) {
					string = left(string, (next)) & ucase(mid(string,next+1, 1)) &  right(string, (len(string) - (next + 1)));
				} else {
					string = left(string, (next)) & ucase(right(string, 1));
				}
				next = refind("[[:space:][:punct:]][a-z]", string, next);
			}
			
		} else {
			string = ucase(string);
		}
	
		/* post fixes */
		/* Recall that "Replace()" is case sensitive */
		string = Replace(string," Of "," of ","ALL");
		string = Replace(string," And "," and ","ALL");
		string = Replace(string,"'S ","'s ","ALL");
		string = Replace(string," At "," at ","ALL");
		string = Replace(string," The "," the ","ALL");
		string = Replace(string," For "," for ","ALL");
		string = Replace(string," De "," de ","ALL");
		string = Replace(string," Y "," y ","ALL");
		string = Replace(string," In "," in ","ALL");
		
		if(right(string,3) IS " id"){
			string = Replace(string," Id"," ID","ALL");
		}
		
			
		/* roman numerals */
		string = Replace(string," Iii"," III","ALL");
		string = Replace(string," Ii"," II","ALL");
		
		/* specific cases of acronyms */
		string = Replace(string,"Abc ","ABC ","ALL");
		string = Replace(string,"Abcd","ABCD ","ALL");
		string = Replace(string,"Aaa ","AAA ","ALL");
		string = Replace(string,"Cbe ","CBE ","ALL");
		string = Replace(string,"Cei ","CEI ","ALL");
		string = Replace(string,"Itt ","ITT ","ALL");
		string = Replace(string,"Mbti ","MBTI ","ALL");
		string = Replace(string,"Cuny ","CUNY ","ALL");
		string = Replace(string,"Suny ","SUNY ","ALL");
		string = Replace(string,"Mta ","MTA ","ALL");
		string = Replace(string,"Mti ","MTI ","ALL");
		string = Replace(string,"Qpe ","QPE ","ALL");
		string = Replace(string," Ogc "," OGC ","ALL");
		string = Replace(string,"Tci ","TCI ","ALL");
		string = Replace(string,"The Cdl ","The CDL ","ALL");
		string = Replace(string,"The Mbf ","The MBF","ALL");
		string = Replace(string,"Lpn","LPN","ALL");
		string = Replace(string,"Cvph ","CVPH ","ALL");
		string = Replace(string,"Dch ","DCH ","ALL");
		string = Replace(string,"Bmr ","BMR ","ALL");
		string = Replace(string,"Isim ","ISIM ","ALL");
		
		/* contractions */
		string = Replace(string," Mgt"," Management","ALL");
		string = Replace(string,"Trng","Training","ALL");
		string = Replace(string,"Xray","X-Ray","ALL");
		string = Replace(string," Sch "," School ","ALL");
		string = Replace(string," Dba "," dba ","ALL");
		
		/* specific names with special case */
		string = Replace(string,"Mcc","McC","ALL");
		string = Replace(string,"Mcd","McD","ALL");
		string = Replace(string,"Mch","McH","ALL");
		string = Replace(string,"Mcg","McG","ALL");
		string = Replace(string,"Mci","McI","ALL");
		string = Replace(string,"Mck","McK","ALL");
		string = Replace(string,"Mcl","McL","ALL");
		string = Replace(string,"Mcm","McM","ALL");
		string = Replace(string,"Mcn","McN","ALL");
		string = Replace(string,"Mcp","McP","ALL");
		
		/* adding punctuation */
		string = Replace(string," Inc",", Inc","ALL");
		string = Replace(string,"Ft ","Ft. ","ALL");
		string = Replace(string,"St ","St. ","ALL");
		string = Replace(string,"Mt ","Mt. ","ALL");
		
		/* U.S. state abbreviations */
		string = Replace(string, " Ak ", " AK ", " ALL ");
		string = Replace(string, " As ", " AS ", " ALL ");
		string = Replace(string, " Az ", " AZ ", " ALL ");
		string = Replace(string, " Ar ", " AR ", " ALL ");
		string = Replace(string, " Ca ", " CA ", " ALL ");
		string = Replace(string, " Co ", " CO ", " ALL ");
		string = Replace(string, " Ct ", " CT ", " ALL ");
		string = Replace(string, " De ", " DE ", " ALL ");
		string = Replace(string, " Dc ", " DC ", " ALL ");
		string = Replace(string, " Fl ", " FL ", " ALL ");
		string = Replace(string, " Ga ", " GA ", " ALL ");
		string = Replace(string, " Gu ", " GU ", " ALL ");
		string = Replace(string, " Hi ", " HI ", " ALL ");
		string = Replace(string, " Id ", " ID ", " ALL ");
		string = Replace(string, " Il ", " IL ", " ALL ");
		string = Replace(string, " In ", " IN ", " ALL ");
		string = Replace(string, " Ia ", " IA ", " ALL ");
		string = Replace(string, " Ks ", " KS ", " ALL ");
		string = Replace(string, " Ky ", " KY ", " ALL ");
		string = Replace(string, " La ", " LA ", " ALL ");
		string = Replace(string, " Me ", " ME ", " ALL ");
		string = Replace(string, " Md ", " MD ", " ALL ");
		string = Replace(string, " Mh ", " MH ", " ALL ");
		string = Replace(string, " Ma ", " MA ", " ALL ");
		string = Replace(string, " Mi ", " MI ", " ALL ");
		string = Replace(string, " Fm ", " FM ", " ALL ");
		string = Replace(string, " Mn ", " MN ", " ALL ");
		string = Replace(string, " Ms ", " MS ", " ALL ");
		string = Replace(string, " Mo ", " MO ", " ALL ");
		string = Replace(string, " Mt ", " MT ", " ALL ");
		string = Replace(string, " Ne ", " NE ", " ALL ");
		string = Replace(string, " Nv ", " NV ", " ALL ");
		string = Replace(string, " Nh ", " NH ", " ALL ");
		string = Replace(string, " Nj ", " NJ ", " ALL ");
		string = Replace(string, " Nm ", " NM ", " ALL ");
		string = Replace(string, " Ny ", " NY ", " ALL ");
		string = Replace(string, " Nc ", " NC ", " ALL ");
		string = Replace(string, " Nd ", " ND ", " ALL ");
		string = Replace(string, " Mp ", " MP ", " ALL ");
		string = Replace(string, " Oh ", " OH ", " ALL ");
		string = Replace(string, " Ok ", " OK ", " ALL ");
		string = Replace(string, " Or ", " OR ", " ALL ");
		string = Replace(string, " Pw ", " PW ", " ALL ");
		string = Replace(string, " Pa ", " PA ", " ALL ");
		string = Replace(string, " Pr ", " PR ", " ALL ");
		string = Replace(string, " Ri ", " RI ", " ALL ");
		string = Replace(string, " Sc ", " SC ", " ALL ");
		string = Replace(string, " Sd ", " SD ", " ALL ");
		string = Replace(string, " Tn ", " TN ", " ALL ");
		string = Replace(string, " Tx ", " TX ", " ALL ");
		string = Replace(string, " Ut ", " UT ", " ALL ");
		string = Replace(string, " Vt ", " VT ", " ALL ");
		string = Replace(string, " Va ", " VA ", " ALL ");
		string = Replace(string, " Vi ", " VI ", " ALL ");
		string = Replace(string, " Wa ", " WA ", " ALL ");
		string = Replace(string, " Wv ", " WV ", " ALL ");
		string = Replace(string, " Wi ", " WI ", " ALL ");
		string = Replace(string, " Wy ", " WY ", " ALL ");
	</cfscript>

	<cfreturn trim(string)>

</cffunction>