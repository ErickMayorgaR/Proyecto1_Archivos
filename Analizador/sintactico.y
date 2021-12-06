%{
    #include <iostream>
    #include <QString>
    #include "scanner.h"
    #include "../Discos/mk_disk.h"
    #include "rmdisk.h"
    #include "fdisk.h"
    #include "mount.h"
    #include "unmount.h"
using namespace  std;

    extern int yylex(void);
    extern int resultado;

    mkdisk *mkdisco = new mkdisk();
    rmdisk *rmdisco = new rmdisk();
    fdisk  *fdisco = new fdisk();
    mount *mountdisco = new mount();
    unmount *unmountdisco = new unmount();



    int yyerror(const char* mens){
        std::cout << mens << std::endl;
        return 0;
    }
%}

%define parse.error verbose

%union{
    char TEXT[500];
    class mkdisk *mdisk1;
    class rmdisk *rmdisk1;
    class fdisk *fdisk1;
    class mount  *mountdisk1;
    class unmount *unmountdisk1;

}

%token <TEXT> numero
%token <TEXT> ident
%token <TEXT> cadena
%token <TEXT> filen
%token <TEXT> idp
%token <TEXT> rutaelim
%token <TEXT> rutaarch
%token <TEXT> rutacat
%token <TEXT> ruta

%token <TEXT> mkdisk
%token <TEXT> rmdisk
%token <TEXT> fdisk
%token <TEXT> mount
%token <TEXT> unmount
%token <TEXT> mkfs

%token <TEXT> login
%token <clogin> logout
%token <TEXT> mkgrp
%token <TEXT> rmgrp
%token <TEXT> mkusr
%token <TEXT> rmusr

%token <TEXT> chmoddd
%token <TEXT> mkfile
%token <TEXT> cat
%token <TEXT> rem
%token <TEXT> edit
%token <TEXT> ren
%token <TEXT> mkdirr
%token <TEXT> cp
%token <TEXT> mv
%token <TEXT> find
%token <TEXT> chownn
%token <TEXT> chgrp

%token <TEXT> execc
%token <TEXT> pausee
%token <TEXT> comentario
%token <TEXT> rep
%token <TEXT> recovery
%token <TEXT> loss

%token <TEXT> igual
%token <TEXT> dividido
%token <TEXT> interrogacion
%token <TEXT> multiplicacion
%token <TEXT> negativo

%token <TEXT> sizee
%token <TEXT> f
%token <TEXT> u
%token <TEXT> pathh
%token <TEXT> typee
%token <TEXT> deletee
%token <TEXT> namee
%token <TEXT> addd
%token <TEXT> id
%token <TEXT> fs
%token <TEXT> usr
%token <TEXT> pwd
%token <TEXT> grp
%token <TEXT> ugo
%token <TEXT> rr
%token <TEXT> cont
%token <TEXT> dest
%token <TEXT> p
%token <TEXT> file

%token <TEXT> BF
%token <TEXT> FF
%token <TEXT> WF
%token <TEXT> K
%token <TEXT> M
%token <TEXT> B
%token <TEXT> PP
%token <TEXT> E
%token <TEXT> L
%token <TEXT> FAST
%token <TEXT> FULL
%token <TEXT> FS2
%token <TEXT> FS3

%type <mdisk1>       COMMKDISK; //Comandos con los que accedo a las clases de arriba
%type <rmdisk1>      COMRMDISK;
%type <fdisk1>       COMFDISK;
%type <mountdisk1>   COMMOUNT;
%type <unmountdisk1> COMUNMOUNT;

%start INICIO
%%

INICIO:     COMANDOS                                { };

COMANDOS:   mkdisk COMMKDISK                        {$2->ejecutar($2); std::cout<<"Comando MKDISK"<<std::endl;};
            |rmdisk COMRMDISK                       {$2->ejecutar($2); std::cout<<"Comando MKDISK"<<std::endl;};
            |fdisk  COMFDISK                        {$2->ejecutar();   std::cout<<"Comando FDISK"<<std::endl;};
            |mount COMMOUNT                         {$2->ejecutar();   std::cout<<"Comando MOUNT"<<std::endl;};
            |unmount COMUNMOUNT                     {$2->ejecutar();   std::cout<<"Comando UNMOUNT"<<std::endl;};


