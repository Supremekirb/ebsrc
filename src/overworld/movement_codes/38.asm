
MOVEMENT_CODE_38: ;$C098DE
	LDA [$80],Y
	AND #$00FF
	ASL
	TAX
	INY
	LDA [$80],Y
	CLC
	ADC .LOWORD(UNKNOWN_7E1A0A),X
	STA .LOWORD(UNKNOWN_7E1A0A),X
	INY
	INY
	RTS
