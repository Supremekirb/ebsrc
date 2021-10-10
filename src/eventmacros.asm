.MACRO EVENT_END
	.BYTE $00
.ENDMACRO

.MACRO EVENT_LOOP arg
	.BYTE $01, arg
.ENDMACRO

.MACRO EVENT_LOOP_END
	.BYTE $02
.ENDMACRO

.MACRO EVENT_LONGJUMP arg
	.BYTE $03
	PTR3 arg
.ENDMACRO

.MACRO EVENT_LONGCALL arg
	.BYTE $04
	PTR3 arg
.ENDMACRO

.MACRO EVENT_LONG_RETURN
	.BYTE $05
.ENDMACRO

.MACRO EVENT_PAUSE arg
	.BYTE $06, arg
.ENDMACRO

.MACRO EVENT_SHORTJUMP_UNKNOWN arg
	.BYTE $07
	.WORD arg
.ENDMACRO

.MACRO EVENT_UNKNOWN_08 arg
	.BYTE $08
	PTR3 arg
.ENDMACRO

.MACRO EVENT_HALT
	.BYTE $09
.ENDMACRO

.MACRO EVENT_SHORTCALL_CONDITIONAL arg
	.BYTE $0A
	.WORD arg
.ENDMACRO

.MACRO EVENT_SHORTCALL_CONDITIONAL_NOT arg
	.BYTE $0B
	.WORD arg
.ENDMACRO

.MACRO EVENT_END_UNKNOWN
	.BYTE $0C
.ENDMACRO

.MACRO EVENT_SET_VAR arg1, arg2
	.BYTE $0E, arg1
	.WORD arg2
.ENDMACRO

.MACRO EVENT_CLEAR_TICK_CALLBACK
	.BYTE $0F
.ENDMACRO

.MACRO EVENT_SWITCH_JUMP_TEMPVAR arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12
	.BYTE $10
	.BYTE .PARAMCOUNT
	.IF(.PARAMCOUNT > 0)
		.WORD arg1
	.ENDIF
	.IF(.PARAMCOUNT > 1)
		.WORD arg2
	.ENDIF
	.IF(.PARAMCOUNT > 2)
		.WORD arg3
	.ENDIF
	.IF(.PARAMCOUNT > 3)
		.WORD arg4
	.ENDIF
	.IF(.PARAMCOUNT > 4)
		.WORD arg5
	.ENDIF
	.IF(.PARAMCOUNT > 5)
		.WORD arg6
	.ENDIF
	.IF(.PARAMCOUNT > 6)
		.WORD arg7
	.ENDIF
	.IF(.PARAMCOUNT > 7)
		.WORD arg8
	.ENDIF
	.IF(.PARAMCOUNT > 8)
		.WORD arg9
	.ENDIF
	.IF(.PARAMCOUNT > 9)
		.WORD arg10
	.ENDIF
	.IF(.PARAMCOUNT > 10)
		.WORD arg11
	.ENDIF
.ENDMACRO

.MACRO EVENT_SWITCH_CALL_TEMPVAR arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12
	.BYTE $11
	.BYTE .PARAMCOUNT
	.IF(.PARAMCOUNT > 0)
		.WORD arg1
	.ENDIF
	.IF(.PARAMCOUNT > 1)
		.WORD arg2
	.ENDIF
	.IF(.PARAMCOUNT > 2)
		.WORD arg3
	.ENDIF
	.IF(.PARAMCOUNT > 3)
		.WORD arg4
	.ENDIF
	.IF(.PARAMCOUNT > 4)
		.WORD arg5
	.ENDIF
	.IF(.PARAMCOUNT > 5)
		.WORD arg6
	.ENDIF
	.IF(.PARAMCOUNT > 6)
		.WORD arg7
	.ENDIF
	.IF(.PARAMCOUNT > 7)
		.WORD arg8
	.ENDIF
	.IF(.PARAMCOUNT > 8)
		.WORD arg9
	.ENDIF
	.IF(.PARAMCOUNT > 9)
		.WORD arg10
	.ENDIF
	.IF(.PARAMCOUNT > 10)
		.WORD arg11
	.ENDIF
.ENDMACRO

.MACRO EVENT_WRITE_BYTE_WRAM arg1, arg2
	.BYTE $12
	.WORD arg1
	.BYTE arg2
.ENDMACRO

.MACRO EVENT_END_UNKNOWN2
	.BYTE $13
.ENDMACRO

.MACRO EVENT_BINOP_9AF9 arg1, arg2, arg3
	.BYTE $14, arg1, arg2
	.WORD arg3
.ENDMACRO

.MACRO EVENT_AND_9AF9 entry, operand
	EVENT_BINOP_9AF9 entry, $00, operand
.ENDMACRO

.MACRO EVENT_OR_9AF9 entry, operand
	EVENT_BINOP_9AF9 entry, $01, operand
.ENDMACRO

.MACRO EVENT_ADD_9AF9 entry, operand
	EVENT_BINOP_9AF9 entry, $02, operand
