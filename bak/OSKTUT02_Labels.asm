; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28, $32 
        BYTE    $33, $30, $34, $29, $00, $00, $00

*=$0900

SCREEN_Start_Location = $0400 + #120 ; start 3 lines below top screen
SCREEN_Start_Location2 = $0400 + #415 ;255 for all the character plus
                                      ;40 of the columns lenght
CLEAR_SCREEN = $E544
VAR_BINARY = %01010101
VAR_HEX = $2A
VAR_OCTAL = @35
VAR_DECIMAL = 1234
        jsr CLEAR_SCREEN ; execute the basic clear screen function
Start
        
        ldy #0 ; load y record
@Looper
        tya ; transfer y record to accumulator
        sta SCREEN_Start_Location,y ; store accumulator
        iny ; increment y register
        bne @Looper ; branch on result non zero
        

SecondDrawingReverse
        ldy #0 ; load y record for position
        ldx #255 ;load x record with decimal number 255
@Looper2
        txa ; transfer x record to accumulator
        sta SCREEN_Start_Location2,y ; store accumulator
        iny ; increment y register
        dex ; decrement x record to change the character
        bne @Looper2 ; branch on result non zero
;Extra excution for the case where y equal zero that does not the @
        txa ; transfer y record to accumulator
        sta SCREEN_Start_Location2,y ; store accumulator
        ; wait for keypress
        JSR PRESS_A_KEY
        rts ; return from subprogram

PRESS_A_KEY 
        lda $c6
        beq *-2
