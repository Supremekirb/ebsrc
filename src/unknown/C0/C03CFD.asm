
UNKNOWN_C03CFD: ;$C03CFD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA GAME_STATE+game_state::walking_style
	CMP #WALKING_STYLE::BICYCLE
	BNEL @RETURN
	LDA #$0001
	JSL SET_BOUNDARY_BEHAVIOR
	LDA BATTLE_DEBUG
	BNE @UNKNOWN1
	LDA UNKNOWN_7E5D9A
	BNE @UNKNOWN1
	JSL UNKNOWN_C06A07
@UNKNOWN1:
	LDA #$0018
	JSL UNKNOWN_C02140
	STZ GAME_STATE + game_state::unknown92
	STZ GAME_STATE+game_state::walking_style
	STZ CHAR_STRUCT+char_struct::position_index
	STZ GAME_STATE + game_state::unknown88
	LDA UNKNOWN_7E5D9A
	BNE @UNKNOWN2
	JSL OAM_CLEAR
	JSL RUN_ACTIONSCRIPT_FRAME
	JSL UPDATE_SCREEN
	JSL WAIT_UNTIL_NEXT_FRAME
@UNKNOWN2:
	STZ NEW_ENTITY_VAR0
	STZ NEW_ENTITY_VAR1
	LDA ENTITY_ABS_X_TABLE + (PARTY_LEADER_ENTITY_INDEX * 2)
	STA $0E
	LDA ENTITY_ABS_Y_TABLE + (PARTY_LEADER_ENTITY_INDEX * 2)
	STA $10
	LDY #$0018
	LDX #EVENT_SCRIPT::EVENT_002
	LDA #OVERWORLD_SPRITE::NESS
	JSL CREATE_ENTITY
	STZ ENTITY_ANIMATION_FRAME + (PARTY_LEADER_ENTITY_INDEX * 2)
	LDA GAME_STATE+game_state::leader_direction
	STA ENTITY_DIRECTIONS + (PARTY_LEADER_ENTITY_INDEX * 2)
	LDX #.LOWORD(ENTITY_SCRIPT_VAR7_TABLE) + (24 * 2)
	LDA __BSS_START__,X
	ORA #$9000
	STA __BSS_START__,X
	LDA UNKNOWN_7E5D9A
	BEQ @UNKNOWN3
	LDX #.LOWORD(ENTITY_TICK_CALLBACK_HIGH) + (24 * 2)
	LDA __BSS_START__,X
	ORA #$C000
	STA __BSS_START__,X
.IF .DEFINED(JPN)
.ELSEIF .DEFINED(PROTOTYPE19950327)
.ELSE
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL WAIT_UNTIL_NEXT_FRAME
.ENDIF
	LDA #$0018
	JSL UNKNOWN_C0A780
@UNKNOWN3:
	STZ UNKNOWN_7E5DBA
	LDA #$0002
	STA INPUT_DISABLE_FRAME_COUNTER
@RETURN:
	PLD
	RTL
