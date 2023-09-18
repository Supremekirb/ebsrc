
COFFEETEA_SCENE: ;$C49D6A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STA $02
	LDY #$0000
	LDX #$0001
	TXA
	JSL FADE_OUT_WITH_MOSAIC
	JSL UNKNOWN_C49A56
	JSL OAM_CLEAR
	LDA $02
	BNE @SELECT_COFFEE_BG1
	LDX #BATTLEBG_LAYER::COFFEE2
	BRA @SKIP_COFFEE_BG1
@SELECT_COFFEE_BG1:
	LDX #BATTLEBG_LAYER::TEA2
@SKIP_COFFEE_BG1:
	LDA $02
	BNE @SELECT_COFFEE_BG2
	LDY #BATTLEBG_LAYER::COFFEE1
	BRA @SKIP_COFFEE_BG2
@SELECT_COFFEE_BG2:
	LDY #BATTLEBG_LAYER::TEA1
@SKIP_COFFEE_BG2:
	TYA
	JSL LOAD_BACKGROUND_ANIMATION
	LDX #$0001
	TXA
	JSL FADE_IN
	LDA #$001C
	STA UNKNOWN_7E9F2D
	LDA #$0000
	STA $04
	LDA $02
	BNE @SELECT_COFFEE_TEXT
	LOADPTR COFFEE_SEQUENCE_TEXT, $06
	BRA @SKIP_COFFEE_TEXT
@SELECT_COFFEE_TEXT:
	LOADPTR TEA_SEQUENCE_TEXT, $06
@SKIP_COFFEE_TEXT:
@SCRIPT_PARSE_BEGIN:
	LDA [$06]
	AND #$00FF
	STA $10
	INC $06
	CMP #$0000
	BEQL @END_OF_SCRIPT
	CMP #$0009
	BEQ @PARSE_09
	CMP #$0001
	BEQ @PARSE_01
	CMP #$0008
	BEQ @PARSE_08
	BRA @PRINT_TEXT
@PARSE_09:
	LDA $04
	JSL UNKNOWN_C49D1E
	TAX
	STX $0E
	LDA #$0012
	JSL UNKNOWN_C49B6E
	JSL UNKNOWN_C2DB3F
	BRA @UNKNOWN9
@UNKNOWN8:
	TXA
	JSL UNKNOWN_C49D1E
	TAX
	STX $0E
	JSR UNKNOWN_C49A4B
@UNKNOWN9:
	LDX $0E
	CPX #$1200
	BCC @UNKNOWN8
	TXA
	SEC
	SBC #$1200
	STA $04
	LDA #$0012
	JSL UNKNOWN_C49C56
	BRA @SCRIPT_PARSE_BEGIN
@PARSE_01:
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	JSL UNKNOWN_C49CA8
	BRA @SCRIPT_PARSE_BEGIN
@PARSE_08:
	LDA [$06]
	AND #$00FF
	TAY
	INC $06
	LDX #$000C
	TYA
	JSL UNKNOWN_C49CC3
	JMP @SCRIPT_PARSE_BEGIN
@PRINT_TEXT:
	LDA [$06]
	AND #$00FF
	TAX
	INC $06
	LDY #$000C
	LDA $10
	JSL UNKNOWN_C49D16
	JMP @SCRIPT_PARSE_BEGIN
@END_OF_SCRIPT:
	LDX #$0001
	TXA
	JSL FADE_OUT
	BRA @UNKNOWN15
@UNKNOWN14:
	JSR UNKNOWN_C49A4B
@UNKNOWN15:
	LDA UNKNOWN_7E0028
	AND #$00FF
	BNE @UNKNOWN14
	JSL UNKNOWN_C08726
	JSL RELOAD_MAP
	LDY #.LOWORD(BG2_BUFFER)
	LDX #$0380
	BRA @UNKNOWN17
@UNKNOWN16:
	LDA #$0000
	STA __BSS_START__,Y
	INY
	INY
	DEX
@UNKNOWN17:
	BNE @UNKNOWN16
	JSL UNKNOWN_C08726
	JSL UNDRAW_FLYOVER_TEXT
	JSL UNKNOWN_C08744
	LDX #$0001
	TXA
	JSL FADE_IN
	PLD
	RTL
