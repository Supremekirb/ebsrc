
UNKNOWN_C2E08E: ;$C2E08E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_PARAM_INT16
	END_STACK_VARS
	STA @VIRTUAL04
	LDA LOADED_BG_DATA_LAYER1 + loaded_bg_data::bitdepth
	AND #$00FF
	CMP #$0004
	BNE @UNKNOWN2
	LDA #$0001
	STA @VIRTUAL02
	BRA @UNKNOWN1
@UNKNOWN0:
	LDY @VIRTUAL02
	LDX @VIRTUAL04
	LDA #.LOWORD(LOADED_BG_DATA_LAYER1)
	JSR UNKNOWN_C2DF2E
	INC @VIRTUAL02
@UNKNOWN1:
	LDA @VIRTUAL02
	CMP #$0010
	BCC @UNKNOWN0
	BRA @UNKNOWN5
@UNKNOWN2:
	LDA #$0001
	STA @VIRTUAL02
	BRA @UNKNOWN4
@UNKNOWN3:
	LDY @VIRTUAL02
	LDX @VIRTUAL04
	LDA #.LOWORD(LOADED_BG_DATA_LAYER1)
	JSR UNKNOWN_C2DF2E
	LDY @VIRTUAL02
	LDX @VIRTUAL04
	LDA #.LOWORD(LOADED_BG_DATA_LAYER2)
	JSR UNKNOWN_C2DF2E
	INC @VIRTUAL02
@UNKNOWN4:
	LDA @VIRTUAL02
	CMP #$0004
	BCC @UNKNOWN3
@UNKNOWN5:
	PLD
	RTS
