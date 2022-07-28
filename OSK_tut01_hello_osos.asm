; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28, $32 
        BYTE    $33, $30, $34, $29, $00, $00, $00

PRINT_LINE = $AB1E
*=$0900
        lda #<HELLOWORLD
        ldy #>HELLOWORLD
        jsr PRINT_LINE
        rts

HELLOWORLD
        text "hola osi!, holaaaaaaaaa "
        byte 13 ; add a carriege return
        text "como estan?"