COMMKDISK:  sizee igual numero COMMKDISK            {int tam=atoi($3); if(mkdisco->size==0){mkdisco->size=tam;} $$=mkdisco;};
            |f igual BF COMMKDISK                   {if(mkdisco->f==""){mkdisco->f=$3;} $$=mkdisco;};
            |f igual FF COMMKDISK                   {if(mkdisco->f==""){mkdisco->f=$3;} $$=mkdisco;};
            |f igual WF COMMKDISK                   {if(mkdisco->f==""){mkdisco->f=$3;} $$=mkdisco;};
            |u igual K  COMMKDISK                   {if(mkdisco->u==""){mkdisco->u=$3;} $$=mkdisco;};
            |u igual M  COMMKDISK                   {if(mkdisco->u==""){mkdisco->u=$3;} $$=mkdisco;};
            |pathh igual cadena COMMKDISK           {if(mkdisco->path==""){mkdisco->path=$3;} $$=mkdisco;};
            |pathh igual ruta COMMKDISK             {if(mkdisco->path==""){mkdisco->path=$3;} $$=mkdisco;};
            |sizee igual numero                     {int tam=atoi($3); if(mkdisco->size!=0){mkdisco->size=tam;} $$=mkdisco;};
            |f igual BF                             {if(mkdisco->f==""){mkdisco->f=$3;} $$=mkdisco;};
            |f igual FF                             {if(mkdisco->f==""){mkdisco->f=$3;} $$=mkdisco;};
            |f igual WF                             {if(mkdisco->f==""){mkdisco->f=$3;} $$=mkdisco;};
            |u igual K                              {if(mkdisco->u==""){mkdisco->u=$3;} $$=mkdisco;};
            |u igual M                              {if(mkdisco->u==""){mkdisco->u=$3;} $$=mkdisco;};
            |pathh igual cadena                     {if(mkdisco->path==""){mkdisco->path=$3;} $$=mkdisco;};
            |pathh igual ruta                       {if(mkdisco->path==""){mkdisco->path=$3;} $$=mkdisco;};

COMRMDISK:  pathh igual cadena COMRMDISK            {if(rmdisco->path==""){rmdisco->path=$3;} $$=rmdisco;};
            |pathh igual ruta COMRMDISK             {if(rmdisco->path==""){rmdisco->path=$3;} $$=rmdisco;};
            |pathh igual cadena                     {if(rmdisco->path==""){rmdisco->path=$3;} $$=rmdisco;};
            |pathh igual ruta                       {if(rmdisco->path==""){rmdisco->path=$3;} $$=rmdisco;};

