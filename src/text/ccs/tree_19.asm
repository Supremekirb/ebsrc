
CC_19_TREE: ;$C179AA
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TXA
	CMP #$0002
	BEQL @UNKNOWN24
	CMP #$0004
	BEQL @UNKNOWN25
	CMP #$0005
	BEQL @UNKNOWN26
	CMP #$0010
	BEQL @UNKNOWN27
	CMP #$0011
	BEQL @UNKNOWN28
	CMP #$0014
	BEQL @UNKNOWN29
	CMP #$0016
	BEQL @UNKNOWN30
	CMP #$0018
	BEQL @UNKNOWN31
	CMP #$0019
	BEQL @UNKNOWN32
	CMP #$001A
	BEQL @UNKNOWN33
	CMP #$001B
	BEQL @UNKNOWN34
	CMP #$001C
	BEQL @UNKNOWN35
	CMP #$001D
	BEQL @UNKNOWN36
	CMP #$001E
	BEQL @UNKNOWN37
	CMP #$001F
	BEQL @UNKNOWN38
	CMP #$0020
	BEQL @UNKNOWN39
	CMP #$0021
	BEQL @UNKNOWN40
	CMP #$0022
	BEQL @UNKNOWN41
	CMP #$0023
	BEQL @UNKNOWN42
	CMP #$0024
	BEQL @UNKNOWN43
	CMP #$0025
	BEQL @UNKNOWN44
	CMP #$0026
	BEQL @UNKNOWN45
	CMP #$0027
	BEQL @UNKNOWN46
	CMP #$0028
	BEQL @UNKNOWN47
	JMP @UNKNOWN48
@UNKNOWN24:
	LDA #.LOWORD(CC_19_02)
	JMP @UNKNOWN49
@UNKNOWN25:
	JSR a:.LOWORD(UNKNOWN_C11383)
	JMP @UNKNOWN48
@UNKNOWN26:
	LDA #.LOWORD(CC_19_05)
	JMP @UNKNOWN49
@UNKNOWN27:
	LDA #.LOWORD(CC_19_10)
	JMP @UNKNOWN49
@UNKNOWN28:
	LDA #.LOWORD(CC_19_11)
	JMP @UNKNOWN49
@UNKNOWN29:
	JSR a:.LOWORD(GET_SECONDARY_MEMORY)
.IF .DEFINED(JPN)
	DEC
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA a:game_state::escargo_express_items,X
.ELSE
	TAX
	DEX
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(GAME_STATE)+game_state::escargo_express_items,X
.ENDIF
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	JSR a:.LOWORD(INCREMENT_SECONDARY_MEMORY)
	JMP @UNKNOWN48
@UNKNOWN30:
	LDA #.LOWORD(CC_19_16)
	JMP @UNKNOWN49
@UNKNOWN31:
	LDA #.LOWORD(CC_19_18)
	JMP @UNKNOWN49
@UNKNOWN32:
	LDA #.LOWORD(CC_19_19)
	JMP @UNKNOWN49
@UNKNOWN33:
	LDA #.LOWORD(CC_19_1A)
	JMP @UNKNOWN49
@UNKNOWN34:
	LDA #.LOWORD(CC_19_1B)
	JMP @UNKNOWN49
@UNKNOWN35:
	LDA #.LOWORD(CC_19_1C)
	BRA @UNKNOWN49
@UNKNOWN36:
	LDA #.LOWORD(CC_19_1D)
	BRA @UNKNOWN49
@UNKNOWN37:
	JSR a:.LOWORD(UNKNOWN_C1AD26)
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	BRA @UNKNOWN48
@UNKNOWN38:
	JSR a:.LOWORD(UNKNOWN_C1AD02)
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	BRA @UNKNOWN48
@UNKNOWN39:
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 .LOWORD(GAME_STATE)+game_state::player_controlled_party_count, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	BRA @UNKNOWN48
@UNKNOWN40:
	LDA #.LOWORD(CC_19_21)
	BRA @UNKNOWN49
@UNKNOWN41:
	LDA #.LOWORD(CC_19_22)
	BRA @UNKNOWN49
@UNKNOWN42:
	LDA #.LOWORD(CC_19_23)
	BRA @UNKNOWN49
@UNKNOWN43:
	LDA #.LOWORD(CC_19_24)
	BRA @UNKNOWN49
@UNKNOWN44:
	LDA #.LOWORD(CC_19_25)
	BRA @UNKNOWN49
@UNKNOWN45:
	LDA #.LOWORD(CC_19_26)
	BRA @UNKNOWN49
@UNKNOWN46:
	LDA #.LOWORD(CC_19_27)
	BRA @UNKNOWN49
@UNKNOWN47:
	LDA #.LOWORD(CC_19_28)
	BRA @UNKNOWN49
@UNKNOWN48:
	LDA #$0000
@UNKNOWN49:
	PLD
	RTS
