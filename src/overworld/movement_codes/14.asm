
MOVEMENT_CODE_14: ;$C09A87
	LDA [$80],Y
	AND #$00FF
	ASL
	TAX
	LDA f:UNKNOWN_C09AF9,X
	CLC
	ADC $88
	BRA MOVEMENT_CODE_0D_UNK1
