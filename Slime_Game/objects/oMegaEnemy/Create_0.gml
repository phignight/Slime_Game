hsp = 0;
vsp = 0;
grv = 0.39;
fric = 0.17;
jumpsp = 4;
walksp = 0.5;
damage = 250;
hp = 70;

damage_taken = 0;
cooldown = 0;

movement_direction = -1;
collide = false;

idle_sprite = sSlimeBossIdle;
walk_sprite = sSlimeBossWalk;
jump_sprite = sSlimeBossSleep;
dance_sprite = sSlimeBossDance;

tiles_layer_id = layer_get_id("Tiles");
tilemap = layer_tilemap_get_id(tiles_layer_id);