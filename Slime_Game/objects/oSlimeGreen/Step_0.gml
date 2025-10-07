var key_left = keyboard_check(vk_left);
var key_right = keyboard_check(vk_right);
var key_jump = keyboard_check(vk_space);

var move = key_right - key_left;
_debug_move = move

if (move != 0) {
	hsp = move * walksp;
    // X Sprite Direction
    image_xscale = sign(move)*abs(image_xscale);
} else {
    // Friction
    hsp = lerp(hsp, 0, fric);
}

// Death State
if (dead == true) {
	x = 96;
	y = 480.40;
	hp = max_hp;
	injured = false;
	injured_timer = 0;
	dead = false;
}

// Injured State
if (injured == true) {
    injured_timer--;
    if (injured_timer <= 0) {
        injured = false;
    }
}

show_debug_message("Dead: " + string(dead));
show_debug_message("Injured: " + string(injured));
show_debug_message("HP: " + string(hp));
show_debug_message("HSP: " + string(hsp));
show_debug_message("Move: " + string(move));
show_debug_message("X: " + string(x));
show_debug_message("Y: " + string(y));

// Gravity
vsp += grv;

// Jumping State
if (key_jump && place_meeting(x, y + 1, tilemap)) {
	show_debug_message("JUMPED");
	vsp = -jumpsp;
}

// Horizontal Collision
if (place_meeting(x+hsp,y,tilemap)) { // Collision with tiles
	while (!place_meeting(x+sign(hsp),y,tilemap)) {
		x = x + sign(hsp)
	}
	hsp = 0;
} else if (x+hsp < 0) or (x+hsp > room_width) { // Boundaries of room
	hsp = 0;
}

// Vertical Collision
if (place_meeting(x,y+vsp,tilemap)) { // Collision with tiles
	while (!place_meeting(x,y+sign(vsp),tilemap)) {
		y = y + sign(vsp)
	}
	vsp = 0;
} else if (y+hsp < 0) or (y+vsp > room_height + sprite_height) { // Boundaries of room
	vsp = 0;
	dead = true;
}

// Animation
if (vsp < 0) {
	sprite_index = sleep_sprite;
}  else if (dead == true) {
	sprite_index = dead_sprite;
} else if (hsp != 0){
	sprite_index = walk_sprite;
} else if (injured == true) {
	sprite_index = injured_sprite;
} else {
	sprite_index = idle_sprite;
}

// -- Obstacle/Enemy Damage --
if(instance_exists(oBomb)){
	if (oBomb.go_off == true) {
		injured = true;
		hp -= (oBomb.damage/oBomb.cooldown);
		// bounce slime off of
	}
}

if(instance_exists(oEnemy)){
    var enemy_collision = place_meeting(x, y, oEnemy);
    
    if (enemy_collision && !injured) { 
        show_debug_message("ENEMY HIT!")
        injured = true;
        //injured_timer = 60;
        hp -= oEnemy.damage;
		
		//TODO: enemy only deals damage if hit them from any but y direction. jumping on top is safe
        
        // Knockback away from enemy
        hsp = sign(x - oEnemy.x) * 4; // Push away from enemy
        vsp = -4; // Bounce up
    }
}

if hp < 0 {
	dead = true;
}
//else {
	// flash sprite to show damage
	// health bar goes down
//}


// Update Position
x = x + hsp;
y = y + vsp;