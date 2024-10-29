SIM6502 I/O

In your 6502 code you have the ability to read strings into your program from MVS (MYDATA DD) and
write strings out to MVS (JES).

Let's have a closer look at SAMPLE.asm:

      .org $0200
rrec  .equ $C000
getb  .equ $C001
exit  .equ $D000
outp  .equ $D001
begin lda rrec
      cmp #$00
      bne done1
loop  lda getb
      cmp #'0'
      beq done
      sta outp
      jmp loop
done  lda #$00
      sta outp
      jmp begin
done1 lda #$FF
dloop sta exit
      jmp dloop
      .end

In order to accomplish this there are special addresses that tell SIM6502 to perform the read or write.


1) Reading data from MVS into your 6502 program:

   a) A read at address 0xC000 is a request to read the first (next) record
from the input file "mydata" and perform an Ebcdic to Ascii transform. 
After the Ebcdic to Ascii translation the record is left in a special buffer in SIM6502.

begin lda rrec     (rrec  .equ $C000)
      cmp #$00
      bne done1

A return code of 0x00 indicates a good read
A return code of 0xFF indicates a bad read

   b) A read at address 0xC001 means return the next byte from the current mydata record buffer. 

loop  lda getb     (getb  .equ $C001)
      cmp #'0'
      beq done

This code needs a bit of clarification.
Here is part of my RUN6502 JCL:

//MYDATA   DD *  
ABCDEF0          
GHIJKLMNOPQR0    
/*               
//               

What I'm doing is using a '0' to indicate end of valid data.
You don't have to do this - it is just what I felt like coding.
That's why you see the "cmp #'0' in the above code.


2) Writing data from your 6502 program to  MVS (JES):

   a) A write at address 0xD001 indicates a write to SYSOUT. 
Your 6502 code performs a LDA followed by a STA $D001       
to place the output byte into prtbuf.                  
   b) Storing a NULL (0x00) triggers the Ascii to Ebcdic conversion 
and the write to MVS (JES).                                      

As in the following code fragment:

      lda <next byte that you want to write out>
      sta outp      (outp  .equ $D001)
      ...
done  lda #$00
      sta outp

It is IMPORTANT to note that from a 6502 code standpoint you do
EVERYTHING in ASCII. SIM6502 handles all ASCII to EBCDIC and 
EBCDIC to ASCII translations for you.


Finally, in order to exit your 6502 code and cleanly end SIM6502 you need to code the
following:


done1 lda #$FF
dloop sta exit       (exit  .equ $D000)
      jmp dloop

Just load any value into the accumulator
then do a store accumulator to address $D000.
(in a loop as demonstrated above).



Next you will want to read about how you can use my 6502
Assembler to generate the INTEL HEX file.

Proceed to README.6502ASM
