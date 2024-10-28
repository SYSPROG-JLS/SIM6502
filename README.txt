
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


