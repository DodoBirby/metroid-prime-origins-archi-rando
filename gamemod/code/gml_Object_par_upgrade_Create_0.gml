function visibility()
{
    visible = true;
    depth = 0;
    // -- MW Changes Start: Changed the place_meeting calls to position_meeting so that big items like artifacts don't go invisible in tunnels
    if (position_meeting(x, y, par_solid) && !position_meeting(x, y, obj_pirate_tube_0) && !position_meeting(x, y, obj_pirate_tube_1) && object_index != obj_upgrade_spazer)
    {
        visible = false;
    }
    // -- MW Changes End
}

visibility();
if (!dz("New Game+"))
{
    key = ds_name + " " + string(room_get_name(room)) + " x" + string(x) + " y" + string(y);
}
else
{
    key = string(dz("New Game+")) + "__" + ds_name + " " + string(room_get_name(room)) + " x" + string(x) + " y" + string(y);
}
if (ds_zero(key))
{
    instance_destroy(self, false);
}
draw_counter = 0;
draw_y = 0;
sfx_counter = 0;
if (dz("Boss Rush"))
{
    instance_destroy(id, false);
}

// -- MW Changes Start
mw_set_sprite_to_custom_item();
// -- MW Changes End
