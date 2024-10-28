#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

int intel(uint8_t rarr[]) {

   FILE *fp;
   char buff[80];
   char zeros[3] = "00";
   char addr[5] = "0000";
   char numbytes[3] = "00";
   char z[3] = "00";
   int x;
   int i;
   uint8_t nb;
   uint16_t naddr;

   printf("INTEL HEX LOADER - STARTING\n");

/* strcpy(zeros, "00"); */

   printf("OPEN HEXIN FILE\n");

   fp = fopen("dd:hexin", "r");

   if (fp == NULL) {
       perror("Failed: ");
       return 1;
   }

   while (fgets(buff, 80, fp) != NULL) {

     printf(" \n");
     printf("buff: %s\n", buff);

     if (strncmp(buff+1, zeros, 2) == 0) {
       break;
     }

     strncpy(numbytes, buff+1, 2);
     printf("numbytes: %s\n", numbytes);

     strncpy(addr, buff+3, 4);
     printf("addr: %s\n", addr);

     x = (int)strtol(numbytes, NULL, 16);
     /* printf("x: %d\n", x); */

     naddr = (uint16_t)strtoul(addr, NULL, 16);
     /* printf("naddr: %d\n", naddr); */

     for (i=0; i<x*2; i=i+2) {
       strncpy(z, buff+9+i, 2);
       nb = (uint8_t)strtoul(z, NULL, 16);
       /* printf("address: %x  byte: %x\n", naddr, nb); */
       rarr[naddr] = nb;
       naddr++;
     }

   }

   fclose(fp);

   printf("INTEL HEX LOADER - FINISHED\n");

   return 0;
}
