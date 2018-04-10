#include<iostream>
#include<string>
using namespace std;

string input,op,arg1,arg2;
string r="01234";

int l,j=0;

void rep(int);
void checkUnaryMinus(int);
int getPrecedence(char);

void printCode();
string getCode(char);

int main()
{
    int i,p;
    cout<<"Enter the input Expression\n";
    cin>>input;
    l=input.length();
    for(i=0;i<l;i++){
        if(input[i]=='-') 
            checkUnaryMinus(i);
    }

    for(i=0;i<l;i++)
    {
        p=getPrecedence(input[i]);
        if(p==6)
        {
            rep(i);
            i=0;
        }
    }
    for(i=0;i<l;i++)
    {
        p=getPrecedence(input[i]);
        if(p==5)
        {
            rep(i);
            i=0;
        }
    }
    for(i=0;i<l;i++)
    {
        p=getPrecedence(input[i]);
        if(p==4)
        {
            rep(i);
            i=0;
        }
    }

    cout<<"The triplet 3-address code notation is \n";
    cout<<"No:\top\targ1\targ2\n";
    for(i=0;i<j;i++)
        cout<<i<<"\t"<<op[i]<<"\t"<<arg1[i]<<"\t"<<arg2[i]<<endl;
    cout<<"\nGenerated code\n";
    printCode();

}
string getCode(char c)
{
    switch(c)
    {
        case '*': return "MUL";
        case '/': return "DIV";
        case '+': return "ADD";
        case '-': return "SUB";
    }
}
void printCode()
{
    for(int i=0;i<j;i++)
    {
        if(op[i]!='=')
        {
            cout<<"MOV "<<arg1[i]<<",R0\n";
            if(op[i]=='m') cout<<"NEG "<<arg1[i]<<endl;
            else    cout<<getCode(op[i])<<" "<<arg2[i]<<" , R0\n";
        }
        else cout<<"MOV "<<arg2[i]<<" , "<<arg1[i]<<endl;
    }
}
int getPrecedence(char c)
{
    switch(c)
    {
        case '*':
        case '/': return 6;
        case '+':
        case '-': return 5;
        case '=': return 4;
        default : return -1;
    }
}
void rep(int i)
{
    op[j]=input[i];
    arg1[j]=input[i-1];
    arg2[j]=input[i+1];
    input.replace(i-1,3,to_string(j));
    l=l-2;
    j++;
}

void checkUnaryMinus(int i)
{
    if(!isalpha(input[i-1]))
    {
        op[j]='m';
        arg1[j]=input[i+1];
        arg2[j]=' ';
        input.replace(i,2,to_string(j));
        l--;
        j++;
    }
}
