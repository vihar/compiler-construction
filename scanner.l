
%{
int COMMENT=0;
%}
id      [a-z][a-z0-9]*
%%
#.*                             {printf("\n%s is a PREPROCESSOR DIRECTIVE",yytext);}
int|double|char    {printf("\n\t%s is a KEYWORD",yytext);}
if|then|endif          {printf("\n\t%s is a KEYWORD",yytext);}
else                            {printf("\n\t%s is a KEYWORD",yytext);}
"/*"                            {COMMENT=1;}
"*/"                            {COMMENT=0;}
{id}\(                        {if(!COMMENT)printf("\n\nFUNCTION\n\t%s",yytext);}
{id}(\[[0-9]*\])?  {if(!COMMENT) printf("\n\tidentifier\t%s",yytext);}
\{                                {if(!COMMENT) printf("\n BLOCK BEGINS");ECHO; }
\}                                {if(!COMMENT)printf("\n BLOCK ends");ECHO; }
\".*\"                         {if(!COMMENT)printf("\n\t %s is a STRING",yytext);}
[+\-]?[0-9]+          {if(!COMMENT)printf("\n\t%s is a NUMBER",yytext);}
\(                                {if(!COMMENT)printf("\n\t");ECHO;printf("\t delim openparanthesis\n");}
\)                                {if(!COMMENT)printf("\n\t");ECHO;printf("\t delim closed paranthesis");}
\;                                {if(!COMMENT)printf("\n\t");ECHO;printf("\t delim semicolon");}
\=                               {if(!COMMENT)printf("\n\t%s is an ASSIGNMENT OPERATOR",yytext);}
\<|\>                        {printf("\n\t %s is relational operator",yytext);}
"+"|"-"|"*"|"/"       {printf("\n %s is an operator\n",yytext);}
"\n"    ;
%%
main(int argc ,char **argv)
{
        if (argc > 1)
                yyin = fopen(argv[1],"r");
        else
                yyin = stdin;
        yylex ();
        printf ("\n");
}
int yywrap()
{
        return 0;
}
