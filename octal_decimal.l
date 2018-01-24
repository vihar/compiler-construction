%{ 
/*program to identify octal and hexadecimal numbers*/
%}
Oct [o][0-9]+
Hex [o][x|X][0-9A-F]+
%%
{Hex} printf("this is a hexadecimal number");
{Oct} printf("this is an octal number");
%%
main()
{
yylex();
}
int yywrap()
{
return 1;
}