hsp = 0;
vsp = 0;
grv = 0.4;
fric = 0.2;
jumpsp = 8;
walksp = 4;
hp = 600;
max_hp = 600;
injured_timer = 8;
damage = 25;

_debug_move = 0

// States
dead = false;
injured = false;
falling = false;

cooldown_timer = 0;

//SFX
injured_sfx = sfx_Injured;
jump_sfx = sfx_jump;
death_sfx = sfx_death;
super_jump_sfx = sfx_super_jump;
boss_jump_sfx = sfx_bossjump;

// Animation
idle_sprite = sSlimeGreenIdle;
walk_sprite = sSlimeGreenWalk;
sleep_sprite = sSlimeGreenSleep;
dance_sprite = sSlimeGreenDance;
death_anim = deat;
dead_sprite = sSlimeGreenInjuredB; // change later
injured_sprite = sSlimeGreenInjuredW;

tiles_layer_id = layer_get_id("Tiles");
tilemap = layer_tilemap_get_id(tiles_layer_id);