.ENDMACRO

.MACRO EVENT_XOR_9AF9 entry, operand
	EVENT_BINOP_9AF9 entry, $03, operand
.ENDMACRO

.MACRO EVENT_WRITE_WORD_WRAM arg1, arg2
	.BYTE $15
	.WORD arg1
	.WORD arg2
.ENDMACRO

.MACRO EVENT_WRITE_DWORD_WRAM arg1, arg2
	.BYTE $15
	.WORD arg1
	.WORD .LOWORD(arg2)
	.BYTE $15
	.WORD arg1 + 2
	.WORD .HIWORD(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_16 arg
	.BYTE $16
	.WORD arg
.ENDMACRO

.MACRO EVENT_UNKNOWN_17 arg
	.BYTE $17
	.WORD arg
.ENDMACRO

.MACRO EVENT_BINOP_WRAM arg1, arg2, arg3
	.BYTE $18
	.WORD arg1
	.BYTE arg2, arg3
.ENDMACRO

.MACRO EVENT_AND_WRAM address, operand
	EVENT_BINOP_WRAM address, $00, operand
.ENDMACRO

.MACRO EVENT_OR_WRAM address, operand
	EVENT_BINOP_WRAM address, $01, operand
.ENDMACRO

.MACRO EVENT_ADD_WRAM address, operand
	EVENT_BINOP_WRAM address, $02, operand
.ENDMACRO

.MACRO EVENT_XOR_WRAM address, operand
	EVENT_BINOP_WRAM address, $03, operand
.ENDMACRO

.MACRO EVENT_SHORTJUMP arg
	.BYTE $19
	.WORD arg
.ENDMACRO

.MACRO EVENT_SHORTCALL arg
	.BYTE $1A
	.WORD arg
.ENDMACRO

.MACRO EVENT_SHORT_RETURN
	.BYTE $1B
.ENDMACRO

.MACRO EVENT_WRITE_PTR_UNKNOWN arg
	.BYTE $1C
	PTR3 arg
.ENDMACRO

.MACRO EVENT_WRITE_WORD_TEMPVAR arg
	.BYTE $1D
	.WORD arg
.ENDMACRO

.MACRO EVENT_WRITE_WRAM_TEMPVAR arg
	.BYTE $1E
	.WORD arg
.ENDMACRO

.MACRO EVENT_WRITE_TEMPVAR_9AF9 arg
	.BYTE $1F, arg
.ENDMACRO

.MACRO EVENT_WRITE_9AF9_TEMPVAR arg
	.BYTE $20,  arg
.ENDMACRO

.MACRO EVENT_WRITE_9AF9_WAIT_TIMER arg
	.BYTE $21,  arg
.ENDMACRO

.MACRO EVENT_UNKNOWN_WRITE_11E2 arg
	.BYTE $22
	.WORD arg
.ENDMACRO

.MACRO EVENT_UNKNOWN_WRITE_11A6 arg
	.BYTE $23
	.WORD  arg
.ENDMACRO

.MACRO EVENT_LOOP_TEMPVAR
	.BYTE $24
.ENDMACRO

.MACRO EVENT_UNKNOWN_WRITE_121E arg
	.BYTE $25
	.WORD arg
.ENDMACRO

.MACRO EVENT_WRITE_9AF9_10F2 arg
	.BYTE $26,  arg
.ENDMACRO

.MACRO EVENT_BINOP_TEMPVAR arg, arg2
	.BYTE $27,  arg
	.WORD arg2
.ENDMACRO

.MACRO EVENT_AND_TEMPVAR operand
	EVENT_BINOP_TEMPVAR $00, operand
.ENDMACRO

.MACRO EVENT_OR_TEMPVAR operand
	EVENT_BINOP_TEMPVAR $01, operand
.ENDMACRO

.MACRO EVENT_ADD_TEMPVAR operand
	EVENT_BINOP_TEMPVAR $02, operand
.ENDMACRO

.MACRO EVENT_XOR_TEMPVAR operand
	EVENT_BINOP_TEMPVAR $03, operand
.ENDMACRO

.MACRO EVENT_SET_X arg
	.BYTE $28
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Y arg
	.BYTE $29
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Z arg
	.BYTE $2A
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_X_RELATIVE arg
	.BYTE $2B
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Y_RELATIVE arg
	.BYTE $2C
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Z_RELATIVE arg
	.BYTE $2D
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_X_VELOCITY_RELATIVE arg
	.BYTE $2E
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Y_VELOCITY_RELATIVE arg
	.BYTE $2F
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Z_VELOCITY_RELATIVE arg
	.BYTE $30
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_VELOCITIES_ZERO
	.BYTE $39
.ENDMACRO

.MACRO EVENT_SET_10F2 arg
	.BYTE $3B, arg
.ENDMACRO

.MACRO EVENT_INC_10F2
	.BYTE $3C
.ENDMACRO

.MACRO EVENT_DEC_10F2
	.BYTE $3D
.ENDMACRO

.MACRO EVENT_INC_10F2_BY arg
	.BYTE $3E, arg
.ENDMACRO

.MACRO EVENT_SET_X_VELOCITY arg
	.BYTE $3F
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Y_VELOCITY arg
	.BYTE $40
	.WORD arg
.ENDMACRO

.MACRO EVENT_SET_Z_VELOCITY arg
	.BYTE $41
	.WORD arg
.ENDMACRO

.MACRO EVENT_CALLROUTINE arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22
	.BYTE $42
	PTR3 arg
	.IF(.PARAMCOUNT > 1)
		.BYTE arg2
	.ENDIF
	.IF(.PARAMCOUNT > 2)
		.BYTE arg3
	.ENDIF
	.IF(.PARAMCOUNT > 3)
		.BYTE arg4
	.ENDIF
	.IF(.PARAMCOUNT > 4)
		.BYTE arg5
	.ENDIF
	.IF(.PARAMCOUNT > 5)
		.BYTE arg6
	.ENDIF
	.IF(.PARAMCOUNT > 6)
		.BYTE arg7
	.ENDIF
	.IF(.PARAMCOUNT > 7)
		.BYTE arg8
	.ENDIF
	.IF(.PARAMCOUNT > 8)
		.BYTE arg9
	.ENDIF
	.IF(.PARAMCOUNT > 9)
		.BYTE arg10
	.ENDIF
	.IF(.PARAMCOUNT > 10)
		.BYTE arg11
	.ENDIF
	.IF(.PARAMCOUNT > 11)
		.BYTE arg12
	.ENDIF
	.IF(.PARAMCOUNT > 12)
		.BYTE arg13
	.ENDIF
	.IF(.PARAMCOUNT > 13)
		.BYTE arg14
	.ENDIF
	.IF(.PARAMCOUNT > 14)
		.BYTE arg15
	.ENDIF
	.IF(.PARAMCOUNT > 15)
		.BYTE arg16
	.ENDIF
	.IF(.PARAMCOUNT > 16)
		.BYTE arg17
	.ENDIF
	.IF(.PARAMCOUNT > 17)
		.BYTE arg18
	.ENDIF
	.IF(.PARAMCOUNT > 18)
		.BYTE arg19
	.ENDIF
	.IF(.PARAMCOUNT > 19)
		.BYTE arg20
	.ENDIF
	.IF(.PARAMCOUNT > 20)
		.BYTE arg21
	.ENDIF
	.IF(.PARAMCOUNT > 21)
		.BYTE arg22
	.ENDIF
.ENDMACRO

.MACRO EVENT_EX_CALLROUTINE ex, arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22
	.BYTE $F0+ex
	PTR3 arg
	.IF(.PARAMCOUNT > 2)
		.BYTE arg2
	.ENDIF
	.IF(.PARAMCOUNT > 3)
		.BYTE arg3
	.ENDIF
	.IF(.PARAMCOUNT > 4)
		.BYTE arg4
	.ENDIF
	.IF(.PARAMCOUNT > 5)
		.BYTE arg5
	.ENDIF
	.IF(.PARAMCOUNT > 6)
		.BYTE arg6
	.ENDIF
	.IF(.PARAMCOUNT > 7)
		.BYTE arg7
	.ENDIF
	.IF(.PARAMCOUNT > 8)
		.BYTE arg8
	.ENDIF
	.IF(.PARAMCOUNT > 9)
		.BYTE arg9
	.ENDIF
	.IF(.PARAMCOUNT > 10)
		.BYTE arg10
	.ENDIF
	.IF(.PARAMCOUNT > 11)
		.BYTE arg11
	.ENDIF
	.IF(.PARAMCOUNT > 12)
		.BYTE arg12
	.ENDIF
	.IF(.PARAMCOUNT > 13)
		.BYTE arg13
	.ENDIF
	.IF(.PARAMCOUNT > 14)
		.BYTE arg14
	.ENDIF
	.IF(.PARAMCOUNT > 15)
		.BYTE arg15
	.ENDIF
	.IF(.PARAMCOUNT > 16)
		.BYTE arg16
	.ENDIF
	.IF(.PARAMCOUNT > 17)
		.BYTE arg17
	.ENDIF
	.IF(.PARAMCOUNT > 18)
		.BYTE arg18
	.ENDIF
	.IF(.PARAMCOUNT > 19)
		.BYTE arg19
	.ENDIF
	.IF(.PARAMCOUNT > 20)
		.BYTE arg20
	.ENDIF
	.IF(.PARAMCOUNT > 21)
		.BYTE arg21
	.ENDIF
	.IF(.PARAMCOUNT > 22)
		.BYTE arg22
	.ENDIF
.ENDMACRO

.MACRO EVENT_UNKNOWN_43 arg
	.BYTE $43, arg
.ENDMACRO

.MACRO EVENT_WRITE_TEMPVAR_WAITTIMER
	.BYTE $44
.ENDMACRO

.MACRO EVENT_TEST_EVENT_FLAG arg
	EVENT_CALLROUTINE UNKNOWN_C0A84C, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_EXEC_TEXT_BLOCK arg
	EVENT_CALLROUTINE UNKNOWN_C0A88D, .BANKBYTE(arg), 0, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_EXEC_TEXT_BLOCK2 arg
	EVENT_CALLROUTINE UNKNOWN_C0A8A0, .BANKBYTE(arg), 0, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_LOAD_BATTLEBGS arg, arg2
	EVENT_CALLROUTINE MOVEMENT_LOAD_BATTLEBG, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46C45
	EVENT_CALLROUTINE UNKNOWN_C46C45
.ENDMACRO

.MACRO EVENT_UNKNOWN_C09E71 arg
	EVENT_CALLROUTINE UNKNOWN_C09E71, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_ME1
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_MOVEMENT_ENTRY_1
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_MOVEMENT_ENTRY_2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_ME3
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_ENTRY3
.ENDMACRO

.MACRO EVENT_SET_DIRECTION
	EVENT_CALLROUTINE SET_DIRECTION
.ENDMACRO

.MACRO EVENT_RELOAD_MAP
	EVENT_CALLROUTINE RELOAD_MAP
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4DE98
	EVENT_CALLROUTINE UNKNOWN_C4DE98
.ENDMACRO

.MACRO EVENT_DECOMP_ITOI_PRODUCTION
	EVENT_CALLROUTINE DECOMP_ITOI_PRODUCTION
.ENDMACRO

.MACRO EVENT_DECOMP_NINTENDO_PRESENTATION
	EVENT_CALLROUTINE DECOMP_NINTENDO_PRESENTATION
.ENDMACRO

.MACRO EVENT_LOAD_KIRBY_SPRITE
	EVENT_CALLROUTINE LOAD_KIRBY_SPRITE
.ENDMACRO

.MACRO EVENT_SRAM_CHECK_ROUTINE_CHECKSUM
	EVENT_CALLROUTINE SRAM_CHECK_ROUTINE_CHECKSUM
.ENDMACRO

.MACRO EVENT_DISPLAY_ANTI_PIRACY_SCREEN
	EVENT_CALLROUTINE DISPLAY_ANTI_PIRACY_SCREEN
.ENDMACRO

.MACRO EVENT_INFLICT_SUNSTROKE_CHECK
	EVENT_CALLROUTINE INFLICT_SUNSTROKE_CHECK
.ENDMACRO

.MACRO EVENT_RAND
	EVENT_CALLROUTINE RAND
.ENDMACRO

.MACRO EVENT_UNDRAW_FLYOVER_TEXT
	EVENT_CALLROUTINE UNDRAW_FLYOVER_TEXT
.ENDMACRO

.MACRO EVENT_UNKNOWN_C020F1
	EVENT_CALLROUTINE UNKNOWN_C020F1
.ENDMACRO

.MACRO EVENT_UNKNOWN_C03F1E
	EVENT_CALLROUTINE UNKNOWN_C03F1E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C05E82
	EVENT_CALLROUTINE UNKNOWN_C05E82
.ENDMACRO

.MACRO EVENT_UNKNOWN_C05ECE
	EVENT_CALLROUTINE UNKNOWN_C05ECE
.ENDMACRO

.MACRO EVENT_UNKNOWN_C09F71
	EVENT_CALLROUTINE UNKNOWN_C09F71
.ENDMACRO

.MACRO EVENT_UNKNOWN_C09FA8
	EVENT_CALLROUTINE UNKNOWN_C09FA8
.ENDMACRO

.MACRO EVENT_UNKNOWN_C06478
	EVENT_CALLROUTINE UNKNOWN_C06478
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A06C
	EVENT_CALLROUTINE UNKNOWN_C0A06C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C09451
	EVENT_CALLROUTINE UNKNOWN_C09451
.ENDMACRO

.MACRO EVENT_UNKNOWN_C09F3B_ENTRY2
	EVENT_CALLROUTINE UNKNOWN_C09F3B_ENTRY2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_MOVEMENT_ENTRY_1
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_MOVEMENT_ENTRY_1
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_MOVEMENT_ENTRY_2
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_MOVEMENT_ENTRY_2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_MOVEMENT_ENTRY_3
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_MOVEMENT_ENTRY_3
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A3A4_ENTRY3
	EVENT_CALLROUTINE UNKNOWN_C0A3A4_ENTRY3
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A673
	EVENT_CALLROUTINE UNKNOWN_C0A673
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A691
	EVENT_CALLROUTINE UNKNOWN_C0A691
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A6B8
	EVENT_CALLROUTINE UNKNOWN_C0A6B8
.ENDMACRO

.MACRO EVENT_DISABLE_CURRENT_ENTITY_COLLISION
	EVENT_CALLROUTINE DISABLE_CURRENT_ENTITY_COLLISION
.ENDMACRO

.MACRO EVENT_CLEAR_CURRENT_ENTITY_COLLISION
	EVENT_CALLROUTINE CLEAR_CURRENT_ENTITY_COLLISION
.ENDMACRO

.MACRO EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_CALLROUTINE DISABLE_CURRENT_ENTITY_COLLISION2
.ENDMACRO

.MACRO EVENT_CLEAR_CURRENT_ENTITY_COLLISION2
	EVENT_CALLROUTINE CLEAR_CURRENT_ENTITY_COLLISION2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8C6
	EVENT_CALLROUTINE UNKNOWN_C0A8C6
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8D1
	EVENT_CALLROUTINE UNKNOWN_C0A8D1
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8DC
	EVENT_CALLROUTINE UNKNOWN_C0A8DC
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8E7
	EVENT_CALLROUTINE UNKNOWN_C0A8E7
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8F7
	EVENT_CALLROUTINE UNKNOWN_C0A8F7
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8FF
	EVENT_CALLROUTINE UNKNOWN_C0A8FF
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AAAC
	EVENT_CALLROUTINE UNKNOWN_C0AAAC
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AACD
	EVENT_CALLROUTINE UNKNOWN_C0AACD
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AAFD
	EVENT_CALLROUTINE UNKNOWN_C0AAFD
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C19B
	EVENT_CALLROUTINE UNKNOWN_C0C19B
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C251
	EVENT_CALLROUTINE UNKNOWN_C0C251
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C353
	EVENT_CALLROUTINE UNKNOWN_C0C353
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C35D
	EVENT_CALLROUTINE UNKNOWN_C0C35D
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C48F
	EVENT_CALLROUTINE UNKNOWN_C0C48F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C4AF
	EVENT_CALLROUTINE UNKNOWN_C0C4AF
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C62B
	EVENT_CALLROUTINE UNKNOWN_C0C62B
.ENDMACRO

.MACRO EVENT_GET_DIRECTION_ROTATED_CLOCKWISE
	EVENT_CALLROUTINE GET_DIRECTION_ROTATED_CLOCKWISE
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C6B6
	EVENT_CALLROUTINE UNKNOWN_C0C6B6
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C7DB
	EVENT_CALLROUTINE UNKNOWN_C0C7DB
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0C83B
	EVENT_CALLROUTINE UNKNOWN_C0C83B
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0CA4E
	EVENT_CALLROUTINE UNKNOWN_C0CA4E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0CC11
	EVENT_CALLROUTINE UNKNOWN_C0CC11
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0CCCC
	EVENT_CALLROUTINE UNKNOWN_C0CCCC
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0CD50
	EVENT_CALLROUTINE UNKNOWN_C0CD50
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0CEBE
	EVENT_CALLROUTINE UNKNOWN_C0CEBE
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D0D9
	EVENT_CALLROUTINE UNKNOWN_C0D0D9
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D0E6
	EVENT_CALLROUTINE UNKNOWN_C0D0E6
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D15C
	EVENT_CALLROUTINE UNKNOWN_C0D15C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D59B
	EVENT_CALLROUTINE UNKNOWN_C0D59B
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D5B0
	EVENT_CALLROUTINE UNKNOWN_C0D5B0
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D77F
	EVENT_CALLROUTINE UNKNOWN_C0D77F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D7B3
	EVENT_CALLROUTINE UNKNOWN_C0D7B3
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D7C7
	EVENT_CALLROUTINE UNKNOWN_C0D7C7
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0D98F
	EVENT_CALLROUTINE UNKNOWN_C0D98F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0EC77
	EVENT_CALLROUTINE UNKNOWN_C0EC77
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0ECB7
	EVENT_CALLROUTINE UNKNOWN_C0ECB7
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0ED5C
	EVENT_CALLROUTINE UNKNOWN_C0ED5C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0EDD1
	EVENT_CALLROUTINE UNKNOWN_C0EDD1
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0EDDA
	EVENT_CALLROUTINE UNKNOWN_C0EDDA
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0F3E8
	EVENT_CALLROUTINE UNKNOWN_C0F3E8
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0F3B2
	EVENT_CALLROUTINE UNKNOWN_C0F3B2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C2DB3F
	EVENT_CALLROUTINE UNKNOWN_C2DB3F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C2654C
	EVENT_CALLROUTINE UNKNOWN_C2654C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C2EA15
	EVENT_CALLROUTINE UNKNOWN_C2EA15
.ENDMACRO

.MACRO EVENT_UNKNOWN_C2EA74
	EVENT_CALLROUTINE UNKNOWN_C2EA74
.ENDMACRO

.MACRO EVENT_UNKNOWN_C2EACF
	EVENT_CALLROUTINE UNKNOWN_C2EACF
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0ED14
	EVENT_CALLROUTINE UNKNOWN_C0ED14
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0ED39
	EVENT_CALLROUTINE UNKNOWN_C0ED39
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0EE47
	EVENT_CALLROUTINE UNKNOWN_C0EE47
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0EE53
	EVENT_CALLROUTINE UNKNOWN_C0EE53
.ENDMACRO

.MACRO EVENT_UNKNOWN_C2FF9A
	EVENT_CALLROUTINE UNKNOWN_C2FF9A
.ENDMACRO

.MACRO EVENT_UNKNOWN_C40015
	EVENT_CALLROUTINE UNKNOWN_C40015
.ENDMACRO

.MACRO EVENT_UNKNOWN_C40023
	EVENT_CALLROUTINE UNKNOWN_C40023
.ENDMACRO

.MACRO EVENT_UNKNOWN_C423DC
	EVENT_CALLROUTINE UNKNOWN_C423DC
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4240A
	EVENT_CALLROUTINE UNKNOWN_C4240A
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4248A
	EVENT_CALLROUTINE UNKNOWN_C4248A
.ENDMACRO

.MACRO EVENT_UNKNOWN_C424D1
	EVENT_CALLROUTINE UNKNOWN_C424D1
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4257F
	EVENT_CALLROUTINE UNKNOWN_C4257F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4258C
	EVENT_CALLROUTINE UNKNOWN_C4258C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C425F3
	EVENT_CALLROUTINE UNKNOWN_C425F3
.ENDMACRO

.MACRO EVENT_UNKNOWN_C42624
	EVENT_CALLROUTINE UNKNOWN_C42624
.ENDMACRO

.MACRO EVENT_UNKNOWN_C426ED
	EVENT_CALLROUTINE UNKNOWN_C426ED
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46712
	EVENT_CALLROUTINE UNKNOWN_C46712
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4675C
	EVENT_CALLROUTINE UNKNOWN_C4675C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C467B4
	EVENT_CALLROUTINE UNKNOWN_C467B4
.ENDMACRO

.MACRO EVENT_UNKNOWN_C467C2
	EVENT_CALLROUTINE UNKNOWN_C467C2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C467E6
	EVENT_CALLROUTINE UNKNOWN_C467E6
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4681A
	EVENT_CALLROUTINE UNKNOWN_C4681A
.ENDMACRO

.MACRO EVENT_UNKNOWN_C468A9
	EVENT_CALLROUTINE UNKNOWN_C468A9
.ENDMACRO

.MACRO EVENT_UNKNOWN_C468AF
	EVENT_CALLROUTINE UNKNOWN_C468AF
.ENDMACRO

.MACRO EVENT_UNKNOWN_C468B5
	EVENT_CALLROUTINE UNKNOWN_C468B5
.ENDMACRO

.MACRO EVENT_UNKNOWN_C468DC
	EVENT_CALLROUTINE UNKNOWN_C468DC
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46903
	EVENT_CALLROUTINE UNKNOWN_C46903
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46914
	EVENT_CALLROUTINE UNKNOWN_C46914
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46957
	EVENT_CALLROUTINE UNKNOWN_C46957
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46A6E
	EVENT_CALLROUTINE UNKNOWN_C46A6E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46A9A
	EVENT_CALLROUTINE UNKNOWN_C46A9A
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46ADB
	EVENT_CALLROUTINE UNKNOWN_C46ADB
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46B0A
	EVENT_CALLROUTINE UNKNOWN_C46B0A
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46B2D
	EVENT_CALLROUTINE UNKNOWN_C46B2D
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46B37
	EVENT_CALLROUTINE UNKNOWN_C46B37
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46B51
	EVENT_CALLROUTINE UNKNOWN_C46B51
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46B65
	EVENT_CALLROUTINE UNKNOWN_C46B65
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46C87
	EVENT_CALLROUTINE UNKNOWN_C46C87
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46D23
	EVENT_CALLROUTINE UNKNOWN_C46D23
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46D4B
	EVENT_CALLROUTINE UNKNOWN_C46D4B
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46E74
	EVENT_CALLROUTINE UNKNOWN_C46E74
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46EF8
	EVENT_CALLROUTINE UNKNOWN_C46EF8
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47044
	EVENT_CALLROUTINE UNKNOWN_C47044
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47269
	EVENT_CALLROUTINE UNKNOWN_C47269
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4730E
	EVENT_CALLROUTINE UNKNOWN_C4730E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47333
	EVENT_CALLROUTINE UNKNOWN_C47333
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4733C
	EVENT_CALLROUTINE UNKNOWN_C4733C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4734C
	EVENT_CALLROUTINE UNKNOWN_C4734C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47369
	EVENT_CALLROUTINE UNKNOWN_C47369
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47499
	EVENT_CALLROUTINE UNKNOWN_C47499
.ENDMACRO

.MACRO EVENT_UNKNOWN_C474A8
	EVENT_CALLROUTINE UNKNOWN_C474A8
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47A6B
	EVENT_CALLROUTINE UNKNOWN_C47A6B
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47A9E
	EVENT_CALLROUTINE UNKNOWN_C47A9E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C47B77
	EVENT_CALLROUTINE UNKNOWN_C47B77
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4880C
	EVENT_CALLROUTINE UNKNOWN_C4880C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C48A6D
	EVENT_CALLROUTINE UNKNOWN_C48A6D
.ENDMACRO

.MACRO EVENT_UNKNOWN_C48B2C
	EVENT_CALLROUTINE UNKNOWN_C48B2C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C48B3B
	EVENT_CALLROUTINE UNKNOWN_C48B3B
.ENDMACRO

.MACRO EVENT_UNKNOWN_C49740
	EVENT_CALLROUTINE UNKNOWN_C49740
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4978E
	EVENT_CALLROUTINE UNKNOWN_C4978E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4981F
	EVENT_CALLROUTINE UNKNOWN_C4981F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C49841
	EVENT_CALLROUTINE UNKNOWN_C49841
.ENDMACRO

.MACRO EVENT_UNKNOWN_C49EC4
	EVENT_CALLROUTINE UNKNOWN_C49EC4
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4A7B0
	EVENT_CALLROUTINE UNKNOWN_C4A7B0
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CB4F
	EVENT_CALLROUTINE UNKNOWN_C4CB4F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CB8F
	EVENT_CALLROUTINE UNKNOWN_C4CB8F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CBE3
	EVENT_CALLROUTINE UNKNOWN_C4CBE3
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CC2C
	EVENT_CALLROUTINE UNKNOWN_C4CC2C
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CC2F
	EVENT_CALLROUTINE UNKNOWN_C4CC2F
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CD44
	EVENT_CALLROUTINE UNKNOWN_C4CD44
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CEB0
	EVENT_CALLROUTINE UNKNOWN_C4CEB0
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4CED8
	EVENT_CALLROUTINE UNKNOWN_C4CED8
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4DED0
	EVENT_CALLROUTINE UNKNOWN_C4DED0
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4E2D7
	EVENT_CALLROUTINE UNKNOWN_C4E2D7
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4E4DA
	EVENT_CALLROUTINE UNKNOWN_C4E4DA
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4E4F9
	EVENT_CALLROUTINE UNKNOWN_C4E4F9
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4EC6E
	EVENT_CALLROUTINE UNKNOWN_C4EC6E
.ENDMACRO

.MACRO EVENT_UNKNOWN_C4ECE7
	EVENT_CALLROUTINE UNKNOWN_C4ECE7
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF027D
	EVENT_CALLROUTINE UNKNOWN_EF027D
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0CA7
	EVENT_CALLROUTINE UNKNOWN_EF0CA7
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0C87
	EVENT_CALLROUTINE UNKNOWN_EF0C87
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0C97
	EVENT_CALLROUTINE UNKNOWN_EF0C97
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0D23
	EVENT_CALLROUTINE UNKNOWN_EF0D23
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0D46
	EVENT_CALLROUTINE UNKNOWN_EF0D46
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0D73
	EVENT_CALLROUTINE UNKNOWN_EF0D73
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0D8D
	EVENT_CALLROUTINE UNKNOWN_EF0D8D
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0DFA
	EVENT_CALLROUTINE UNKNOWN_EF0DFA
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0E67
	EVENT_CALLROUTINE UNKNOWN_EF0E67
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0E8A
	EVENT_CALLROUTINE UNKNOWN_EF0E8A
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0F60
	EVENT_CALLROUTINE UNKNOWN_EF0F60
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0FDB
	EVENT_CALLROUTINE UNKNOWN_EF0FDB
.ENDMACRO

.MACRO EVENT_UNKNOWN_EF0FF6
	EVENT_CALLROUTINE UNKNOWN_EF0FF6
.ENDMACRO

.MACRO EVENT_UNKNOWN_C03DAA
	EVENT_CALLROUTINE UNKNOWN_C03DAA
.ENDMACRO

.MACRO EVENT_UNKNOWN_C04EF0
	EVENT_CALLROUTINE UNKNOWN_C04EF0
.ENDMACRO

.MACRO EVENT_GET_DIRECTION_FROM_PLAYER_TO_ENTITY
	EVENT_CALLROUTINE GET_DIRECTION_FROM_PLAYER_TO_ENTITY
.ENDMACRO

.MACRO EVENT_UNKNOWN_C46E46
	EVENT_CALLROUTINE UNKNOWN_C46E46
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A685 arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0A685, arg, arg2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A685_ME2
	EVENT_CALLROUTINE UNKNOWN_C0A685_ENTRY2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A6E3
	EVENT_CALLROUTINE UNKNOWN_C0A6E3
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AA6E arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0AA6E, arg, arg2
.ENDMACRO

.MACRO EVENT_PLAY_SOUND arg
	EVENT_CALLROUTINE UNKNOWN_C0A841, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_SET_DIRECTION8 arg
	EVENT_CALLROUTINE SET_DIRECTION8, .LOBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A679 arg
	EVENT_CALLROUTINE UNKNOWN_C0A679, .LOBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A864 arg
	EVENT_CALLROUTINE UNKNOWN_C0A864, .LOBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A907 arg
	EVENT_CALLROUTINE UNKNOWN_C0A907, .LOBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A943 arg
	EVENT_CALLROUTINE UNKNOWN_C0A943, .LOBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A857 arg
	EVENT_CALLROUTINE UNKNOWN_C0A857, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A86F arg
	EVENT_CALLROUTINE UNKNOWN_C0A86F, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A92D arg
	EVENT_CALLROUTINE UNKNOWN_C0A92D, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A938 arg
	EVENT_CALLROUTINE UNKNOWN_C0A938, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A94E arg
	EVENT_CALLROUTINE UNKNOWN_C0A94E, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A959 arg
	EVENT_CALLROUTINE UNKNOWN_C0A959, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A964 arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0A964, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_SPAWN_ENTITY_RELATIVE arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0A99F, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_SPAWN_ENTITY_UNKNOWN arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0A98B, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A87A arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0A87A, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AAD5 arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0AAD5, .LOBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A8B3 arg, arg2
	EVENT_CALLROUTINE UNKNOWN_C0A8B3, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A643 arg
	EVENT_CALLROUTINE UNKNOWN_C0A643, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A6A2 arg
	EVENT_CALLROUTINE UNKNOWN_C0A6A2, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_FADE_OUT arg1, arg2
	EVENT_CALLROUTINE ACTIONSCRIPT_FADE_OUT, arg1, arg2
.ENDMACRO

.MACRO EVENT_FADE_IN arg1, arg2
	EVENT_CALLROUTINE ACTIONSCRIPT_FADE_IN, arg1, arg2
.ENDMACRO

.MACRO EVENT_UNKNOWN_C05E76 arg1, arg2
	EVENT_CALLROUTINE UNKNOWN_C05E76, arg1, .LOBYTE(arg2), .HIBYTE(arg2), .BANKBYTE(arg2)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A6AD arg
	EVENT_CALLROUTINE UNKNOWN_C0A6AD, .LOBYTE(arg), .HIBYTE(arg)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A9B3 arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0A9B3, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A912 arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0A912, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A9EB arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0A9EB, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3)
