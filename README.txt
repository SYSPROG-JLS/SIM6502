
Hello Retro Computing Fans


If you ever wrote 6502 Assembler Code for the Apple II or the Commodore 64
and you are into running MVS 3.8J under Hercules then
you will love this 6502 Sim that I wrote that runs under our beloved 
IBM Operating System.

Right Up Front I will tell you that...

I can NOT take kudos for writing the actual emulator core called Fake6502.

That credit goes to: Mike Chambers (miker00lz@gmail.com). 

/* Fake6502 CPU emulator core v1.1 ******************* 
 * (c)2011 Mike Chambers (miker00lz@gmail.com)       * 
 ***************************************************** 
 * v1.1 - Small bugfix in BIT opcode, but it was the * 
 *        difference between a few games in my NES   * 
 *        emulator working and being broken!         * 
 *        I went through the rest carefully again    * 
 *        after fixing it just to make sure I didn't * 
 *        have any other typos! (Dec. 17, 2011)      * 
 *                                                   * 
 * v1.0 - First release (Nov. 24, 2011)              * 
 ***************************************************** 
 * LICENSE: This source code is released into the    * 
 * public domain, but if you use it please do give   * 
 * credit. I put a lot of effort into writing this!  * 
 *                                                   * 
 ***************************************************** 
 * Fake6502 is a MOS Technology 6502 CPU emulation   * 
 * engine in C. It was written as part of a Nintendo * 
 * Entertainment System emulator I've been writing.  * 
 *                                                   * 


I wrote the wrapper c code around Fake6502.


Here are the datasets you will need to create:

DATA-SET-NAME------- ORG FRMT LRECL BLKSZ  CONTENTS
SIM6502.CNTL         PO  FB    80   6160   Compile JCL and Run JCL
SIM6502.HEXIN        PS  F     80   80     Text file containing 6502 INTEL HEX machine code
SIM6502.INCLUDE      PO  VB    255  6233   c headers
SIM6502.LINKLIB      PO  U          6144   where the executable lives
SIM6502.SOURCE       PO  VB    255  6233   c source code

I chose "SIM6502" as my HLQ but you can choose another if you like.


Installation Instructions:
------------ ------------

1) Allocate the above datasets. 
   Put them on either TSO001 or TSO002 if you are using MVS Turnkey 5.

2) Using File Transfer from within your terminal emulator or an FTP client:
   Copy the .c modules to the SOURCE PDS.
   Copy the .h modules to the INCLUDE PDS. 
   Copy the .jcl modules to the CNTL PDS.

3) Make any local mods needed to the JCL GCC6502 in SIM6502.CNTL and submit to compile/link the SIM6502 executable into SIM6502.LINKLIB.

4) Using whatever means you like, copy the contents of SAMPLE.hex to SIM6502.HEXIN.

5) Make any local mods needed to the JCL RUN6502 in SIM6502.CNTL and submit to verify correct installation.
You should see output that looks like this:

IEF375I  JOB /SIMRUN  / START 24301.1312
IEF376I  JOB /SIMRUN  / STOP  24301.1312 CPU    0MIN 00.03SEC SRB    0MIN 00.00SEC
SIM6502 - INITIALIZE VIRTUAL RAM
SIM6502 - CALL INTEL HEX FILE LOADER
INTEL HEX LOADER - STARTING
OPEN HEXIN FILE

buff: :11020000AD00C0C900D015AD01C0C930F0068D01D017

numbytes: 11
addr: 0200

buff: :100211004C0702A9008D01D04C0002A9FF8D00D02E

numbytes: 10
addr: 0211

buff: :030221004C1E026E

numbytes: 03
addr: 0221
INTEL HEX LOADER - FINISHED
SIM6502 - TRY TO OPEN INPUT FILE MYDATA
SIM6502 - RESET THE 6502 CORE
SIM6502 - RUN THE SIMULATOR
SIM6502 INPUT FROM MYDATA: ABCDEF0

SIM6502 OUTPUT: ABCDEF
SIM6502 INPUT FROM MYDATA: GHIJKLMNOPQR0

SIM6502 OUTPUT: GHIJKLMNOPQR

-------------------------------------------------------------------------------------------

If you see the above in your listing, CONGRATULATIONS you have correctly installed SIM6502!

Proceed to README.io to learn how to to perform I/O to and from your 6502 code.


