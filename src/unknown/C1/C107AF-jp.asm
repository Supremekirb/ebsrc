
UNKNOWN_C107AF: ;$C107AF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 31
	STA $1D
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	STA $1B
	TAX
	LDA WINDOW_STATS_TABLE+53,X
	STA $19
	LDA $1B
	TAX
	LDA WINDOW_STATS_TABLE+6,X
	ASL
	STA $02
	LDA $1B
	TAX
	LDA WINDOW_STATS_TABLE+8,X
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	CLC
	ADC #.LOWORD(BG2_BUFFER)
	TAX
	STX $17
	LDA $1B
	TAX
	LDY WINDOW_STATS_TABLE+10,X
	STY $15
	STY $13
	TAX
	LDA WINDOW_STATS_TABLE+12,X
	STA $11
	LDX $17
	LDA __BSS_START__,X
	BEQ @UNKNOWN0
	CMP #$3C10
	BNE @UNKNOWN1
@UNKNOWN0:
	LDA #$3C10
	STA __BSS_START__,X
	STX $02
	INC $02
	INC $02
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA #$3C13
	STA __BSS_START__,X
	STX $02
	INC $02
	INC $02
@UNKNOWN2:
	LDA $1D
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA WINDOW_STATS_TABLE+59,X
	STA $10
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN6
	TXA
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE) + 60
	STA $04
	LDA $10
	AND #$00FF
	DEC
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #$02E0
	STA $0E
	LDA #$3C16
	LDX $02
	STA __BSS_START__,X
	LDX $02
	INX
	INX
	STX $17
	LDY $15
	DEY
	BRA @UNKNOWN5
@UNKNOWN4:
	LDA $0E
	CLC
	ADC #$2000
	LDX $17
	STA __BSS_START__,X
	LDA $0E
	INC
	STA $0E
	INX
	INX
	STX $17
	DEY
	INC $04
@UNKNOWN5:
	LDX $04
	LDA __BSS_START__,X
	AND #$00FF
	BNE @UNKNOWN4
	LDA #$7C16
	LDX $17
	STA __BSS_START__,X
	STX $02
	INC $02
	INC $02
	DEY
	STY $15
@UNKNOWN6:
	LDA $1D
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA WINDOW_STATS_TABLE+4,X
	CMP UNKNOWN_7E5E7A
	BNE @UNKNOWN7
	LDA UNKNOWN_7E5E7C
	CMP #$FFFF
	BEQ @UNKNOWN7
	LDY $15
	TYA
	SEC
	SBC #$0004
	TAY
	STY $15
@UNKNOWN7:
	LDY $15
	TYX
	STX $17
	BRA @UNKNOWN9
@UNKNOWN8:
	LDA #$3C11
	LDX $02
	STA __BSS_START__,X
	INC $02
	INC $02
	LDX $17
	DEX
	STX $17
@UNKNOWN9:
	BNE @UNKNOWN8
	LDA $1D
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA WINDOW_STATS_TABLE+4,X
	CMP UNKNOWN_7E5E7A
	BNE @UNKNOWN12
	LDA UNKNOWN_7E5E7C
	CMP #$FFFF
	BEQ @UNKNOWN12
	LOADPTR UNKNOWN_C3E41C_PTR_TABLE, $0A
	LDA UNKNOWN_7E5E7C
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	LDX #$0000
	STX $0E
	BRA @UNKNOWN11
@UNKNOWN10:
	LDA [$06]
	LDX $02
	STA __BSS_START__,X
	INC $06
	INC $06
	INC $02
	INC $02
	LDX $0E
	INX
	STX $0E
@UNKNOWN11:
	CPX #$0004
	BCC @UNKNOWN10
@UNKNOWN12:
	LDX $02
	LDA __BSS_START__,X
	BEQ @UNKNOWN13
	CMP #$7C10
	BNE @UNKNOWN14
@UNKNOWN13:
	LDA #$7C10
	LDX $02
	STA __BSS_START__,X
	LDA $02
	INC
	INC
	STA $1D
	BRA @UNKNOWN15
@UNKNOWN14:
	LDA #$7C13
	LDX $02
	STA __BSS_START__,X
	LDA $02
	INC
	INC
	STA $1D
@UNKNOWN15:
	LDA #$0020
	SEC
	SBC $13
	DEC
	DEC
	ASL
	STA $02
	LDA $1D
	CLC
	ADC $02
	TAX
	LDY $11
	BRA @UNKNOWN19
@UNKNOWN16:
	LDA #$3C12
	STA __BSS_START__,X
	INX
	INX
	LDA $13
	STA $0E
	BRA @UNKNOWN18
@UNKNOWN17:
	LDA ($19)
	CLC
	ADC #$2000
	STA __BSS_START__,X
	INC $19
	INC $19
	INX
	INX
	LDA $0E
	DEC
	STA $0E
@UNKNOWN18:
	BNE @UNKNOWN17
	LDA #$7C12
	STA __BSS_START__,X
	TXA
	INC
	INC
	STA $11
	LDA #$0020
	SEC
	SBC $13
	DEC
	DEC
	ASL
	STA $02
	LDA $11
	CLC
	ADC $02
	TAX
	DEY
@UNKNOWN19:
	BNE @UNKNOWN16
	LDA __BSS_START__,X
	BEQ @UNKNOWN20
	CMP #$BC10
	BNE @UNKNOWN21
@UNKNOWN20:
	LDA #$BC10
	STA __BSS_START__,X
	TXY
	INY
	INY
	BRA @UNKNOWN22
@UNKNOWN21:
	LDA #$BC13
	STA __BSS_START__,X
	TXY
	INY
	INY
@UNKNOWN22:
	LDX $13
	BRA @UNKNOWN24
@UNKNOWN23:
	LDA #$BC11
	STA __BSS_START__,Y
	INY
	INY
	DEX
@UNKNOWN24:
	BNE @UNKNOWN23
	LDA __BSS_START__,Y
	BEQ @UNKNOWN25
	CMP #$FC10
	BNE @UNKNOWN26
@UNKNOWN25:
	LDA #$FC10
	STA __BSS_START__,Y
	BRA @UNKNOWN27
@UNKNOWN26:
	LDA #$FC13
	STA __BSS_START__,Y
@UNKNOWN27:
	PLD
	RTL
