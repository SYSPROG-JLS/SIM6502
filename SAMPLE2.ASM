      .org $0200
rrec  .equ $C000
getb  .equ $C001
exit  .equ $D000
outp  .equ $D001
begin lda rrec
      cmp #$00
      bne done1
      ldx #0
loop  lda getb
      sta buf,x
      cmp #'#'
      beq docal
      inx
      jmp loop
docal sec
      ldx #0
      lda buf,x
      sbc #48 
      sta first
      inx 
      lda buf,x
      sta op
      inx
      lda buf,x
      sbc #48
      sta secnd
      lda op
      cmp #'+'
      beq doadd
dosub lda first
      sec
      sbc secnd
      sta res
      jmp prtr
doadd lda first
      clc
      adc secnd
      sta res
prtr  clc
      lda res
      adc #48
      sta buf+4
      lda #'='
      sta buf+3
      lda #'#'
      sta buf+5
      ldx #0
ploop lda buf,x
      cmp #'#'
      beq done
      sta outp
      inx
      jmp ploop
done  lda #$00
      sta outp
      jmp begin
done1 lda #$FF
dloop sta exit
      jmp dloop
buf   .ds 10
first .ds 1
op    .ds 1
secnd .ds 1
res   .ds 2
      .end
