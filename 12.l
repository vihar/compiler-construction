%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+ {yylval.dval=atoi(yytext); return DIGIT;}
\n|. return yytext[0];
%%
