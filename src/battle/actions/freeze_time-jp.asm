
BTLACT_FREEZETIME: ;$C288EB
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	JSL PAUSE_MUSIC
	LDA #$0004
	JSR RAND_LIMIT
	STA $02
	INC $02
	MOVE_INT BATTLER_TARGET_FLAGS, $0A
	MOVE_INT $0A, $16
	LDY #$0000
	STY $14
	JMP @UNKNOWN5
@UNKNOWN0:
	JSL REMOVE_STATUS_UNTARGETTABLE_TARGETS
	MOVE_INT_CONSTANT NULL, $0A
	MOVE_INT BATTLER_TARGET_FLAGS, $06
	CMP $0C
	BNE @UNKNOWN1
	LDA $06
	CMP $0A
@UNKNOWN1:
	BEQ @UNKNOWN6
	MOVE_INT $16, $0A
	MOVE_INT $0A, $0E
	JSL RANDOM_TARGETTING
	MOVE_INT $06, BATTLER_TARGET_FLAGS
	LDX #$0000
	STX $12
	BRA @UNKNOWN3
@UNKNOWN2:
	TXA
	JSL IS_CHAR_TARGETTED
	CMP #$0000
	BNE @UNKNOWN4
	LDX $12
	INX
	STX $12
@UNKNOWN3:
	CPX #$0020
	BCC @UNKNOWN2
@UNKNOWN4:
	LDX $12
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)
	STA CURRENT_TARGET
	JSL FIX_TARGET_NAME
	JSL BTLACT_BASH
	LDY $14
	INY
	STY $14
@UNKNOWN5:
	TYA
	CMP $02
	BCCL @UNKNOWN0
@UNKNOWN6:
	JSL RESUME_MUSIC
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_TIMESTOP_RET
	MOVE_INT_CONSTANT 0, BATTLER_TARGET_FLAGS
	PLD
	RTL
