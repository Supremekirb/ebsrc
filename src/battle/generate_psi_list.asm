
GENERATE_PSI_LIST: ;$C1C452
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	PHD
	PHA
	TDC
	ADC #$FFDC
	TCD
	PLA
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
	JSL SET_9622_ONE
	JSR a:.LOWORD(UNKNOWN_C11383)
	STZ $1F
	LDA $04
	CMP #$0003
	BEQ @UNKNOWN0
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN0:
	LDA $01
	AND #$00FF
	AND #$0002
	BNE @UNKNOWN1
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN1:
	LDA $23
	AND #$00FF
	AND #$0001
	BNE @UNKNOWN2
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN2:
	LDA .LOWORD(GAME_STATE)+game_state::party_psi
	AND #$00FF
	AND #$0002
	BNE @UNKNOWN3
	JMP a:.LOWORD(@UNKNOWN4)
@UNKNOWN3:
	LOADPTR PSI_ABILITY_TABLE+315, $06
	MOVE_INT $06, $1B
	LDA #$000A
	LDX $06
	STX $0A
	LDX $08
	STX $0C
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAX
	LDA #$0000
	JSL UNKNOWN_C438A5
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
	MOVE_INT $06, $1B
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
	MOVE_INT $1B, $06
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
	JMP a:.LOWORD(@UNKNOWN17)
@UNKNOWN6:
	MOVE_INT $0A, $06
	MOVE_INT $06, $1B
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
	BNE @UNKNOWN11
	JMP a:.LOWORD(@UNKNOWN16)
@UNKNOWN11:
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0003
	LDA [$06],Y
	AND $01
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BNE @UNKNOWN12
	JMP a:.LOWORD(@UNKNOWN16)
@UNKNOWN12:
	LDA $04
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	CMP .LOWORD(CHAR_STRUCT)+char_struct::level,X
	BEQ @UNKNOWN13
	BCC @UNKNOWN13
	JMP a:.LOWORD(@UNKNOWN16)
@UNKNOWN13:
	LDY #$0002
	LDA [$06],Y
	AND $23
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BNE @UNKNOWN14
	JMP a:.LOWORD(@UNKNOWN16)
@UNKNOWN14:
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
	JSL UNKNOWN_C438A5
	LDA [$0A]
	AND #$00FF
	JSR a:.LOWORD(GET_PSI_NAME)
	LDA [$0A]
	AND #$00FF
	STA $1F
@UNKNOWN15:
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
	MOVE_INT $1B, $06
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
	LDX $06
	STX $0A
	LDX $08
	STX $0C
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	BEQ @UNKNOWN18
	JMP a:.LOWORD(@UNKNOWN6)
@UNKNOWN18:
	LDA $21
	STA $04
	BEQ @UNKNOWN19
	JMP a:.LOWORD(@UNKNOWN24)
@UNKNOWN19:
	LDA $01
	AND #$00FF
	AND #$0001
	BNE @UNKNOWN20
	JMP a:.LOWORD(@UNKNOWN24)
@UNKNOWN20:
	LDA $23
	AND #$00FF
	AND #$0008
	BNE @UNKNOWN21
	JMP a:.LOWORD(@UNKNOWN24)
@UNKNOWN21:
	LDA .LOWORD(GAME_STATE)+game_state::party_psi
	AND #$00FF
	AND #$0001
	BNE @UNKNOWN22
	JMP a:.LOWORD(@UNKNOWN23)
@UNKNOWN22:
	LDA #$02FD
	CLC
	ADC $06
	STA $06
	STA $1B
	LDA $08
	STA $1D
	LDA #$000A
	LDX $06
	STX $0A
	LDX $08
	STX $0C
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAX
	LDA #$0000
	JSL UNKNOWN_C438A5
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
	MOVE_INT $06, $1B
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
	MOVE_INT $1B, $06
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
	JSL CLEAR_9622
	PLD
	RTS
