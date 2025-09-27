key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);

var move = key_right - key_left;

hsp = move * walksp;

// Gravity
vsp += grv;

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x = x + sign(hsp)
	}
	hsp = 0;
}

// Vertical Collision
if (place_meeting(x,y+vsp,oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) {
		y = y + sign(vsp)
	}
	vsp = 0;
}

// if moving: apply friction in OPPOSITE direction of movement
// Movement
if (hsp > 0) { // Right movement
	// Friction
	hsp += -(fric);
	sprite_index = sSlimeGreenWalkRight;
} else if (hsp < 0) { // Left movement
	// Friction
	hsp += fric;
	sprite_index = sSlimeGreenWalkLeft;
} else { // No movement
	sprite_index = sSlimeGreenIdle;
} // FIX: idle anim should be facing the direction it moved last

// Jumping
if (key_jump) {
	vsp = -(key_jump) * jumpsp;
}

// Update Position
x = x + hsp;
y = y + vsp;