if (!instance_exists(par_player))
{
    instance_destroy(id, false);
    exit;
}
if (instance_exists(obj_chozo_cipher))
{
    if ((y + 32) > obj_chozo_cipher.y)
    {
        y += 1;
    }
}
// -- MW Change: check for custom endgame condition
if (abs(x - par_player.x) < 64 && !flower_active && endgame_is_available() && !instance_exists(obj_artifact_0))
{
    flower_active = 1;
    global.boss = 1;
}
music_volume(1);
/*
if (abs(x - par_player.x) < 210 && dz("Artifact 1") && dz("Artifact 2") && dz("Artifact 3") && dz("Artifact 4") && dz("Artifact 5") && dz("Artifact 6") && dz("Artifact 7") && dz("Artifact 8") && dz("Artifact 10") && dz("Artifact 11") && dz("Artifact 12") && !instance_exists(obj_artifact_0) && dz("Classic Mode"))
{
    flower_active = 1;
    ds_write("Cipher Boss Trigger");
    global.boss = 1;
}
*/
if (flower_active)
{
    global.boss = 1;
    if ((!instance_exists(obj_boss_meta_ridley) && player_distance() > 256) || instance_exists(obj_meta_ridley_death))
    {
        global.cutscene = 1;
    }
    else
    {
        global.cutscene = 0;
    }
    if (visible)
    {
        alarm[0] = 21;
        global.screen_shake_x = -2 + irandom(4);
        defy_physics();
        yspeed += 0.058823529411764705;
        yspeed = clamp(yspeed, 0, 8);
    }
    bitBGM(bgmBattleMetaRidley);
}
face_player();
if (place_meeting(x, y + 1, par_solid) && y > (room_height / 2))
{
    yspeed = 0;
    quick_sprite(spr_meta_ridley_5);
}
else
{
    quick_sprite(spr_meta_ridley_1);
}
