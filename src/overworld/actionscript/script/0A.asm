
MOVEMENT_CODE_0A: ;$C0995D
	LDX $8A
	LDA ENTITY_TEMPVARS,X
	BNE @RETURN
	LDA [$80],Y
	TAY
	RTS
@RETURN:
	INY
	INY
	RTS
