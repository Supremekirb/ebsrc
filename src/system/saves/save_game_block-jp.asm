
SAVE_GAME_BLOCK: ;$EF088F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 34
	TAX
	STX $20
@UNKNOWN0:
	MOVE_INT a:.LOWORD(TIMER), $06
	MOVE_INT $06, .LOWORD(GAME_STATE)+game_state::timer
	LDY #$0500
	LDX $20
	TXA
	JSL MULT16
	STA $0A
	STZ $0C
	MOVE_INT $0A, $06
	CLC
	VAR_ADD_CONST_INT_ASSIGN SAVE_BASE + .SIZEOF(save_header), $06
	MOVE_INT $06, $1C
	LDA #.LOWORD(GAME_STATE)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $16
	; This is ridiculous. It would have been far more efficient to use
	; LDA #.HIWORD(RAM) / STA $18
	LDA #.HIWORD(RAM)
	STA $18
	MOVE_INT $1C, $06
	MOVE_INT $06, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	LDA #.SIZEOF(game_state)
	JSL MEMCPY24
	LDA #.SIZEOF(game_state)
	MOVE_INTX $1C, $06
	CLC
	ADC $06
	STA $06
	STA $1C
	LDA $08
	STA $1E
	LDA #.LOWORD(CHAR_STRUCT)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $16
	LDA #.HIWORD(RAM)
	STA $18
	MOVE_INT $1C, $06
	MOVE_INT $06, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	LDA #.SIZEOF(char_struct) * 6
	JSL MEMCPY24
	LDA #.SIZEOF(char_struct) * 6
	MOVE_INTX $1C, $06
	CLC
	ADC $06
	STA $06
	STA $1C
	LDA $08
	STA $1E
	LDA #.LOWORD(UNKNOWN_7E9C08)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $16
	LDA #.HIWORD(RAM)
	STA $18
	MOVE_INT $1C, $06
	MOVE_INT $06, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	LDA #$0080
	JSL MEMCPY24
	MOVE_INT $0A, $06
	CLC
	VAR_ADD_CONST_INT_ASSIGN SAVE_BASE + save_header::checksum, $06
	LDX $20
	TXA
	JSR a:.LOWORD(CALC_SAVE_BLOCK_ADD_CHECKSUM)
	TAY
	STY $1A
	TYA
	STA [$06]
	LDX $20
	TXA
	JSR a:.LOWORD(CALC_SAVE_BLOCK_ADD_CHECKSUM)
	STA $02
	LDY $1A
	TYA
	CMP $02
	BNEL @UNKNOWN0
	MOVE_INT $0A, $06
	CLC
	VAR_ADD_CONST_INT_ASSIGN SAVE_BASE + save_header::checksum_complement, $06
	LDX $20
	TXA
	JSR a:.LOWORD(CALC_SAVE_BLOCK_XOR_CHECKSUM)
	TAY
	STY $1A
	TYA
	STA [$06]
	LDX $20
	TXA
	JSR a:.LOWORD(CALC_SAVE_BLOCK_XOR_CHECKSUM)
	STA $02
	LDY $1A
	TYA
	CMP $02
	BNEL @UNKNOWN0
	PLD
	RTS
