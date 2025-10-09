draw_set_color(c_red);

if (place_meeting(x,y,oSlimeGreen)) {
	if (ind < num) {
		//Update text pos
		x_pos = oSlimeGreen.x+40;
		y_pos = oSlimeGreen.y-70;
		chapter = story[ind];
		show_debug_message("chapter: " + chapter + "\n");
		//array_delete(story,0,1);
		//instance_destroy();
	}
}