// MW Change: Make this only target flaagrah instead of golden ghost
if (instance_exists(obj_boss_flaagrah))
{
    y = lerp(y, -336, 0.023809523809523808);
}
else
{
    y = lerp(y, ystart, 0.023809523809523808);
    move_snap(1, 1);
}
