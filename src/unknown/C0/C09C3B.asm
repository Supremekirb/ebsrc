
UNKNOWN_C09C3B: ;$C09C3B
	PHA
	LDA ENTITY_SCRIPT_TABLE,X
	BMI @UNKNOWN0
	PHY
	LDA #$FFFF
	STA ENTITY_SCRIPT_TABLE,X
	JSR CLEAR_SPRITE_TICK_CALLBACK
	JSR UNKNOWN_C09C99
	JSR UNKNOWN_C09C73
	JSR UNKNOWN_C09C8F
	PLY
@UNKNOWN0:
	PLA
	RTS
