
; A: unknown_A97D*
BATTLE_PSI_MENU: ;$C1CBCD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 34
	STA $04
	STA $20
	STZ $1E
@UNKNOWN0:
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN10
	LDA #$0000
	STA $1C
	BRA @UNKNOWN2
@UNKNOWN1:
	TAX
	INX
	STX $1A
	LOADPTR PSI_CATEGORIES, $06
	LDA $1C
	ASL
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	TXA
	JSR a:.LOWORD(UNKNOWN_C115F4)
	LDX $1A
	TXA
	STA $1C
@UNKNOWN2:
	CMP #$0003
	BCC @UNKNOWN1
	LDY #$0000
	TYX
	LDA #$0001
	JSR a:.LOWORD(UNKNOWN_C1180D)
@UNKNOWN3:
	LDA #$0010
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	LDA $1E
	BNE @UNKNOWN4
	JSR a:.LOWORD(PRINT_MENU_ITEMS)
@UNKNOWN4:
	INC $1E
	LOADPTR UNKNOWN_C1CAF5, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	STA $02
	JSR a:.LOWORD(UNKNOWN_C11F8A)
	LDA $02
	BNE @UNKNOWN5
	JMP @UNKNOWN18
@UNKNOWN5:
	LDA $20
	STA $04
	LDX $04
	LDA a:unknown_A97D::unknown0,X
	AND #$00FF
	TAX
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C1CB7F)
	CMP #$0000
	BEQ @UNKNOWN3
@UNKNOWN6:
	CREATE_WINDOW_NEAR #WINDOW::TEXT_STANDARD
	LDA $02
	JSL UNKNOWN_C1CAF5
	LOADPTR UNKNOWN_C1C8BC, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	TAY
	STY $1C
	JSR a:.LOWORD(UNKNOWN_C11F8A)
	LDY $1C
	BNE @UNKNOWN7
	JMP @UNKNOWN14
@UNKNOWN7:
	LDX #$0006
	TYA
	JSR .LOWORD(UNKNOWN_C1CA72)
	LOADPTR BATTLE_ACTION_TABLE, $06
	LDY $1C
	TYA
	OPTIMIZED_MULT $04, 15
	TAX
	INX
	INX
	INX
	INX
	LDA f:PSI_ABILITY_TABLE,X
	OPTIMIZED_MULT $04, 12
	STA $18
	LDA $20
	STA $04
	LDX $04
	LDA a:unknown_A97D::unknown0,X
	AND #$00FF
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA $18
	INC
	INC
	INC
	MOVE_INTY $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	CMP .LOWORD(CHAR_STRUCT)+char_struct::current_pp_target,X
	BCC @UNKNOWN8
	BEQ @UNKNOWN8
	CREATE_WINDOW_NEAR #WINDOW::TEXT_BATTLE
	LDA #$0002
	JSR a:.LOWORD(ENABLE_BLINKING_TRIANGLE)
	DISPLAY_TEXT_PTR TEXT_NOT_ENOUGH_PP
	JSR a:.LOWORD(CLEAR_BLINKING_PROMPT)
	JSR a:.LOWORD(CLOSE_FOCUS_WINDOW)
	LDX #$0000
	STX $16
	JMP @UNKNOWN15
@UNKNOWN8:
	LDA $18
	INC
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	TAX
	CPX #$0001
	BEQ @UNKNOWN9
	CPX #$0003
	BNE @UNKNOWN10
@UNKNOWN9:
	LDY $1C
	TYA
	OPTIMIZED_MULT $04, 15
	TAX
	INX
	INX
	INX
	INX
	LDA f:PSI_ABILITY_TABLE,X
	OPTIMIZED_MULT $04, 12
	TAX
	LDA f:BATTLE_ACTION_TABLE,X
	AND #$00FF
	BNE @UNKNOWN10
	LDA #$0010
	JSL CLOSE_WINDOW
	LDA #$0004
	JSL CLOSE_WINDOW
	LDA #$0001
	JSL CLOSE_WINDOW
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN26
	JSL SET_9622_ONE
	LDA #$0006
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	LDY $1C
	TYA
	JSR a:.LOWORD(UNKNOWN_C1CA06)
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C10FEA)
@UNKNOWN10:
	LOADPTR PSI_ABILITY_TABLE, $06
	LDY $1C
	TYA
	OPTIMIZED_MULT $04, 15
	INC
	INC
	INC
	INC
	CLC
	ADC $06
	STA $06
	LDA $20
	STA $04
	LDX $04
	LDA a:unknown_A97D::unknown0,X
	AND #$00FF
	TAX
	LDA [$06]
	JSR a:.LOWORD(DETERMINE_TARGETTING)
	TAX
	STX $16
	LDA [$06]
	OPTIMIZED_MULT $04, 12
	TAX
	LDA f:BATTLE_ACTION_TABLE,X
	AND #$00FF
	BNE @UNKNOWN11
	LDA #$0026
	JSL CLOSE_WINDOW
	BRA @UNKNOWN12
@UNKNOWN11:
	LDA #$0010
	JSL CLOSE_WINDOW
	LDA #$0004
	JSL CLOSE_WINDOW
	LDA #$0001
	JSL CLOSE_WINDOW
@UNKNOWN12:
	LDX $16
	TXA
	AND #$00FF
	BNE @UNKNOWN13
	JMP @UNKNOWN0
@UNKNOWN13:
	BRA @UNKNOWN15
@UNKNOWN14:
	LDX #$0001
	STX $16
@UNKNOWN15:
	CPX #$0000
	BNE @UNKNOWN16
	JMP @UNKNOWN6
@UNKNOWN16:
	LDA #$0004
	JSL CLOSE_WINDOW
	LDY $1C
	BNE @UNKNOWN17
	JMP @UNKNOWN3
@UNKNOWN17:
	TYA
	SEP #PROC_FLAGS::ACCUM8
	LDX $20
	STX $04
	STA a:unknown_A97D::unknown1,X
	REP #PROC_FLAGS::ACCUM8
	TYA
	OPTIMIZED_MULT $04, 15
	TAX
	INX
	INX
	INX
	INX
	LDA f:PSI_ABILITY_TABLE,X
	LDX $20
	STX $04
	STA a:unknown_A97D::unknown2,X
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0008
	PHA
	LDX $16
	REP #PROC_FLAGS::ACCUM8
	TXA
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR8_UNKNOWN1
	SEP #PROC_FLAGS::ACCUM8
	REP #PROC_FLAGS::INDEX8
	LDX $04
	STA a:unknown_A97D::unknown4,X
	LDX $16
	REP #PROC_FLAGS::ACCUM8
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX $04
	STA a:unknown_A97D::unknown5,X
	REP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA $02
@UNKNOWN18:
	LDA #$0001
	JSL CLOSE_WINDOW
	LDA #$0010
	JSL CLOSE_WINDOW
	LDA $02
	PLD
	RTS
