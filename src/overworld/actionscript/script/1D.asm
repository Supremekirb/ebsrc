
MOVEMENT_CODE_1D: ;$C09B61
	LDA [$80],Y
	LDX $8A
	STA ENTITY_TEMPVARS,X
	INY
	INY
	RTS
