
MOVEMENT_CODE_20: ;$C09B91
	LDA [$80],Y
	AND #$00FF
	ASL
	TAX
	LDA f:ENTITY_SCRIPT_VAR_TABLES,X
	ADC $88
	TAX
	LDA __BSS_START__,X
	LDX $8A
	STA ENTITY_TEMPVARS,X
	INY
	RTS
