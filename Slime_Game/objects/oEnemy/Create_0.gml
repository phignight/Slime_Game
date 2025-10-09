hsp = 0;
vsp = 0;
grv = 0.39;
fric = 0.17;
jumpsp = 4;
walksp = 1;
damage = 100;

movement_direction = 1;
collide = false;

idle_sprite = sSlimeGreyIdle
walk_sprite = sSlimeGreyWalk
jump_sprite = sSlimeGreySleep
dance_sprite = sSlimeGreyDance

tiles_layer_id = layer_get_id("Tiles");
tilemap = layer_tilemap_get_id(tiles_layer_id);