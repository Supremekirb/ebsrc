
MOVEMENT_CODE_31: ;$C097DC
	LDA [$80],Y
	AND #$00FF
	ASL
	TAX
	INY
	LDA [$80],Y
	STA .LOWORD(UNKNOWN_7E1A02),X
	STZ .LOWORD(UNKNOWN_7E1A12),X
	INY
	INY
	RTS
