%{
    #include <iostream>
    #include "parser.h"
    int resultado;
%}

%option case-insensitive
%option noyywrap

numero [0-9]+
letra [a-zA-Z]+

identificador ({letra})({letra}|{numero}|"_")*
cadena [\"][^\"\n]*[\"\n]

filen "-file"{numero}
idp "58"{numero}{letra}
rutaelim ("/"{identificador})+
rutaarch ({identificador}"."{identificador})
rutacat ("/"{identificador}"."{identificador})
ruta ("/"{identificador})+("/"{identificador}"."{identificador})

%%

{numero}        {strcpy(yylval.TEXT,yytext); return(numero);}
{cadena}        {strcpy(yylval.TEXT,yytext); return(cadena);}
{filen}         {strcpy(yylval.TEXT,yytext); return(filen);}
{idp}           {strcpy(yylval.TEXT,yytext); return(idp);}
{rutaelim}      {strcpy(yylval.TEXT,yytext); return(rutaelim);}
{rutaarch}      {strcpy(yylval.TEXT,yytext); return(rutaarch);}
{rutacat}       {strcpy(yylval.TEXT,yytext); return(rutacat);}
{ruta}          {strcpy(yylval.TEXT,yytext); return(ruta);}

"mkdisk"        {strcpy(yylval.TEXT,yytext); return(mkdisk);}
"rmdisk"        {strcpy(yylval.TEXT,yytext); return(rmdisk);}
"fdisk"         {strcpy(yylval.TEXT,yytext); return(fdisk);}
"mount"         {strcpy(yylval.TEXT,yytext); return(mount);}
"unmount"       {strcpy(yylval.TEXT,yytext); return(unmount);}
"mkfs"          {strcpy(yylval.TEXT,yytext); return(mkfs);}

"login"         {strcpy(yylval.TEXT,yytext); return(login);}
"logout"        {strcpy(yylval.TEXT,yytext); return(logout);}
"mkgrp"         {strcpy(yylval.TEXT,yytext); return(mkgrp);}
"rmgrp"         {strcpy(yylval.TEXT,yytext); return(rmgrp);}
"mkusr"         {strcpy(yylval.TEXT,yytext); return(mkusr);}
"rmusr"         {strcpy(yylval.TEXT,yytext); return(rmusr);}

"chmod"         {strcpy(yylval.TEXT,yytext); return(chmoddd);}
"mkfile"        {strcpy(yylval.TEXT,yytext); return(mkfile);}
"cat"           {strcpy(yylval.TEXT,yytext); return(cat);}
"rem"           {strcpy(yylval.TEXT,yytext); return(rem);}
"edit"          {strcpy(yylval.TEXT,yytext); return(edit);}
"ren"           {strcpy(yylval.TEXT,yytext); return(ren);}
"mkdir"         {strcpy(yylval.TEXT,yytext); return(mkdirr);}
"cp"            {strcpy(yylval.TEXT,yytext); return(cp);}
"mv"            {strcpy(yylval.TEXT,yytext); return(mv);}
"find"          {strcpy(yylval.TEXT,yytext); return(find);}
"chown"         {strcpy(yylval.TEXT,yytext); return(chownn);}
"chgrp"         {strcpy(yylval.TEXT,yytext); return(chgrp);}

"pause"         {strcpy(yylval.TEXT,yytext); return(pausee);}
"exec"          {strcpy(yylval.TEXT,yytext); return(execc);}
"rep"           {strcpy(yylval.TEXT,yytext); return(rep);}
"recovery"      {strcpy(yylval.TEXT,yytext); return(recovery);}
"loss"          {strcpy(yylval.TEXT,yytext); return(loss);}

"="             {strcpy(yylval.TEXT,yytext); return(igual);}
"/"             {strcpy(yylval.TEXT,yytext); return(dividido);}
"?"             {strcpy(yylval.TEXT,yytext); return(interrogacion);}
"*"             {strcpy(yylval.TEXT,yytext); return(multiplicacion);}
"-"             {strcpy(yylval.TEXT,yytext); return(negativo);}

"-size"         {strcpy(yylval.TEXT,yytext); return(sizee);}
"-f"            {strcpy(yylval.TEXT,yytext); return(f);}
"-u"            {strcpy(yylval.TEXT,yytext); return(u);}
"-path"         {strcpy(yylval.TEXT,yytext); return(pathh);}
"-type"         {strcpy(yylval.TEXT,yytext); return(typee);}
"-delete"       {strcpy(yylval.TEXT,yytext); return(deletee);}
"-name"         {strcpy(yylval.TEXT,yytext); return(namee);}
"-add"          {strcpy(yylval.TEXT,yytext); return(addd);}
"-id"           {strcpy(yylval.TEXT,yytext); return(id);}
"-fs"           {strcpy(yylval.TEXT,yytext); return(fs);}
"-usr"          {strcpy(yylval.TEXT,yytext); return(usr);}
"-pwd"          {strcpy(yylval.TEXT,yytext); return(pwd);}
"-grp"          {strcpy(yylval.TEXT,yytext); return(grp);}
"-ugo"          {strcpy(yylval.TEXT,yytext); return(ugo);}
"-r"            {strcpy(yylval.TEXT,yytext); return(rr);}
"-cont"         {strcpy(yylval.TEXT,yytext); return(cont);}
"-dest"         {strcpy(yylval.TEXT,yytext); return(dest);}
"-p"            {strcpy(yylval.TEXT,yytext); return(p);}
"-file"         {strcpy(yylval.TEXT,yytext); return(file);}

"BF"            {strcpy(yylval.TEXT,yytext); return(BF);}
"FF"            {strcpy(yylval.TEXT,yytext); return(FF);}
"WF"            {strcpy(yylval.TEXT,yytext); return(WF);}
"k"             {strcpy(yylval.TEXT,yytext); return(K);}
"m"             {strcpy(yylval.TEXT,yytext); return(M);}
"b"             {strcpy(yylval.TEXT,yytext); return(B);}
"P"             {strcpy(yylval.TEXT,yytext); return(PP);}
"E"             {strcpy(yylval.TEXT,yytext); return(E);}
"L"             {strcpy(yylval.TEXT,yytext); return(L);}
"fast"          {strcpy(yylval.TEXT,yytext); return(FAST);}
"full"          {strcpy(yylval.TEXT,yytext); return(FULL);}
"2fs"           {strcpy(yylval.TEXT,yytext); return(FS2);}
"3fs"           {strcpy(yylval.TEXT,yytext); return(FS3);}

[a-zA-Z]+([a-zA-Z]+|[0-9]+|"_")* {strcpy(yylval.TEXT,yytext); return(ident);}
"#"[^\n]*       {return(comentario);}
[ \t\r\f\n]      {}

.               {std::cout<<"Error Lexico"<<std::endl;}
%%
