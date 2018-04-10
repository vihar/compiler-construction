%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
void precision(char *);
%}

number [-+]?[0-9]+\.?[0-9]+

%%
{number} precision(yytext);
%%

main()
{
        yylex();
}

void precision(char *s)
{
        int i=0,count=-1;
        double num=atof(s);
        while(s[i]!='\0' && s[i]!='.') i++;
        while(s[i++]!='\0') count++;
        printf("The given precision after . is  %d\n", count);
        printf("%.2f is the rounded number\n",num);
}

int yywrap()
{
        return 2;
}
