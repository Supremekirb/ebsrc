
;A: Walking style
MAP_INPUT_TO_DIRECTION: ;$C0404F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STA $10
	LDX #$FFFF
	STX $0E
	LDA UNKNOWN_7E5D9A
	BEQ @UNKNOWN0
	TXA
	JMP @RETURN
@UNKNOWN0:
	LDA $10
	ASL
	TAX
	LDA f:ALLOWED_INPUT_DIRECTIONS,X
	STA $10
	LDA PAD_STATE
	AND #PAD::UP | PAD::DOWN | PAD::LEFT | PAD::RIGHT
	CMP #PAD::UP
	BEQ @UP_PRESSED
	CMP #PAD::UP | PAD::RIGHT
	BEQ @UP_RIGHT_PRESSED
	CMP #PAD::RIGHT
	BEQ @RIGHT_PRESSED
	CMP #PAD::DOWN | PAD::RIGHT
	BEQ @DOWN_RIGHT_PRESSED
	CMP #PAD::DOWN
	BEQ @DOWN_PRESSED
	CMP #PAD::DOWN | PAD::LEFT
	BEQ @DOWN_LEFT_PRESSED
	CMP #PAD::LEFT
	BEQ @LEFT_PRESSED
	CMP #PAD::UP | PAD::LEFT
	BEQ @UP_LEFT_PRESSED
	BRA @RETURN_DEFAULT
@UP_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::UP
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::UP
	STX $0E
	BRA @RETURN_DEFAULT
@UP_RIGHT_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::UP_RIGHT
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::UP_RIGHT
	STX $0E
	BRA @RETURN_DEFAULT
@RIGHT_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::RIGHT
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::RIGHT
	STX $0E
	BRA @RETURN_DEFAULT
@DOWN_RIGHT_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::DOWN_RIGHT
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::DOWN_RIGHT
	STX $0E
	BRA @RETURN_DEFAULT
@DOWN_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::DOWN
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::DOWN
	STX $0E
	BRA @RETURN_DEFAULT
@DOWN_LEFT_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::DOWN_LEFT
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::DOWN_LEFT
	STX $0E
	BRA @RETURN_DEFAULT
@LEFT_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::LEFT
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::LEFT
	STX $0E
	BRA @RETURN_DEFAULT
@UP_LEFT_PRESSED:
	LDA $10
	AND #DIRECTION_MASK::UP_LEFT
	BEQ @RETURN_DEFAULT
	LDX #DIRECTION::UP_LEFT
	STX $0E
@RETURN_DEFAULT:
	LDX $0E
	TXA
@RETURN:
	PLD
	RTL
