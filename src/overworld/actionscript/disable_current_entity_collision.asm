
DISABLE_CURRENT_ENTITY_COLLISION: ;$C0A6D1
	LDX $88
	LDA #ENTITY_COLLISION_DISABLED
	STA ENTITY_COLLIDED_OBJECTS,X
	RTL
