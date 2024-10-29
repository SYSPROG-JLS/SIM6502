//SIMRUN   JOB CLASS=A,REGION=0K,MSGCLASS=A,MSGLEVEL=(1,1),
//         USER=HERC01,PASSWORD=xxxxxxx                     
//*                                                        
//RUN      EXEC PGM=SIM6502                                
//STEPLIB  DD DSN=SIM6502.LINKLIB,DISP=SHR                 
//HEXIN    DD DSN=SIM6502.HEXIN,DISP=SHR,                  
//            DCB=(RECFM=F,LRECL=80)                       
//SYSPRINT DD SYSOUT=*                                     
//SYSABEND DD SYSOUT=*                                     
//SYSTERM  DD SYSOUT=*                                     
//SYSIN    DD   DUMMY                                      
//MYDATA   DD *                                            
1+1#                                                       
3+5#                                                       
4-2#                                                       
5-2#                                                       
8+1#                                                       
/*                                                         
//                                                         

----------------------------------------------------

Here is the output from the job:

SIM6502 - INITIALIZE VIRTUAL RAM
SIM6502 - CALL INTEL HEX FILE LOADER
INTEL HEX LOADER - STARTING
OPEN HEXIN FILE

buff: :11020000AD00C0C900D074A200AD01C09D8302C92355

numbytes: 11
addr: 0200

buff: :11021100F004E84C090238A200BD8302E9308D8D0258

numbytes: 11
addr: 0211

buff: :10022200E8BD83028D8E02E8BD8302E9308D8F0224

numbytes: 10
addr: 0222

buff: :11023200AD8E02C92BF00DAD8D0238ED8F028D90027C

numbytes: 11
addr: 0232

buff: :110243004C5002AD8D02186D8F028D900218AD900244

numbytes: 11
addr: 0243

buff: :1102540069308D8702A93D8D8602A9238D8802A2006A

numbytes: 11
addr: 0254

buff: :10026500BD8302C923F0078D01D0E84C6502A900C2

numbytes: 10
addr: 0265

buff: :0E0275008D01D04C0002A9FF8D00D04C7D02FF

numbytes: 0E
addr: 0275
INTEL HEX LOADER - FINISHED
SIM6502 - TRY TO OPEN INPUT FILE MYDATA
SIM6502 - RESET THE 6502 CORE
SIM6502 - RUN THE SIMULATOR
SIM6502 INPUT FROM MYDATA: 1+1#

SIM6502 OUTPUT: 1+1=2
SIM6502 INPUT FROM MYDATA: 3+5#

SIM6502 OUTPUT: 3+5=8
SIM6502 INPUT FROM MYDATA: 4-2#

SIM6502 OUTPUT: 4-2=2
SIM6502 INPUT FROM MYDATA: 5-2#

SIM6502 OUTPUT: 5-2=3
SIM6502 INPUT FROM MYDATA: 8+1#

SIM6502 OUTPUT: 8+1=9


