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
    depth = obj_boss_flaagrah.depth + 15;
    image_xscale = 1;
    image_yscale = image_xscale;
}
else
{
    depth = 256;
    // -- MW Changes: Added flaahgra defeated check and ice beam
    if ((dz("Spider Ball") || dz("Ice Beam")) && dz("Flaahgra Defeated"))
    {
        sprite_index = spr_flaagrah_flower_1;
        mask_index = mask_flaagrah_flower_1;
    }
}
