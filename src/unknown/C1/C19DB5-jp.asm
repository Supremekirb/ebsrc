
UNKNOWN_C19DB5: ;$C19DB5
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STA $1A
	JSR SET_9622_ONE
	LDA #.LOWORD(UNKNOWN_7E9C8A)
	JSL UNKNOWN_C20A20
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN0C
	LDA #$0005
	JSR a:.LOWORD(UNKNOWN_C10EB4)
	LDA #$0000
	STA $04
	STA $18
	JMP @UNKNOWN3
@UNKNOWN0:
	LDA $1A
	OPTIMIZED_MULT $04, 7
	LDX $18
	STX $04
	CLC
	ADC $04
	TAX
	LDA f:STORE_TABLE,X
	AND #$00FF
	TAY
	STY $16
	BEQL @UNKNOWN2
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	TYA
	OPTIMIZED_MULT $04, .SIZEOF(item)
	STA $02
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	STA $0E
	LDA $0C
	STA $10
	LDX #.SIZEOF(item::name)
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	JSL MEMCPY16
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9C9F)+.SIZEOF(item::name)
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	STA $0A
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $0C
	STZ $0D
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $0A, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDY $16
	TYA
	JSR a:.LOWORD(UNKNOWN_C115F4)
	LDA $18
	STA $04
	LDX $04
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDA $02
	CLC
	ADC #$000B
	CLC
	ADC $06
	STA $06
	LDA [$06]
	STA $06
	STZ $08
	MOVE_INT $06, $0E
	JSR UNKNOWN_C11404
@UNKNOWN2:
	INC $04
	LDA $04
	STA $18
@UNKNOWN3:
	LDA $04
	CMP #$0007
	BCCL @UNKNOWN0
	LDX #$0000
	TXA
	JSR UNKNOWN_C438A5
	LDY #$0000
	TYX
	LDA #$0001
	JSR a:.LOWORD(UNKNOWN_C1180D)
	LOADPTR SET_HPPP_WINDOW_MODE_ITEM, $0E
	JSR a:.LOWORD(UNKNOWN_C11F5A)
	JSR a:.LOWORD(UNKNOWN_C19CDD)
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	TAX
	STX $16
	JSR a:.LOWORD(UNKNOWN_C19D49)
	JSR a:.LOWORD(CLOSE_FOCUS_WINDOW)
	LDA #.LOWORD(UNKNOWN_7E9C8A)
	JSL UNKNOWN_C20ABC
	JSR CLEAR_9622
	LDX $16
	TXA
	PLD
	RTS
