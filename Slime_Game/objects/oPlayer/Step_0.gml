var key_left = keyboard_check(vk_left);
var key_right = keyboard_check(vk_right);
var key_jump = keyboard_check(vk_space);

var move = key_right - key_left;

hsp = move * walksp;

// Gravity
vsp += grv;

// Movement
if (move != 0) {
	image_xscale = sign(move)*abs(image_xscale);
}

// Jumping
if (key_jump && place_meeting(x, y + 1, tilemap)) {
	vsp = -jumpsp;
}

// Horizontal Collision
if (place_meeting(x+hsp,y,tilemap)) {
	while (!place_meeting(x+sign(hsp),y,tilemap)) {
		x = x + sign(hsp)
	}
	hsp = 0;
}

// Vertical Collision
if (place_meeting(x,y+vsp,tilemap)) {
	while (!place_meeting(x,y+sign(vsp),tilemap)) {
		y = y + sign(vsp)
	}
	vsp = 0;
}

// Animation
if (vsp < 0) {
	sprite_index = jump_sprite;
} else if (hsp != 0) {
	sprite_index = walk_sprite;
} else {
	sprite_index = idle_sprite;
}

// Update Position
x = x + hsp;
y = y + vsp;