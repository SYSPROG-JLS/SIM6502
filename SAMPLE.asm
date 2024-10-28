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
