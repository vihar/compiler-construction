%token NUM

%%
cmd     :E {printf("%d\n",$1);}
            ;
E       :E '+' T  {$$=$1+$3;}
        |T {$$=$1;}
        ;
T       :T'*'F {$$=$1*$3;}
        |F {$$=$1;}
        ;
F       :'(' E ')' {$$=$2;}
        |NUM {$$=$1;}
        ;
%%
int main()
{
yyparse();
}
yyerror(char *s)
{
printf("%s",s);
}