/////////////////////
//     Gravity     //
/////////////////////
if (vsp < 10) vsp += grav; // if vsp is less than 10 set gravity

/////////////////////
//     Inputs      //
/////////////////////
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);

/////////////////////
//    Movement     //
/////////////////////

// This needst to changes 
move = key_left + key_right;
hsp = move * movespeed;


/////////////////////
//    Collision    //
/////////////////////

// Check for ground
if (place_meeting(x,y+1,oCollision))
{	
	if (move!=0) sprite_index=sWalk; else sprite_index=sIdle; // Run else Idle
    if (key_jump) // Only jump when on ground 
    {
        vsp = key_jump * -jumpspeed;
		audio_play_sound(Jump01,0,0); // Play jumping sound
    }
}
else
{
	if (vsp < 0) sprite_index=sJump; else sprite_index=sFall;
}

//Horizontal Collision
if (place_meeting(x+hsp,y,oCollision))
{
    while(!place_meeting(x+sign(hsp),y,oCollision))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp; // Set x

//Vertical Collision
if (place_meeting(x,y+vsp,oCollision))
{
    while(!place_meeting(x,y+sign(vsp),oCollision))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp; // Set y