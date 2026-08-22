// -- MW Changes Start
exit;
// -- MW Changes End
if (ds_zero("Power Bombs Max") == 0)
{
    _fanfare = bgmFanfareItem;
    upgrade_name = "Power Bomb Detonator";
    description = item_descriptions("Power Bomb Detonator");
}
