
MOVEMENT_CODE_00: ;$C095F2
	LDX $88
	JSR UNKNOWN_C09C3B
	LDX $8A
	LDA #$FFFF
	STA ENTITY_SLEEP_FRAMES,X
	STA UNKNOWN_7E0A58
	RTS
