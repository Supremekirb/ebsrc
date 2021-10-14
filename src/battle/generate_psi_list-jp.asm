
GENERATE_PSI_LIST: ;$C1C452
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 36
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $33
	STA $23
	LDA $32
	STA $01
	REP #PROC_FLAGS::ACCUM8
	TXA
	DEC
	STA $04
	STA $21
	JSR SET_9622_ONE
	JSR a:.LOWORD(UNKNOWN_C11383)
	STZ $1F
	LDA $04
	CMP #$0003
	BNEL @UNKNOWN5
	LDA $01
	AND #$00FF
	AND #$0002
	BEQL @UNKNOWN5
	LDA $23
	AND #$00FF
	AND #$0001
	BEQL @UNKNOWN5
	LDA .LOWORD(GAME_STATE)+game_state::party_psi
	AND #$00FF
	AND #$0002
	BEQL @UNKNOWN4
	LOADPTR PSI_ABILITY_TABLE+315, $06
	MOVE_INT $06, $1B
	LDA #$000A
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAX
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDA [$06]
	AND #$00FF
	JSR a:.LOWORD(GET_PSI_NAME)
	MOVE_INT $1B, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0001
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	DEC
	ASL
	PHA
	LOADPTR PSI_SUFFIXES, $06
	PLA
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	LDA [$0A]
	AND #$00FF
	TAY
	STY $19
	MOVE_INT $1B, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0009
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA #$0015
	LDY $19
	JSR a:.LOWORD(UNKNOWN_C1153B)
@UNKNOWN4:
	LDA .LOWORD(GAME_STATE)+game_state::party_psi
	AND #$00FF
	AND #$0004
	BEQ @UNKNOWN5
	LOADPTR PSI_ABILITY_TABLE+330, $06
	LOADPTR PSI_SUFFIXES, $0A
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0001
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	DEC
	ASL
	CLC
	ADC $0A
	STA $0A
	STA $0E
	LDA $0C
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	SEP #PROC_FLAGS::ACCUM8
	LDY #$000A
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	STY $19
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0009
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA #$0016
	LDY $19
	JSR a:.LOWORD(UNKNOWN_C1153B)
@UNKNOWN5:
	LDA #$0001
	STA $02
	JMP @UNKNOWN17
@UNKNOWN6:
	MOVE_INT $0A, $06
	LDA $21
	STA $04
	BEQ @UNKNOWN7
	CMP #$0001
	BEQ @UNKNOWN8
	CMP #$0003
	BEQ @UNKNOWN9
	BRA @UNKNOWN10
@UNKNOWN7:
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0006
	LDA [$0A],Y
	STA $00
	STA $18
	BRA @UNKNOWN10
@UNKNOWN8:
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0007
	LDA [$0A],Y
	STA $00
	STA $18
	BRA @UNKNOWN10
@UNKNOWN9:
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0008
	LDA [$0A],Y
	STA $00
	STA $18
@UNKNOWN10:
	SEP #PROC_FLAGS::ACCUM8
	LDA $18
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	BEQL @UNKNOWN16
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0003
	LDA [$06],Y
	AND $01
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQL @UNKNOWN16
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	CMP .LOWORD(CHAR_STRUCT)+char_struct::level,X
	BCSL @UNKNOWN16
	LDY #$0002
	LDA [$06],Y
	AND $23
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQL @UNKNOWN16
	MOVE_INT $06, $0A
	LDA [$0A]
	AND #$00FF
	CMP $1F
	BEQ @UNKNOWN15
	SEP #PROC_FLAGS::ACCUM8
	LDY #$000A
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDA [$0A]
	AND #$00FF
	JSR a:.LOWORD(GET_PSI_NAME)
	LDA [$0A]
	AND #$00FF
	STA $1F
@UNKNOWN15:
	LOADPTR PSI_SUFFIXES, $0A
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0001
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	DEC
	ASL
	CLC
	ADC $0A
	STA $0A
	STA $0E
	LDA $0C
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	SEP #PROC_FLAGS::ACCUM8
	LDY #$000A
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	STY $19
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0009
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA $02
	LDY $19
	JSR a:.LOWORD(UNKNOWN_C1153B)
@UNKNOWN16:
	REP #PROC_FLAGS::ACCUM8
	INC $02
@UNKNOWN17:
	LOADPTR PSI_ABILITY_TABLE, $06
	LDA $02
	OPTIMIZED_MULT $04, 15
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	BNEL @UNKNOWN6
	LDA $21
	STA $04
	BNEL @UNKNOWN24
	LDA $01
	AND #$00FF
	AND #$0001
	BEQL @UNKNOWN24
	LDA $23
	AND #$00FF
	AND #$0008
	BEQL @UNKNOWN24
	LDA .LOWORD(GAME_STATE)+game_state::party_psi
	AND #$00FF
	AND #$0001
	BEQL @UNKNOWN23
	LDA #$02FD
	CLC
	ADC $06
	STA $06
	STA $1B
	LDA $08
	STA $1D
	LDA #$000A
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAX
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDA [$06]
	AND #$00FF
	JSR a:.LOWORD(GET_PSI_NAME)
	MOVE_INT $1B, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0001
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	DEC
	ASL
	PHA
	LOADPTR PSI_SUFFIXES, $06
	PLA
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	LDA [$0A]
	AND #$00FF
	TAY
	STY $16
	MOVE_INT $1B, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0009
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA #$0033
	LDY $16
	JSR a:.LOWORD(UNKNOWN_C1153B)
@UNKNOWN23:
	LDA .LOWORD(GAME_STATE)+game_state::party_psi
	AND #$00FF
	AND #$0008
	BEQ @UNKNOWN24
	LOADPTR PSI_ABILITY_TABLE+780, $06
	LOADPTR PSI_SUFFIXES, $0A
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0001
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	DEC
	ASL
	CLC
	ADC $0A
	STA $0A
	STA $0E
	LDA $0C
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	SEP #PROC_FLAGS::ACCUM8
	LDY #$000A
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	STY $19
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0009
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA #$0034
	LDY $19
	JSR a:.LOWORD(UNKNOWN_C1153B)
@UNKNOWN24:
	JSR a:.LOWORD(PRINT_MENU_ITEMS)
	JSR CLEAR_9622
	PLD
	RTS
