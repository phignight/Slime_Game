x += flysp;

if (x < 0 or x > room_width) { // Boundaries of room
    x = clamp(x, 0, room_width);
    flysp = -flysp;
	sprite_index = mr_bird_left
    //image_xscale = sign(flysp) * abs(image_xscale);
}