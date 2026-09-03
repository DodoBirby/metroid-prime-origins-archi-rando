if ((!(par_player.y < y && abs(par_player.x - x) < 16) && counter == 0) || !instance_exists(obj_samus))
{
    exit;
}
global.cutscene = 1;
obj_samus.pose = 420;
obj_samus.x = lerp(obj_samus.x, x, 1/3);
obj_samus.y = lerp(obj_samus.y, y - 12, 0.07692307692307693);
if (!instance_exists(obj_ending_helmetless))
{
    counter += 1;
}
if (counter == 5)
{
    instance_create(x, y + 42, obj_ending_camera_lock);
}
if (counter == 60)
{
    global.look_around = 1;
}
if (counter == 660)
{
    global.look_around = 0;
}
if (counter == 596 && !spawned_special_ending && (dz("Collection") >= 75 || (dz("Logbook") / global.total_scans) >= 0.75))
{
    spawn(obj_effect_screen_flash);
}
if (counter == 600 && !spawned_special_ending && (dz("Collection") >= 75 || (dz("Logbook") / global.total_scans) >= 0.75))
{
    spawn(obj_ending_helmetless);
    spawned_special_ending = 1;
    exit;
}
var fly_off = 840;
if (counter < fly_off || instance_exists(obj_ending_helmetless))
{
    exit;
}
quick_sprite(spr_ship_fly);
obj_samus.x = x;
obj_samus.y = lerp(obj_samus.y, y + 42, 0.09090909090909091);
defy_physics();
if (counter == (fly_off + 120 + 27))
{
    ds_write("Phazon Suit", 1);
    ds_write("Clear Game", 1);
    save_and_tell();
    // -- MW Changes Start
    global.mwcompleted = 1;
    // -- MW Changes End
}
if (counter == (fly_off + 120))
{
    yspeed = 1.7;
}
if (counter > (fly_off + 120))
{
    yspeed -= 0.047619047619047616;
    obj_samus.y = y + 32;
    instance_create(global.xview + irandom(global.wview), (room_height - 48) + ir(48), obj_effect_enemy_boom);
}
yspeed = clamp(yspeed, -8, 3);
if (y < -1024)
{
    make_spr_screen();
    bye_bye += 1;
}
if (bye_bye > 0)
{
    bye_bye += 1;
}
if (bye_bye > 420)
{
    audio_stop_all();
    global.now_playing = -4;
    global.up_next = -4;
    room_goto(rm_Ending_0);
}
__vol *= 0.942;
music_volume(__vol);
