
UNKNOWN_C04F9F: ;$C04F9F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TAY
	STY $10
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_members,Y
	AND #$00FF
	ASL
	TAX
	LDA .LOWORD(CHOSEN_FOUR_PTRS),X
	TAX
	STX $0E
	LDY #$0064
	LDA a:.LOWORD(RAM)+char_struct::max_hp,X
	STA $04
	ASL
	ASL
	ADC $04
	ASL
	ASL
	JSL DIVISION16S_DIVISOR_POSITIVE
	CMP a:.LOWORD(RAM)+char_struct::current_hp,X
	BCC @UNKNOWN1
	BEQ @UNKNOWN1
	LDY $10
	TYA
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7E5D8C),X
	BNE @UNKNOWN0
	LDX $0E
	LDA a:char_struct::unknown53,X
	INC
	JSL SHOW_HP_ALERT
@UNKNOWN0:
	LDY $10
	TYA
	ASL
	TAX
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5D8C),X
	BRA @UNKNOWN2
@UNKNOWN1:
	LDY $10
	TYA
	ASL
	TAX
	STZ .LOWORD(UNKNOWN_7E5D8C),X
@UNKNOWN2:
	PLD
	RTS
