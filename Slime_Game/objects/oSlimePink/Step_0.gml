image_xscale = movement_direction*abs(image_xscale);

// Death State
if (dead == true) {
	// Let splash animation play
	sprite_index = death_anim;
	image_xscale = 2;
    image_yscale = 2;
	
    // Check if death animation has finished playing
    if (image_index >= image_number - 1) {
        // Respawn
        x = 4000;
        y = 608;
        hp = max_hp;
        injured = false;
        injured_timer = 0;
        dead = false;
        image_index = 0;
		image_speed = 1;
		image_xscale = 1;
		image_yscale = 1;
    }
    // Skip the rest of the code while dead
    exit;
}


// Injured State
if (injured == true) {
    injured_timer--;
    if (injured_timer <= 0) {
        injured = false;
		injured_timer = 0;
    }
}

// Gravity
vsp += grv;

// Horizontal Collision
if (hsp != 0) {
	var steps = abs(hsp);
	repeat(steps) {
		if (!place_meeting(x + sign(hsp), y, tilemap)) {
			x += sign(hsp);
		} else {
			hsp = 0;
			break;
		}
	}
}

// Boundaries of Room
var spr_width = abs(sprite_width);
x = clamp(x, spr_width/2, room_width - spr_width/2);
if (x == spr_width/2 || x == room_width - spr_width/2) {
	hsp = 0;
}

// Vertical Collision
if (vsp != 0) {
	var steps = abs(vsp);
	repeat(steps) {
		if (!place_meeting(x, y + sign(vsp), tilemap)) {
			y += sign(vsp);
		} else {
			vsp = 0;
			break;
		}
	}
}

// Boundaries of Room
y = clamp(y, sprite_height/2, room_height - sprite_height/2);
if (y == sprite_height/2) {
	vsp = 0;
} else if (y == room_height - sprite_height/2) {
	dead = true;
	vsp = 0;
}

// -- Obstacle/Enemy Damage --
if (instance_exists(oSlimeGreen)) {
    var reunion = place_meeting(x, y, oSlimeGreen);
	
    if (reunion) {
		if (place_meeting(x, y + sprite_height, oEnemy)) {
			// Nudge towards him
			hsp = sign(x + oSlimeGreen.x) * 2;
			vsp = -1;
		}
    }
}

if (hp <= 0) {
    dead = true;
}

// Animation
if (vsp < 0) {
	sprite_index = sleep_sprite;
}  else if (dead == true) {
	sprite_index = dead_sprite;
} else if (hsp != 0){
	sprite_index = walk_sprite;
} else {
	sprite_index = idle_sprite;
}
