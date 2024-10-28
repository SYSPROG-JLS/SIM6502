// sim6502.c

#include <stdio.h>
#include <stdint.h>
#include "fake6502.h"
#include "intel.h"
#include "trnsform.h"


uint8_t ram[768];
char str[30];
int rc;
int rp;
int exitsim = 0;
char prtbuf[256];
int prtbufptr = 0;

FILE *fp;
char ibuff[81];
int ibuffptr = 0;
int mydataopened = 0;


void initram() {
  for(rp=0; rp<sizeof(ram); rp++) {
    ram[rp] = 0x00;
  }
  return;
}


uint8_t read6502(uint16_t address) {
//  setup the reset vector
    if (address == 0xFFFC) return 0x00;
    if (address == 0xFFFD) return 0x02;

//  a read at 0xC000 is a request to read the first (next) record
//  from the input file mydata and perform an Ebcdic to Ascii transform
    if (address == 0xC000) {
       if (fgets(ibuff, 80, fp) != NULL) {
          printf("SIM6502 INPUT FROM MYDATA: %s\n", ibuff);
          inSituEbcdicToAscii(ibuff);
          ibuffptr = -1;
          return 0x00;    // return 0x00 for a good read
       }
       else {
          return 0xFF;    // return 0xFF for a bad read or EOF
       }
    }

//  a read at address 0xC001 means
//  return the next byte from the current mydata record
    if (address == 0xC001) {
       ibuffptr++;
       return ibuff[ibuffptr];
    }

//  otherwise just return the byte at the virtual RAM address
    return ram[address];
}


void write6502(uint16_t address, uint8_t value){
// look for a write to the exit sim address
    if (address == 0xD000) {
      exitsim = 1;
      return;
    }

// a write at address 0xD001 indicates a write to SYSOUT
// 6502 code performs a LDA followed by a STA $D001
// to place the output byte into prtbuf
// storing a NULL triggers the Ascii to Ebcdic conversion
// and the printf
    if (address == 0xD001) {
      if (value == 0x00) {
        prtbuf[prtbufptr] = '\0';
        inSituAsciiToEbcdic(prtbuf);
        printf("SIM6502 OUTPUT: %s\n", prtbuf);
        prtbufptr = 0;
      }
      else {
        prtbuf[prtbufptr] = value;
        prtbufptr++;
      }
    }
    else {
      ram[address] = value;
    }

    return;
}


int main(void){
    printf ("SIM6502 - INITIALIZE VIRTUAL RAM\n");
//  initialize the virtual RAM to 0x00's
    initram();

    printf ("SIM6502 - CALL INTEL HEX FILE LOADER\n");
//  call the Intel Hex File loader to build the virtual RAM
    rc = intel(ram);
    if (rc > 0) {
      printf ("Bad rc from Hex file loader, rc = %d\n", rc);
      return rc;
    }

    printf ("SIM6502 - TRY TO OPEN INPUT FILE MYDATA\n");
//  try to open the input file mydata
    fp = fopen("dd:mydata", "r");
    if (fp == NULL) {
        printf ("Unable to open input file mydata\n");
    }
    else {
        mydataopened = 1;
    }

    printf ("SIM6502 - RESET THE 6502 CORE\n");
//  reset the 6502 core
    reset6502();

    printf ("SIM6502 - RUN THE SIMULATOR\n");
//  Execute a single instrution in a forever while loop
    while (1) {
      step6502();
      if (exitsim == 1) {
        break;
      }
    }

    if (mydataopened = 1) {
        fclose(fp);
    }
    return 0;
}

