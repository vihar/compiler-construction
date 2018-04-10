%{
#include<stdio.h>
%}

%union
{
int dval;
}

%token <dval> DIGIT
%type <dval> expr
%type <dval> expr1

%%
line : expr '\n' {printf("%d\n",$1);}
     ;
expr : expr'+'expr1 {$$=$1+$3;}
     | expr'-'expr1 {$$=$1-$3;}
     | expr'*'expr1 {$$=$1*$3;}
     | expr'/'expr1 {$$=$1/$3;}
     | expr1
     ;
expr1: '('expr')' {$$=$2;}
     | DIGIT
     ;
%%

#include<stdio.h>
int main()
{
    yyparse();
}
yyerror(char *s)
{
    printf("%s",s);
}
