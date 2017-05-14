// Init Variables
floor_meeting = place_meeting( x, y+1, oCollision);
right_free = place_empty( x+5, y);
left_free = place_empty( x-5, y);
tap_space = keyboard_check_pressed(vk_space);
tap_right = keyboard_check(vk_right);
tap_left = keyboard_check(vk_left);
tap_z = keyboard_check_pressed(ord("Z")); 

// Setting Gravity (Sets gravity and it's direction. Also reset double jumps)
if !floor_meeting 
{
    gravity = 2.0;
    gravity_direction = 270;
}
else
    jump_count = 0;

// Interaction of Pressing Space (Makes the player jump. Handle double jumps too)
if tap_space 
{
    if jump_count == 0 
    {
        jump_count += 1;
        vspeed = -20;
        sprite_index = sJump;
		audio_play_sound(Jump01,0,0); // Play jumping sound
    }
    else if jump_count == 1 
    {
        jump_count += 1;
        vspeed = -20;
        sprite_index = sJump;
		audio_play_sound(Jump01,0,0); // Play jumping sound
    }
}

// Interaction of Pressing Right (Makes the plaer move to right. Allows to move with jump or by feet both)
else if tap_right and right_free 
{
    if floor_meeting
    {
        image_speed = 1.75
        sprite_index = sWalk;
    }
    else 
    {
        if vspeed < 0 
        {
            if jump_count == 1
                sprite_index = sJump;
            else 
            {
                image_speed = 1;
                sprite_index = sJump;
            }
        }
        else
		{
            sprite_index = sFall;
		}
    }
    image_xscale = 1;
    x += 10;
}

// Interaction of Pressing Left (Makes the plaer move to left. Allows to move with jump or by feet both)
else if tap_left and left_free 
{
    if floor_meeting
    {
        image_speed = 1.75
        sprite_index = sWalk;
    }
    else 
    {
        if vspeed < 0 
        {
            if jump_count == 1
			{
                sprite_index = sJump;
			}
            else 
            {
                image_speed = 1;
                sprite_index = sJump
            }
        }
        else
		{
            sprite_index = sFall;
		}
    }
    image_xscale = -1;
    x -= 10;
}

// Idle mode (Also handle jumps)
else 
{
    if floor_meeting
	{
		image_speed = 0; // Stop animation
		image_index=1;
        sprite_index = sWalk;
	}
    else 
    {
        if vspeed < 0 
        {
            if jump_count == 1
			{
                sprite_index = sJump;
			}
            else 
            {
                image_speed = 1;
                sprite_index = sJump;		
            }
        }
        else
		{
            sprite_index = sFall;
		}
    }
}