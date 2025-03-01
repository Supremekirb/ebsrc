
CC_1F_66: ;$C1711C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 21
	STX $13
	LDA #$0005
	CLC
	SBC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	BRANCHLTEQS @UNKNOWN2
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX CC_ARGUMENT_GATHERING_LOOP_COUNTER
	STA CC_ARGUMENT_STORAGE,X
	REP #PROC_FLAGS::ACCUM8
	INC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	LDA #.LOWORD(CC_1F_66)
	JMP @UNKNOWN7
@UNKNOWN2:
	LDA CC_ARGUMENT_STORAGE
	AND #$00FF
	BEQ @UNKNOWN3
	SEP #PROC_FLAGS::ACCUM8
	STORE_INT832 $06
	BRA @UNKNOWN4
@UNKNOWN3:
	JSR GET_ARGUMENT_MEMORY
@UNKNOWN4:
	SEP #PROC_FLAGS::ACCUM8
	LDA $06
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA CC_ARGUMENT_STORAGE+1
	AND #$00FF
	BEQ @UNKNOWN5
	SEP #PROC_FLAGS::ACCUM8
	STORE_INT832 $06
	BRA @UNKNOWN6
@UNKNOWN5:
	JSR GET_WORKING_MEMORY
@UNKNOWN6:
	SEP #PROC_FLAGS::ACCUM8
	LDA $06
	STA $12
	LDX $13
	REP #PROC_FLAGS::ACCUM8
	TXA
	STORE_INT1632 $06
	SEP #PROC_FLAGS::INDEX8
	LDY #$0018
	JSL ASL32_ENTRY2
	PUSH32 $06
	LDY #$0010
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 CC_ARGUMENT_STORAGE+4, $06
	REP #PROC_FLAGS::ACCUM8
	JSL ASL32_ENTRY2
	PUSH32 $06
	LDY #$0008
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 CC_ARGUMENT_STORAGE+3, $06
	REP #PROC_FLAGS::ACCUM8
	JSL ASL32_ENTRY2
	MOVE_INT $06, $0A
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 CC_ARGUMENT_STORAGE+2, $06
	REP #PROC_FLAGS::ACCUM8
	OR_INT_ASSIGN $06, $0A
	PULL32 $0A
	OR_INT_ASSIGN $06, $0A
	PULL32 $0A
	OR_INT_ASSIGN $06, $0A
	MOVE_INT $06, $0E
	LDA $12
	AND #$00FF
	REP #PROC_FLAGS::INDEX8
	TAX
	LDA $00
	AND #$00FF
	JSL ACTIVATE_HOTSPOT
	LDA #NULL
@UNKNOWN7:
	PLD
	RTS
