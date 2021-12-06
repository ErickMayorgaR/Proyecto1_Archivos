#include <iostream>
#include "Discos/rm_disk.hpp"



void ejecutar1();
rm_disk *disco = new rm_disk();


int main()
{
   
   disco->ejecutar();
   ejecutar1();
   return 0;
}

void ejecutar1(){
   std::cout<< "Mmm" << std::endl;
}