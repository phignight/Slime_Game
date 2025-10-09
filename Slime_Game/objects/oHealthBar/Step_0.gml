x = camera_get_view_x(view_camera[0]) + x_offset;
y = camera_get_view_y(view_camera[0]) + y_offset;

if (oSlimeGreen.injured == true) {
	var hp = oSlimeGreen.hp/100;
	image_index = floor(hp);
} else if (oSlimeGreen.hp == oSlimeGreen.max_hp) {
	image_index = 6;
}