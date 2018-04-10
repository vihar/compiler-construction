#include<stdio.h>
char stk[100],stktop=-1,cnt=0;
void push(char pchar)
{
    stk[++stktop]=pchar;
}
char pop()
{
    return stk[stktop--];
}
char checkoperation(char char1)
{
    char oper;
    if(char1=='+')
        oper='A';
    else if(char1=='-')
        oper='S';
    else if(char1=='*')
        oper='M';
    else if(char1=='/')
        oper='D';
    else if(char1=='@')
        oper='N';
    return oper;
}
int checknstore(char check)
{
    int ret;
    if(check!='+' && check!='-' && check!='*' && check!='/' && check!='@')
    {
        push(++cnt);
        if(stktop>0)
            printf("ST $%d\n",cnt);
        ret=1;
    }
    else
        ret=0;
    return ret;
}
int main()
{
    char msg[100],op1,op2,operation;
    int i,val;
    while(scanf("%s",msg)!=EOF)
    {
        cnt=0;
        stktop=-1;
        for(i=0;msg[i]!='\0';i++)
        {
            if((msg[i] >='A' && msg[i]<='Z') ||(msg[i]>='a' && msg[i]<='z'))
                push(msg[i]);
            else
            {
                op1=pop();
                op2=pop();
                printf("L %c\n",op2);
                operation=checkoperation(msg[i]);
                printf("%c %c\n",operation,op1);
                val=checknstore(msg[i+1]);
                while(val==0)
                {
                    op1=pop();
                    cnt--;
                    operation=checkoperation(msg[++i]);
                    if(operation=='S'&&stktop>=-1)
                    {
                        printf("N\n");
                        operation='A';
                    }
                    printf("%c %c\n",operation,op1);
                    val=checknstore(msg[i+1]);
                }
            }
        }
    }
}