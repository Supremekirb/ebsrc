
CC_1D_TREE: ;$C17F11
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	TXA
	BEQL @UNKNOWN30
	CMP #$0001
	BEQL @UNKNOWN31
	CMP #$0002
	BEQL @UNKNOWN32
	CMP #$0003
	BEQL @UNKNOWN33
	CMP #$0004
	BEQL @UNKNOWN34
	CMP #$0005
	BEQL @UNKNOWN35
	CMP #$0006
	BEQL @UNKNOWN36
	CMP #$0007
	BEQL @UNKNOWN37
	CMP #$0008
	BEQL @UNKNOWN38
	CMP #$0009
	BEQL @UNKNOWN39
	CMP #$000A
	BEQL @UNKNOWN40
	CMP #$000B
	BEQL @UNKNOWN41
	CMP #$000C
	BEQL @UNKNOWN42
	CMP #$000D
	BEQL @UNKNOWN43
	CMP #$000E
	BEQL @UNKNOWN44
	CMP #$000F
	BEQL @UNKNOWN45
	CMP #$0010
	BEQL @UNKNOWN46
	CMP #$0011
	BEQL @UNKNOWN47
	CMP #$0012
	BEQL @UNKNOWN48
	CMP #$0013
	BEQL @UNKNOWN49
	CMP #$0014
	BEQL @UNKNOWN50
	CMP #$0015
	BEQL @UNKNOWN51
	CMP #$0017
	BEQL @UNKNOWN52
	CMP #$0018
	BEQL @UNKNOWN53
	CMP #$0019
	BEQL @UNKNOWN54
	CMP #$0020
	BEQL @UNKNOWN55
	CMP #$0021
	BEQL @UNKNOWN58
	CMP #$0022
	BEQL @UNKNOWN59
	CMP #$0023
	BEQL @UNKNOWN62
	CMP #$0024
	BEQL @UNKNOWN63
	JMP @UNKNOWN64
@UNKNOWN30:
	LDA #.LOWORD(CC_1D_00)
	JMP @UNKNOWN65
@UNKNOWN31:
	LDA #.LOWORD(CC_1D_01)
	JMP @UNKNOWN65
@UNKNOWN32:
	LDA #.LOWORD(CC_1D_02)
	JMP @UNKNOWN65
@UNKNOWN33:
	LDA #.LOWORD(CC_1D_03)
	JMP @UNKNOWN65
@UNKNOWN34:
	LDA #.LOWORD(CC_1D_04)
	JMP @UNKNOWN65
@UNKNOWN35:
	LDA #.LOWORD(CC_1D_05)
	JMP @UNKNOWN65
@UNKNOWN36:
	LDA #.LOWORD(CC_1D_06)
	JMP @UNKNOWN65
@UNKNOWN37:
	LDA #.LOWORD(CC_1D_07)
	JMP @UNKNOWN65
@UNKNOWN38:
	LDA #.LOWORD(CC_1D_08)
	JMP @UNKNOWN65
@UNKNOWN39:
	LDA #.LOWORD(CC_1D_09)
	JMP @UNKNOWN65
@UNKNOWN40:
	LDA #.LOWORD(CC_1D_0A)
	JMP @UNKNOWN65
@UNKNOWN41:
	LDA #.LOWORD(CC_1D_0B)
	JMP @UNKNOWN65
@UNKNOWN42:
	LDA #.LOWORD(CC_1D_0C)
	JMP @UNKNOWN65
@UNKNOWN43:
	LDA #.LOWORD(CC_1D_0D)
	JMP @UNKNOWN65
@UNKNOWN44:
	LDA #.LOWORD(CC_1D_0E)
	JMP @UNKNOWN65
@UNKNOWN45:
	LDA #.LOWORD(CC_1D_0F)
	JMP @UNKNOWN65
@UNKNOWN46:
	LDA #.LOWORD(CC_1D_10)
	JMP @UNKNOWN65
@UNKNOWN47:
	LDA #.LOWORD(CC_1D_11)
	JMP @UNKNOWN65
@UNKNOWN48:
	LDA #.LOWORD(CC_1D_12)
	JMP @UNKNOWN65
@UNKNOWN49:
	LDA #.LOWORD(CC_1D_13)
	JMP @UNKNOWN65
@UNKNOWN50:
	LDA #.LOWORD(CC_1D_14)
	JMP @UNKNOWN65
@UNKNOWN51:
	LDA #.LOWORD(CC_1D_15)
	JMP @UNKNOWN65
@UNKNOWN52:
	LDA #.LOWORD(CC_1D_17)
	JMP @UNKNOWN65
@UNKNOWN53:
	LDA #.LOWORD(CC_1D_18)
	JMP @UNKNOWN65
@UNKNOWN54:
	LDA #.LOWORD(CC_1D_19)
	JMP @UNKNOWN65
@UNKNOWN55:
	LDY #$0000
	STY $14
	JSR a:.LOWORD(RETURN_BATTLE_TARGET_ADDRESS)
	STA $12
	JSR a:.LOWORD(RETURN_BATTLE_ATTACKER_ADDRESS)
	TAX
	LDA $12
	JSR a:.LOWORD(UNKNOWN_C14070)
	CMP #$0000
	BNE @UNKNOWN56
	LDY #$0001
	STY $14
@UNKNOWN56:
	LDY $14
	TYA
	STA $06
	STZ $08
	BPL @UNKNOWN57
	DEC $08
@UNKNOWN57:
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	BRA @UNKNOWN64
@UNKNOWN58:
	LDA #.LOWORD(CC_1D_21)
	BRA @UNKNOWN65
@UNKNOWN59:
	LDY #$0000
	STY $14
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL LOAD_SECTOR_ATTRS
	AND #$0007
	CMP #$0002
	BNE @UNKNOWN60
	LDY #$0001
	STY $14
@UNKNOWN60:
	LDY $14
	TYA
	STA $06
	STZ $08
	BPL @UNKNOWN61
	DEC $08
@UNKNOWN61:
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	BRA @UNKNOWN64
@UNKNOWN62:
	LDA #.LOWORD(CC_1D_23)
	BRA @UNKNOWN65
@UNKNOWN63:
	LDA #.LOWORD(CC_1D_24)
	BRA @UNKNOWN65
@UNKNOWN64:
	LDA #$0000
@UNKNOWN65:
	PLD
	RTS