.ENDMACRO

.MACRO EVENT_FADE_OUT_WITH_MOSAIC arg, arg2, arg3
	EVENT_CALLROUTINE ACTIONSCRIPT_FADE_OUT_WITH_MOSAIC, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AA23 arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0AA23, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AAB5 arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0AAB5, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .LOBYTE(arg3)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0AA3F arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0AA3F, .LOBYTE(arg), .LOBYTE(arg2),.LOBYTE(arg3)
.ENDMACRO

.MACRO EVENT_UNKNOWN_C0A9CF arg, arg2, arg3
	EVENT_CALLROUTINE UNKNOWN_C0A9CF, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3)
.ENDMACRO

.MACRO EVENT_CHOOSE_RANDOM arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10
	.IF(.PARAMCOUNT = 1)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg)
	.ENDIF
	.IF(.PARAMCOUNT = 2)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2)
	.ENDIF
	.IF(.PARAMCOUNT = 3)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3)
	.ENDIF
	.IF(.PARAMCOUNT = 4)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4)
	.ENDIF
	.IF(.PARAMCOUNT = 5)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4), .LOBYTE(arg5), .HIBYTE(arg5)
	.ENDIF
	.IF(.PARAMCOUNT = 6)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4), .LOBYTE(arg5), .HIBYTE(arg5), .LOBYTE(arg6), .HIBYTE(arg6)
	.ENDIF
	.IF(.PARAMCOUNT = 7)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4), .LOBYTE(arg5), .HIBYTE(arg5), .LOBYTE(arg6), .HIBYTE(arg6), .LOBYTE(arg7), .HIBYTE(arg7)
	.ENDIF
	.IF(.PARAMCOUNT = 8)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4), .LOBYTE(arg5), .HIBYTE(arg5), .LOBYTE(arg6), .HIBYTE(arg6), .LOBYTE(arg7), .HIBYTE(arg7), .LOBYTE(arg8), .HIBYTE(arg8)
	.ENDIF
	.IF(.PARAMCOUNT = 9)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4), .LOBYTE(arg5), .HIBYTE(arg5), .LOBYTE(arg6), .HIBYTE(arg6), .LOBYTE(arg7), .HIBYTE(arg7), .LOBYTE(arg8), .HIBYTE(arg8), .LOBYTE(arg9), .HIBYTE(arg9)
	.ENDIF
	.IF(.PARAMCOUNT = 10)
		EVENT_CALLROUTINE CHOOSE_RANDOM, .PARAMCOUNT, .LOBYTE(arg), .HIBYTE(arg), .LOBYTE(arg2), .HIBYTE(arg2), .LOBYTE(arg3), .HIBYTE(arg3), .LOBYTE(arg4), .HIBYTE(arg4), .LOBYTE(arg5), .HIBYTE(arg5), .LOBYTE(arg6), .HIBYTE(arg6), .LOBYTE(arg7), .HIBYTE(arg7), .LOBYTE(arg8), .HIBYTE(arg8), .LOBYTE(arg9), .HIBYTE(arg9), .LOBYTE(arg10), .HIBYTE(arg10)
	.ENDIF
.ENDMACRO
