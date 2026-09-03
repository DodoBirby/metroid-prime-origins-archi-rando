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
    // -- MW Changes: Moved big flower code to create
}
