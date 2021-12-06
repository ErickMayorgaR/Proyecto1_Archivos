#include <iostream>
#include <sys/stat.h>
#include <fstream>
#include <string.h>
#include "parser.h"
#include "scanner.h"


using namespace std;

extern int yyparse();
bool consola = true;
void ejecutarEntrada(char*);



int main()
{
    while(consola){
        cout<< "ingrese un comando"<< endl;
        char entrada[500];
        printf(">>");
        fgets(entrada,sizeof(entrada),stdin);
        ejecutarEntrada(entrada);
        memset(entrada,0,500);

    }
    return 0;
}


void ejecutarEntrada(char entrada1[500]){
   YY_BUFFER_STATE buffer = yy_scan_string(entrada1);

   if(yyparse()==0){
           // cout<<resultado<<endl;
       }else{
           cout<<"Hubo Un Error"<<endl;
       }


}