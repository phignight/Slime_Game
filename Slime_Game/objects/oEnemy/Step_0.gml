// Proposed speed
hsp = movement_direction * walksp;

// Boolean
collide = place_meeting(x+hsp,y,oSlimeGreen);

// Gravity
vsp += grv;

// Direction sprite is facing
if (hsp != 0) {
	image_xscale = movement_direction*abs(image_xscale);
}

// Horizontal Collision
if (place_meeting(x+hsp,y,tilemap)) { // X Collision with tiles
	movement_direction *= -1;
	while (!place_meeting(x+sign(hsp),y,tilemap)) {
		x = x + sign(hsp);
	}
	hsp = 0;
} else if (x+hsp < 0) or (x+hsp > room_width) { // Boundaries of room
	movement_direction *= -1;
	x = x + sign(hsp);
	hsp = 0;
}

// Ledge detection
var ledge_check_x = x + movement_direction * 2; // Look slightly ahead (adjust 4 as needed)
var ledge_check_y = y + sprite_height;

if (!place_meeting(ledge_check_x, ledge_check_y, tilemap)) {
	movement_direction *= -1;
	hsp = 0;
	y -= 3;
}

// Vertical Collision
if (place_meeting(x,y+vsp,tilemap)) { // Collision with tiles
	while (!place_meeting(x,y+sign(vsp),tilemap)) {
		y = y + sign(vsp)
	}
	vsp = 0;
} else if (y+hsp < 0) or (y+vsp > room_height + sprite_height) { // Boundaries of room
	vsp = 0;
}

// Animation
if (vsp < 0) {
	sprite_index = jump_sprite;
} else if collide == true {
	sprite_index = dance_sprite;
} else if (hsp != 0) {
	sprite_index = walk_sprite;
} else {
	sprite_index = idle_sprite;
}

// Update Position
x = x + hsp;
y = y + vsp;