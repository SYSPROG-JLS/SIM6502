//SIMRUN   JOB CLASS=A,REGION=0K,MSGCLASS=A,MSGLEVEL=(1,1),
//         USER=HERC01,PASSWORD=xxxxxx
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
ABCDEF0
GHIJKLMNOPQR0
/*
//