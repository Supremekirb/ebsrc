
UNKNOWN_C2DE0F: ;$C2DE0F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDX #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	TXA
	ASL
	CLC
	ADC #.LOWORD(LOADED_BG_DATA_LAYER1)
	STA $12
	CLC
	ADC #$000C
	TAY
	LDA __BSS_START__,Y
	LSR
	AND #$3DEF
	STA __BSS_START__,Y
	LDA $12
	CLC
	ADC #$0083
	TAY
	LDA __BSS_START__,Y
	LSR
	AND #$3DEF
	STA __BSS_START__,Y
	INX
@UNKNOWN1:
	CPX #$0010
	BCC @UNKNOWN0
	PROMOTENEARPTR LOADED_BG_DATA_LAYER1 + loaded_bg_data::palette, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(loaded_bg_data::palette)
	LDA LOADED_BG_DATA_LAYER1 + loaded_bg_data::palette_pointer
	JSL MEMCPY16
	LDA LOADED_BG_DATA_LAYER2
	AND #$00FF
	BEQ @UNKNOWN2
	PROMOTENEARPTR LOADED_BG_DATA_LAYER2 + loaded_bg_data::palette, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(loaded_bg_data::palette)
	LDA LOADED_BG_DATA_LAYER2 + loaded_bg_data::palette_pointer
	JSL MEMCPY16
@UNKNOWN2:
	PLD
	RTL
