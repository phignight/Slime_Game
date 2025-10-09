hsp = 0;
vsp = 0;
grv = 0.4;
fric = 0.15;
jumpsp = 8;
walksp = -3.7;
hp = 600;
max_hp = 600;
injured_timer = 8;
movement_direction = -1;
image_xscale = movement_direction*abs(image_xscale);

_debug_move = 0

// States
dead = false;
injured = false;

cooldown_timer = 0;

// Animation
idle_sprite = sSlimePinkIdle;
walk_sprite = sSlimePinkWalk;
sleep_sprite = sSlimePinkSleep;
dance_sprite = sSlimePinkDance;
death_anim = deat;
dead_sprite = sSlimeGreenInjuredB; // change later
injured_sprite = sSlimeGreenInjuredW;

tiles_layer_id = layer_get_id("Tiles");
tilemap = layer_tilemap_get_id(tiles_layer_id);