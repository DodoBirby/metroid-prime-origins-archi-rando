// -- MW Changes Start
exit;
// -- MW Changes End
if (ds_zero("Missiles Max") == 0)
{
    _fanfare = bgmFanfareItem;
    upgrade_name = "Missile Launcher";
    description = item_descriptions("Missile Launcher");
}
