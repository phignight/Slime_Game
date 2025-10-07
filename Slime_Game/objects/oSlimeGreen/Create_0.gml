hsp = 0;
vsp = 0;
grv = 0.4;
fric = 0.2;
jumpsp = 8;
walksp = 4;
hp = 200;
max_hp = 200;
injured_timer = 5;

_debug_move = 0

// States
dead = false;
injured = false;

cooldown_timer = 0;

// Animation
idle_sprite = sSlimeGreenIdle;
walk_sprite = sSlimeGreenWalk;
sleep_sprite = sSlimeGreenSleep;
dance_sprite = sSlimeGreenDance;
dead_sprite = sSlimeGreenDance; // change later
injured_sprite = sSlimeGreenSleep;

tiles_layer_id = layer_get_id("Tiles");
tilemap = layer_tilemap_get_id(tiles_layer_id);