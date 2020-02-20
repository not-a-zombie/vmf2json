//This parser was originally written for C so the format is really weird for javascript
//an object is defined as a keyval and another object - basically a linked list
//a keyval is defined as a string key, a string_val or obj_val, and a boolean isStringVal
//note that the quotation marks used in object names are kept

/* lexical grammar */
%lex
%%

[ \t\n\r] {
	//discard spaces and tabs
}

"{" {
	return 'OPENBRACKET';
}
"}" {
	return 'CLOSEBRACKET';
}
<<EOF>>               return 'EOF'
\"[^\\"]*\" {
	return 'WORD';
}
[^ \t\n\r{}][^ \t\n\r{}]* {
	return 'WORD';
}


/lex
	
%start goal

%% /* language grammar */

goal:
	keyvalues EOF
	{
		return $1;
	}
	;
	
object:
	'OPENBRACKET' keyvalues 'CLOSEBRACKET'
	{
		$$ = $2;
	}
	;
	
keyvalues:
	keyvalue keyvalues
	{
		var obj = $2;
		//a keyvalue is simply an array of two elements because im lazy
		if(obj[$1[0]] === undefined){
			obj[$1[0]] = [];
		}
		obj[$1[0]].push($1[1]);
		$$ = obj;
	}
	|
	{
		$$ = {};
	}
	;
	
keyvalue:
	wordthing wordthing{
		//a keyvalue is simply an array of two elements because im lazy
		//console.log("key+value: " + $1 + " " + $2);
		$$=[$1,$2];
	}
	|
	wordthing object{
		//console.log("key+object: " + $1);
		$$=[$1,$2];
	}
	;
	
wordthing:
	WORD
	{
		//console.log("word found: " + yytext);
		$$ = yytext;
	}
	;