COMFDISK:   sizee igual numero COMFDISK             {int tam=atoi($3); if(fdisco->primero==""){fdisco->primero="s";} if(fdisco->size==0){fdisco->size=tam;} $$=fdisco;};
            |u igual K  COMFDISK                    {if(fdisco->u==""){fdisco->u=$3;} $$=fdisco;};
            |u igual M  COMFDISK                    {if(fdisco->u==""){fdisco->u=$3;} $$=fdisco;};
            |u igual B  COMFDISK                    {if(fdisco->u==""){fdisco->u=$3;} $$=fdisco;};
            |pathh igual cadena COMFDISK            {if(fdisco->path==""){fdisco->path=$3;} $$=fdisco;};
            |pathh igual ruta COMFDISK              {if(fdisco->path==""){fdisco->path=$3;} $$=fdisco;};
            |typee igual PP COMFDISK                {if(fdisco->tipo==""){fdisco->tipo=$3;} $$=fdisco;};
            |typee igual E  COMFDISK                {if(fdisco->tipo==""){fdisco->tipo=$3;} $$=fdisco;};
            |typee igual L  COMFDISK                {if(fdisco->tipo==""){fdisco->tipo=$3;} $$=fdisco;};
            |f igual BF COMFDISK                    {fdisco->f=$3; $$=fdisco;};
            |f igual FF COMFDISK                    {fdisco->f=$3; $$=fdisco;};
            |f igual WF COMFDISK                    {fdisco->f=$3; $$=fdisco;};
            |deletee igual FAST COMFDISK            {if(fdisco->borrar==""){fdisco->borrar=$3;} $$=fdisco;};
            |deletee igual FULL COMFDISK            {if(fdisco->borrar==""){fdisco->borrar=$3;} $$=fdisco;};
            |namee igual cadena COMFDISK            {if(fdisco->nombre==""){fdisco->nombre=$3;} $$=fdisco;};
            |namee igual ident COMFDISK             {if(fdisco->nombre==""){fdisco->nombre=$3;} $$=fdisco;};
            |addd igual numero COMFDISK             {int tam=atoi($3); if(fdisco->primero==""){fdisco->primero="a";} if(fdisco->agregar==0){fdisco->agregar=tam;} $$=fdisco;};
            |addd igual negativo numero COMFDISK    {int tam=atoi($4); if(fdisco->primero==""){fdisco->primero="a";} if(fdisco->agregar==0){fdisco->agregar=tam * -1;} $$=fdisco;};
            |sizee igual numero                     {int tam=atoi($3); if(fdisco->primero==""){fdisco->primero="s";} if(fdisco->size==0){fdisco->size=tam;} $$=fdisco;};
            |u igual K                              {if(fdisco->u==""){fdisco->u=$3;} $$=fdisco;};
            |u igual M                              {if(fdisco->u==""){fdisco->u=$3;} $$=fdisco;};
            |u igual B                              {if(fdisco->u==""){fdisco->u=$3;} $$=fdisco;};
            |pathh igual cadena                     {if(fdisco->path==""){fdisco->path=$3;} $$=fdisco;};
            |pathh igual ruta                       {if(fdisco->path==""){fdisco->path=$3;} $$=fdisco;};
            |typee igual PP                         {if(fdisco->tipo==""){fdisco->tipo=$3;} $$=fdisco;};
            |typee igual E                          {if(fdisco->tipo==""){fdisco->tipo=$3;} $$=fdisco;};
            |typee igual L                          {if(fdisco->tipo==""){fdisco->tipo=$3;} $$=fdisco;};
            |f igual BF                             {if(fdisco->f==""){fdisco->f=$3;} $$=fdisco;};
            |f igual FF                             {if(fdisco->f==""){fdisco->f=$3;} $$=fdisco;};
            |f igual WF                             {if(fdisco->f==""){fdisco->f=$3;} $$=fdisco;};
            |deletee igual FAST                     {if(fdisco->borrar==""){fdisco->borrar=$3;} $$=fdisco;};
            |deletee igual FULL                     {if(fdisco->borrar==""){fdisco->borrar=$3;} $$=fdisco;};
            |namee igual cadena                     {if(fdisco->nombre==""){fdisco->nombre=$3;} $$=fdisco;};
            |namee igual ident                      {if(fdisco->nombre==""){fdisco->nombre=$3;} $$=fdisco;};
            |addd igual numero                      {int tam=atoi($3); if(fdisco->primero==""){fdisco->primero="a";} if(fdisco->agregar==0){fdisco->agregar=tam;} $$=fdisco;};
            |addd igual negativo numero             {int tam=atoi($4); if(fdisco->primero==""){fdisco->primero="a";} if(fdisco->agregar==0){fdisco->agregar=tam * 1;} $$=fdisco;};


COMMOUNT:   pathh igual cadena COMMOUNT             {if(mountdisco->ruta==""){mountdisco->ruta=$3;} $$=mountdisco;};

    |pathh igual ruta COMMOUNT              {if(mountdisco->ruta==""){mountdisco->ruta=$3;} $$=mountdisco;};
    |namee igual cadena COMMOUNT            {if(mountdisco->nombre==""){mountdisco->nombre=$3;} $$=mountdisco;};
    |namee igual ident COMMOUNT             {if(mountdisco->nombre==""){mountdisco->nombre=$3;} $$=mountdisco;};
    |pathh igual cadena                     {if(mountdisco->ruta==""){mountdisco->ruta=$3;} $$=mountdisco;};
    |pathh igual ruta                       {if(mountdisco->ruta==""){mountdisco->ruta=$3;} $$=mountdisco;};
    |namee igual cadena                     {if(mountdisco->nombre==""){mountdisco->nombre=$3;} $$=mountdisco;};
    |namee igual ident                      {if(mountdisco->nombre==""){mountdisco->nombre=$3;} $$=mountdisco;};

COMUNMOUNT: id igual idp COMUNMOUNT         {if(unmountdisco->id==""){unmountdisco->id=$3;} $$=unmountdisco;};
    |id igual idp                           {if(unmountdisco->id==""){unmountdisco->id=$3;} $$=unmountdisco;};

%%
