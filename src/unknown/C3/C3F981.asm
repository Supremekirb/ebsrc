
UNKNOWN_C3F981: ;$C3F981
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STA $02
	CMP #$0023
	BCS @UNKNOWN0
	LDA $02
	JSL SHOW_PSI_ANIMATION
	JMP @UNKNOWN8
@UNKNOWN0:
	LDA $02
	CMP #$002E
	BCS @UNKNOWN1
	JSL UNKNOWN_C2DE0F
	LOADPTR UNKNOWN_C3F951, $06
	LDA $02
	SEC
	SBC #$0023
	OPTIMIZED_MULT $04, 3
	STA $10
	INC
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAY
	LDA $10
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAX
	LDA $10
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	JSL SET_COLDATA
	LDX #$003F
	LDA #$0010
	JSL SET_COLOUR_ADDSUB_MODE
	LDX #$0007
	LDA #$0005
	JSL UNKNOWN_C4A67E
	JMP @UNKNOWN8
@UNKNOWN1:
	LDA $02
	CMP #$0031
	BCS @UNKNOWN5
	LDA $02
	INC
	CMP #$002F
	BEQ @UNKNOWN3
	CMP #$0030
	BEQ @UNKNOWN4
	CMP #$0031
	BEQL @UNKNOWN8
	JMP @UNKNOWN8
@UNKNOWN3:
	LDA #$0090
	STA .LOWORD(WOBBLE_DURATION)
	JMP @UNKNOWN8
@UNKNOWN4:
	LDA #$012C
	STA .LOWORD(SHAKE_DURATION)
	JMP @UNKNOWN8
@UNKNOWN5:
	LDA $02
	CMP #$0036
	BCC @UNKNOWN6
	JMP @UNKNOWN8
@UNKNOWN6:
	JSL UNKNOWN_C2DE0F
	LOADPTR UNKNOWN_C3F951+33, $06
	LDA $02
	SEC
	SBC #$0031
	STA $04
	ASL
	ADC $04
	STA $0E
	INC
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAY
	LDA $0E
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAX
	LDA $0E
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	JSL SET_COLDATA
	LDX #$003F
	LDA #$0010
	JSL SET_COLOUR_ADDSUB_MODE
	LDA $02
	CMP #$0035
	BCS @UNKNOWN7
	LDX #$0005
	LDA #$0004
	JSL UNKNOWN_C4A67E
	BRA @UNKNOWN8
@UNKNOWN7:
	LDX #$0004
	LDA #$0002
	JSL UNKNOWN_C4A67E
@UNKNOWN8:
	PLD
	RTS
