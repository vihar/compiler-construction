%{

%}
id [a-z][a-z0-9]*
%%

int|double|char {printf("It is a Keyword",yytext);}

if|then|endif {printf("It is a Conditional",yytext);}

[0-9]+ {printf("\n\t%s is a NUMBER",yytext);}

%%

main(int argc, char **argvi){
    if(argc>1){
        yyin = fopen(argv[1],"r");
    }
    else
        yyin = stdin;
        yylex();
        printf("\n");
}

int yywrap(){
    return 0;
}