
SHOW_TITLE_SCREEN: ;$C3F3C5
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	TAX
	STX .LOWORD(UNKNOWN_7E9F75)
	LDA #$0000
	STA $04
	JSL UNKNOWN_C08726
	JSL UNKNOWN_C0927C
	BRA @UNKNOWN1
@UNKNOWN0:
	ASL
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #$8000
	STA a:.LOWORD(RAM),X
	LDA $1A
	INC
	STA $1A
	CMP #$001E
	BCC @UNKNOWN0
@UNKNOWN1:
	LDA #$000B
	JSL UNKNOWN_C08D79
	LDA #$0003
	JSL SET_OAM_SIZE
	LDY #$0000
	LDX #$5800
	TYA ;BG_TILEMAP_SIZE::NORMAL
	JSL SET_BG1_VRAM_LOCATION
	STZ a:.LOWORD(BG3_X_POS)
	STZ a:.LOWORD(BG3_Y_POS)
	STZ a:.LOWORD(BG2_Y_POS)
	STZ a:.LOWORD(BG2_X_POS)
	STZ a:.LOWORD(BG1_Y_POS)
	STZ a:.LOWORD(BG1_X_POS)
	JSL UPDATE_SCREEN
	STZ a:.LOWORD(BG3_X_POS)
	STZ a:.LOWORD(BG3_Y_POS)
	STZ a:.LOWORD(BG2_Y_POS)
	STZ a:.LOWORD(BG2_X_POS)
	STZ a:.LOWORD(BG1_Y_POS)
	STZ a:.LOWORD(BG1_X_POS)
	JSL UPDATE_SCREEN
	JSL UNKNOWN_C0EBE0
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0011
	STA a:.LOWORD(TM_MIRROR)
	JSL OAM_CLEAR
	.A16
	LDY #$0000
	TYX
	LDA #EVENT_SCRIPT::TITLE_SCREEN_1
	JSL INIT_ENTITY_WIPE
	STZ .LOWORD(UNKNOWN_7E9641)
	LDA .LOWORD(UNKNOWN_7E9F75)
	BNEL @UNKNOWN7
	SEP #PROC_FLAGS::ACCUM8
	STZ $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	JSL UNKNOWN_C08744
	SEP #PROC_FLAGS::ACCUM8
	LDA #$000F
	STA a:.LOWORD(INIDISP_MIRROR)
	JSL WAIT_UNTIL_NEXT_FRAME
	SEP #PROC_FLAGS::ACCUM8
	STZ a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	LOADPTR UNKNOWN_E1AE7C, $0E
	PROMOTENEARPTR $0200, $06
	REP #PROC_FLAGS::ACCUM8
	LDA #$0100
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	JSL DECOMP
	JSL UNKNOWN_C496F9
	SEP #PROC_FLAGS::ACCUM8
	STZ $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	LDX #$0100
	LDA #$003C
	JSL UNKNOWN_C496E7
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	LDX #$0000
	STX $18
	BRA @UNKNOWN4
@UNKNOWN3:
	JSL UNKNOWN_C426ED
	JSL UNKNOWN_C1004E
	LDX $18
	INX
	STX $18
@UNKNOWN4:
	STX $02
	REP #PROC_FLAGS::ACCUM8
	LDA #$003C
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN3
	BRA @UNKNOWN11
@UNKNOWN7:
	LDX #$0001
	LDA #$0004
	JSL FADE_IN
	LDX #$0000
	STX $1A
	BRA @UNKNOWN9
@UNKNOWN8:
	JSL UNKNOWN_C1004E
	LDX $1A
	INX
	STX $1A
@UNKNOWN9:
	STX $02
	LDA #$003C
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN8
@UNKNOWN11:
	LDA #$0000
	STA $02
	BRA @UNKNOWN15
@UNKNOWN12:
	LDA $04
	BNE @UNKNOWN14
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON
	BNE @UNKNOWN13
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::B_BUTTON
	BNE @UNKNOWN13
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::START_BUTTON
	BEQ @UNKNOWN14
@UNKNOWN13:
	LDA #$0001
	STA $02
	BRA @UNKNOWN16
@UNKNOWN14:
	JSL UNKNOWN_C1004E
@UNKNOWN15:
	LDA .LOWORD(UNKNOWN_7E9641)
	BEQ @UNKNOWN12
	LDA .LOWORD(UNKNOWN_7E9641)
	CMP #$0002
	BEQ @UNKNOWN12
@UNKNOWN16:
	LDA .LOWORD(UNKNOWN_7E9F75)
	BNE @UNKNOWN17
	LDA .LOWORD(UNKNOWN_7E9641)
	BNE @UNKNOWN17
	JSL UNKNOWN_EF04DC
	STA $02
@UNKNOWN17:
	LDY #$0000
	LDX #$0004
	LDA #$0001
	JSL FADE_OUT_WITH_MOSAIC
	LDA $04
	BNE @UNKNOWN18
	STZ .LOWORD(UNKNOWN_7E9641)
	LDA #$0000
	JSL UNKNOWN_C474A8
	JSL UNKNOWN_C0927C
	LDA $02
	BRA @UNKNOWN23
@UNKNOWN18:
	LDY #$0000
	STY $16
	BRA @UNKNOWN22
@UNKNOWN19:
	TYA
	ASL
	TAX
	LDA .LOWORD(ENTITY_SCRIPT_TABLE),X
	CMP #EVENT_SCRIPT::TITLE_SCREEN_1
	BCC @UNKNOWN21
	CMP #EVENT_SCRIPT::TITLE_SCREEN_11
	BEQ @UNKNOWN20
	BCS @UNKNOWN21
@UNKNOWN20:
	TYA
	JSL UNKNOWN_C09C35
@UNKNOWN21:
	LDY $16
	TYA
	ASL
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$7FFF
	STA a:.LOWORD(RAM),X
	INY
	STY $16
@UNKNOWN22:
	CPY #$001E
	BCC @UNKNOWN19
	JSL UNKNOWN_C08726
	JSL RELOAD_MAP
	JSL UNDRAW_FLYOVER_TEXT
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0017
	STA a:.LOWORD(TM_MIRROR)
	LDX #$0001
	REP #PROC_FLAGS::ACCUM8
	TXA
	JSL FADE_IN
@UNKNOWN23:
	PLD
	RTL
