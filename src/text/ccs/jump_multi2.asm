
CC_1F_C0: ;$C16308
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STX $10
	TAY
	STY $0E
	JSR GET_WORKING_MEMORY
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BEQ @UNKNOWN1
	JSR GET_WORKING_MEMORY
	LDX $10
	TXA
	STORE_INT1632 $0A
	CLC
	LDA $06
	SBC $0A
	LDA $08
	SBC $0C
	BCS @UNKNOWN1
	JSR GET_WORKING_MEMORY
	LDA $06
	STA $02
	LDX $10
	TXA
	SEC
	SBC $02
	STA UNKNOWN_7E97D5
	LDY $0E
	STY $10
	JSR GET_WORKING_MEMORY
	LDA $06
	DEC
	ASL
	ASL
	PHA
	LDY $10
	MOVE_INT_YPTRSRC __BSS_START__, $06
	PLA
	CLC
	ADC $06
	STA $06
	STA __BSS_START__,Y
	LDA $08
	STA __BSS_START__+2,Y
	STZ CC_ARGUMENT_GATHERING_LOOP_COUNTER
	LDA #.LOWORD(UNKNOWN_C1621F)
	BRA @UNKNOWN2
@UNKNOWN1:
	LDY $0E
	MOVE_INT_YPTRSRC __BSS_START__, $06
	LDX $10
	TXA
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA __BSS_START__,Y
	LDA $08
	STA __BSS_START__+2,Y
	LDA #NULL
@UNKNOWN2:
	PLD
	RTS
