dark_labs = 0;
with (obj_music_alternate)
{
    if (alt_music == bgmGlacierOne && ds_zero("Spazer phe_Research_Core x160 y552") != 0)
    {
        other.dark_labs = 1;
    }
}
if (dark_labs && !instance_exists(obj_darkness_all))
{
    instance_create(0, 0, obj_darkness_all);
}
