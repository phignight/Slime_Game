
if (place_meeting(x-hit_area,y,oSlimeGreen)) 
	or (place_meeting(x+hit_area,y,oSlimeGreen))
	or (place_meeting(x,y-hit_area,oSlimeGreen))
	or (place_meeting(x,y+hit_area,oSlimeGreen)) {
		go_off = true;
	}
	
if (go_off == true) {
	image_speed = 1.5;
	cooldown --;
	if (cooldown = 0) {
		instance_destroy(self);
	}
} else {
	image_speed = 0;
	}