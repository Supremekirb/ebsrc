
UNKNOWN_C08CD5: ;$C08CD5
	PHP
	PHD
	PEA __BSS_START__
	PLD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	STX <UNKNOWN_7E009B + 0
	STY <UNKNOWN_7E009D + 0
	TAY
	LDX <OAM_ADDR + 0
	CPX <OAM_END_ADDR + 0
	BCC @UNKNOWN0
	PLD
	PLP
	RTL
@UNKNOWN0:
	PHB
	SEP #PROC_FLAGS::ACCUM8
	LDA <UNKNOWN_7E000B + 0
	PHA
	PLB
	BRA @UNKNOWN3
@UNKNOWN1:
	LDA a:spritemap::tile,Y
	TAY
	BRA @UNKNOWN3
@UNKNOWN2:
	INY
	INY
	INY
	INY
	INY
@UNKNOWN3:
	REP #PROC_FLAGS::ACCUM8
	LDA a:spritemap::y_offset,Y
	AND #$00FF
	CMP #$0080
	BCC @UNKNOWN4
	BEQ @UNKNOWN1
	ORA #$FF00
	CLC
@UNKNOWN4:
	ADC <UNKNOWN_7E009D + 0
	DEC
	CMP #$00E0
	BCC @UNKNOWN6
	CMP #$FFE0
	BCS @UNKNOWN6
	SEP #PROC_FLAGS::ACCUM8
@UNKNOWN5:
	LDA a:spritemap::bits,Y
	BPL @UNKNOWN2
	BRA @UNKNOWN10
@UNKNOWN6:
	.A16
	STA <UNKNOWN_7E009F + 0
	LDA a:spritemap::tile,Y
	STA <oam_entry::starting_tile,X
	LDA a:spritemap::x_offset,Y
	AND #$00FF
	CMP #$0080
	BCC @UNKNOWN7
	ORA #$FF00
	CLC
@UNKNOWN7:
	ADC <UNKNOWN_7E009B + 0
	SEP #PROC_FLAGS::ACCUM8
	STA <oam_entry::x_coord,X
	XBA
	BEQ @UNKNOWN8
	CMP #$00FF
	BNE @UNKNOWN5
@UNKNOWN8:
	ROL
	ROR <UNKNOWN_7E000A + 0
	LDA a:spritemap::bits,Y
	ROR
	ROR <UNKNOWN_7E000A + 0
	BCC @UNKNOWN9
	LDA <UNKNOWN_7E000A + 0
	STA [<OAM_HIGH_TABLE_ADDR + 0]
	INC <OAM_HIGH_TABLE_ADDR + 0
	LDA #$0080
	STA <UNKNOWN_7E000A + 0
@UNKNOWN9:
	LDA <UNKNOWN_7E009F + 0
	STA <oam_entry::y_coord,X
	INX
	INX
	INX
	INX
	LDA a:spritemap::bits,Y
	BMI @UNKNOWN10
	REP #PROC_FLAGS::ACCUM8
	CPX <OAM_END_ADDR + 0
	BCC @UNKNOWN2
@UNKNOWN10:
	STX <OAM_ADDR + 0
	PLB
	PLD
	PLP
	RTL
