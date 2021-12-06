#ifndef STRUCTS_H
#define STRUCTS_H
#include <time.h>
#include "string.h"
#include <string>


struct particionMontada{
    int numero;
    int estado;
    int type = -1; //ext2 = 0, ex3= 1
    char nombre[16] = "";

};

struct particion{
    char part_status;
    char part_type;
    char part_fit;
    int part_start;
    int part_size;
    char part_name[16];

};

struct MBR{
    int mbr_size;
    time_t mbr_fecha_creacion;
    int mbr_disk_signature;
    char disk_fit;
    particion mbr_particion[4];

};

struct EBR{
    char part_status = '0';
    char part_fit = '0';
    int part_start = -1;
    int part_size = 0;
    int part_next = -1;
    char part_name[16];
};

struct  id_disco{
    std::string t_carne = "58";
    int numero_id = 1;
    char letra_id = 'A';
};



#endif // MBRSTRUCT_H