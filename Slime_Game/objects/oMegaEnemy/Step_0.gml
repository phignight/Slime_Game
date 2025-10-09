// Proposed speed
hsp = movement_direction * walksp;

if damage_taken > 0 {
	audio_play_sound(sfx_enemyhit,0,false)
	if cooldown <= 8 {
		sprite_index = dance_sprite;
		cooldown ++;
	}
	if damage_taken < hp {
		cooldown = 0;
		sprite_index = idle_sprite;
	} else {
		audio_play_sound(victory_sfx,0,false);
		instance_destroy();
	}
}

// Boolean
//collide = place_meeting(x+hsp,y,oSlimeGreen);

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
}

var spr_width = abs(sprite_width);
x = clamp(x, spr_width/2, room_width - spr_width/2);
if (x == spr_width/2 || x == room_width - spr_width/2) {
	movement_direction *= -1;
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
} else if (hsp != 0) {
	sprite_index = walk_sprite;
} else {
	sprite_index = idle_sprite;
}


// Update Position
x = x + hsp;
y = y + vsp;