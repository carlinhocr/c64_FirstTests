; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28, $32 
        BYTE    $33, $30, $34, $29, $00, $00, $00

*=$0900

SCREEN_Start_Location = $0400
SCREEN_Start_Location2 = $0518

VAR_BINARY = %01010101
VAR_HEX = $2A
VAR_OCTAL = @35
VAR_DECIMAL = 1234

Start
        ldy #0 ; load y record
@Looper
        tya ; transfer y record to accumulator
        sta SCREEN_Start_Location,y ; store accumulator
        iny ; increment y register
        bne @Looper ; branch on result non zero
        ;rts ; return from subprogram

SecondDrawingReverse
        ldy #0 ; load y record
@Looper2
        tya ; transfer y record to accumulator
        sta SCREEN_Start_Location2,y ; store accumulator
        iny ; decrement y register
        bne @Looper2 ; branch on result non zero
        rts ; return from subprogram

