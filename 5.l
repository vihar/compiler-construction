%{
/*program to capitalize a given string*/
#include<stdio.h>
#include<ctype.h>
int k;
void display(char *);
%}

letter [a-zA-Z]
com [//]

%%
{letter} display(yytext);
%%

main()
{
        yylex();
}

void display(char *s)
{
        int i;
        for(i=0;s[i]!='\0';i++)
                printf("%c",toupper(s[i]));
}

int yywrap()
{
        return 1;
}
