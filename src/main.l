
%{
#include <stdio.h>
%}

AN [A-z0-9]
ANE [A-z0-9_.-]
EMAIL ({AN}{ANE}+{AN}\@{AN}{ANE}+{AN})|({AN}+\@{AN}+)|({AN}{ANE}+{AN}\@{AN}{ANE}+{AN}\.)
%%

{EMAIL} {int k, l;
  k = 0;
  while(yytext[k] != '\0')
  {
    k++;
  }
  if(yytext[k-1] != '.')
  {
    for(l = 0; l < k; l++)
    {
      printf("%c", yytext[l]);
    }
    printf("\n");
  }
  else
  {
    for(l = 0; l < k-1; l++)
    {
      printf("%c", yytext[l]);
    }
    printf("\n");
  }}
[[:space:]]+ ;
[[:^space:]]+ ;

%%

int main() 
{
  yylex();
  return 0;
}
