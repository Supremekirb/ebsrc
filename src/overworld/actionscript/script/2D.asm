
MOVEMENT_CODE_2D: ;$C098BC
	LDX $88
	LDA [$80],Y
	CLC
	ADC ENTITY_ABS_Z_TABLE,X
	STA ENTITY_ABS_Z_TABLE,X
	INY
	INY
	RTS
