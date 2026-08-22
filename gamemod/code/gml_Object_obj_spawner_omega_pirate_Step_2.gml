if (!instance_exists(par_player))
{
    instance_destroy(id, false);
    exit;
}
if (abs(x - par_player.x) < 131 && !flower_active)
{
    image_speed = 1;
    with (obj_tube_omega_pirate)
    {
        shaking = 1;
    }
    flower_active = 1;
    global.boss = 1;
    alarm[1] = 240;
    alarm[0] = 210;
    // -- MW Changes Start
    // Force player into arena if they are approaching from the top
    if (par_player.y < 288)
    {
        par_player.x = x - 131;
        par_player.y = 320;
    }
    // -- MW Changes End
}
if (flower_active)
{
    bitBGM(bgmBattleOmegaPirate);
}
