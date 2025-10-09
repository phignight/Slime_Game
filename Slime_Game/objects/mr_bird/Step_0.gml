x += flysp;
image_xscale = movement_direction*abs(image_xscale);

if (x < 0 or x > room_width) { // Boundaries of room
    x = clamp(x, 0, room_width);
    flysp = -flysp;
	
}