if (layer_exists("Instances"))
{
    layer_depth("Instances", 0);
}
if (layer_exists("Game_Grid"))
{
    layer_destroy("Game_Grid");
}
view_data();
if (debug_mode && global.key_cancel)
{
    audio_stop_sound(bgmFanfareSamus);
}
global.block = [par_solid, layer_get_id("Collision")];
if (room == init)
{
    room_goto(rm_Title);
}
if (!instance_exists(obj_earthquake))
{
    global.screen_shake_x = 0;
}
if (InputPlayerUsingKbm(0))
{
    global.mouse_on = 1;
}
if (InputPlayerUsingGamepad(0))
{
    global.mouse_on = 0;
}
if (!ds_zero_options("Mouse Aiming"))
{
    global.mouse_on = 0;
}
if (audio_is_paused(bgmFanfareArtifact))
{
    audio_resume_sound(bgmFanfareArtifact);
}
if (audio_is_paused(bgmFanfareEnd))
{
    audio_resume_sound(bgmFanfareEnd);
}
if (audio_is_paused(bgmFanfareIntro))
{
    audio_resume_sound(bgmFanfareIntro);
}
if (audio_is_paused(bgmFanfareItem))
{
    audio_resume_sound(bgmFanfareItem);
}
if (audio_is_paused(bgmFanfareMinorItem))
{
    audio_resume_sound(bgmFanfareMinorItem);
}
if (audio_is_paused(bgmFanfarePuzzle))
{
    audio_resume_sound(bgmFanfarePuzzle);
}
if (audio_is_paused(bgmFanfareSamus))
{
    audio_resume_sound(bgmFanfareSamus);
}
// -- MW Changes Start: Add option to lock mouse inside window.
var confineMouse = ds_zero_options("Mouse Capture")
    && global.mouse_on
    && instance_exists(obj_samus)
    && !instance_exists(menu_choice)
    && InputGameHasFocus();
if (global.ext_mpo_mouse_confine != -1)
{
    external_call(global.ext_mpo_mouse_confine, confineMouse);
}
// -- MW Changes End
