
;void UNKNOWN_C444FB(char near *, void near *)
UNKNOWN_C444FB: ;$C444FB
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STX $1A
	STA $02
	JSL UNKNOWN_C43CAA
	LDA .LOWORD(UNKNOWN_7E9E25)
	STA $18
	LOADPTR FONT_PTR_TABLE, $06
	LDY #$002C
	LDA [$06],Y
	STA $16
	LDY #$002E
	LDA [$06],Y
	STA $14
	LDA #$0006
	STA $12
	LDA $02
	STA $0A
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $0C
	STZ $0D
	REP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA $04
	BRA @UNKNOWN1
@UNKNOWN0:
	AND #$00FF
	INC $02
	SEC
	SBC #CHAR::SPACE
	AND #$007F
	TAY
	MOVE_INT FONT_PTR_TABLE + .SIZEOF(font_table_entry) * FONT::TINY + font_table_entry::graphics, $06
	LDA $16
	JSL MULT16
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX $14
	LDA $12
	JSL UNKNOWN_C44B3A
	INC $04
@UNKNOWN1:
	LDX $02
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BNE @UNKNOWN0
	LDA $18
	STA $02
	BRA @UNKNOWN4
@UNKNOWN2:
	LDA $02
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7E3492)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDY $1A
	LDX #$0010
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	LDA $1A
	CLC
	ADC #$0008
	STA $1A
	LDA $02
	CMP #$0033
	BNE @UNKNOWN3
	LDA #$FFFF
	STA $02
@UNKNOWN3:
	INC $02
@UNKNOWN4:
	SEP #PROC_FLAGS::ACCUM8
	LDA [$0A]
	REP #PROC_FLAGS::ACCUM8
	INC $0A
	AND #$00FF
	BNE @UNKNOWN2
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL WAIT_UNTIL_NEXT_FRAME
	PLD
	RTL
