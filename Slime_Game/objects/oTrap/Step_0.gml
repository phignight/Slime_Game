// Only trigger if not already going off and not in cooldown
if (!go_off && cooldown <= 0) {
    if (place_meeting(x, y, oSlimeGreen)) {
        go_off = true;
        has_damaged = false;
        image_index = 0; // Ensure animation starts from frame 0
    }
}

if (go_off == true) {
    image_speed = 1;
    
    // Check if animation finished
    if (image_index >= image_number) {
        go_off = false;
        image_index = 0;
        image_speed = 0;
        cooldown = 60; // Set cooldown timer (adjust as needed)
    }
} else {
    image_speed = 0;
    image_index = 0; // FORCE frame to stay at 0 when idle
    
    // Count down cooldown
    if (cooldown > 0) {
        cooldown--;
    }
}