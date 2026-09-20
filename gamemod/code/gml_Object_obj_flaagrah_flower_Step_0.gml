if (instance_exists(obj_boss_flaagrah))
{
    visible = 0;
}
else
{
    visible = 1;
}
if (instance_exists(obj_boss_flaagrah))
{
    mask_index = spr_nothing;
    depth = obj_boss_flaagrah.depth + 15;
    image_xscale = 1;
    image_yscale = image_xscale;
}
else
{
    depth = 256;
    // -- MW Change: Fix big flower only spawning with spider ball and not ice beam
    if (dz("Spider Ball") || dz("Ice Beam"))
    {
        sprite_index = spr_flaagrah_flower_1;
        mask_index = mask_flaagrah_flower_1;
    }
}
repeat (256)
{
    if (place_meeting(x, y, obj_samus))
    {
        obj_samus.y -= 1;
    }
    else
    {
        break;
    }
}
