
UNKNOWN_C1BB71: ;$C1BB71
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 28
@UNKNOWN0:
	LDA #$0001
	STA UNKNOWN_7E5E71
@UNKNOWN1:
	LOADPTR UNKNOWN_C1952F, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDX #$0001
	LDA #$0000
	JSR CHAR_SELECT_PROMPT
	TAX
	BEQL @UNKNOWN9
	CPX #$0003
	BEQ @UNKNOWN0
	LDA #$0000
	STA $02
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN2E
	LDA #$0000
	STA $1A
	BRA @UNKNOWN4
@UNKNOWN3:
	TAX
	INX
	STX $18
	LOADPTR PSI_CATEGORIES, $06
	LDA $1A
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
	JSR UNKNOWN_C115F4
	LDX $18
	TXA
	STA $1A
@UNKNOWN4:
	CMP #$0004
	BCC @UNKNOWN3
	LDY #$0000
	TYX
	LDA #$0001
	JSR UNKNOWN_C1180D
@UNKNOWN5:
	LDA #$002E
	JSR SET_WINDOW_FOCUS
	LDA $02
	BNE @UNKNOWN6
	JSR PRINT_MENU_ITEMS
	JSL WINDOW_TICK_WITHOUT_INSTANT_PRINTING
	INC $02
@UNKNOWN6:
	CREATE_WINDOW_NEAR #WINDOW::STATUS_MENU
	LDA #$002E
	STA CURRENT_FOCUS_WINDOW
	STZ UNKNOWN_7E5E71
	LOADPTR UNKNOWN_C1CAF5, $0E
	JSR UNKNOWN_C11F5A
	LDA #$0001
	JSR SELECTION_MENU
	TAX
	STX $16
	JSR UNKNOWN_C11F8A
	LDX $16
	BEQ @UNKNOWN8
	LDA #$0001
	JSR UNKNOWN_C12BD5
	CMP #$0000
	BEQ @UNKNOWN5
	LDA #$0001
	JSR SET_WINDOW_FOCUS
	LDA #$00FF
	STA UNKNOWN_7E9D19
	LOADPTR UNKNOWN_C1BB06, $0E
	JSR UNKNOWN_C11F5A
@UNKNOWN7:
	LDA #$0001
	JSR SELECTION_MENU
	CMP #$0000
	BNE @UNKNOWN7
	JSR UNKNOWN_C11F8A
	LDA #$0004
	JSL CLOSE_WINDOW
	LDA #$002F
	JSL CLOSE_WINDOW
	LDA #$00FF
	STA UNKNOWN_7E9D19
	JMP @UNKNOWN5
@UNKNOWN8:
	LDA #$002E
	JSL CLOSE_WINDOW
	LDA #$0001
	JSL CLOSE_WINDOW
	LDA #$0008
	STA CURRENT_FOCUS_WINDOW
	LDA #$0001
	STA UNKNOWN_7E5E71
	LDX $16
	BEQL @UNKNOWN1
@UNKNOWN9:
	LDA #$0008
	JSL CLOSE_WINDOW
	PLD
	RTS
