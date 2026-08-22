if (!instance_exists(my_enemy) || my_enemy == 0)
{
    exit;
}
spawn(obj_pointstopper);
my_enemy.x = x;
my_enemy.y = y + 8 + off_y;
my_enemy.i_frames = 0;
if (variable_instance_exists(my_enemy, "hp_max"))
{
    my_enemy.hp = my_enemy.hp_max;
}
my_enemy.mask_index = spr_nothing;
counter += 1;
off_y = dcos(counter / 9) * 4;
if (my_enemy.true_i_frames < 120)
{
    my_enemy.true_i_frames = 180;
}
if (my_enemy.object_index == obj_enemy_metroid && (ds_zero("Ice Beam") || ds_zero("Spazer phe_Research_Core x160 y552")) && player_distance() < 72)
{
    repeat (12)
    {
        _x = (x - 13) + irandom(26);
        _y = (y - 13) + irandom(29);
        instance_create(_x, _y, obj_effect_glass);
    }
    bitsound(sndGlass, 0.77);
    instance_destroy();
}
if (object_index == obj_pirate_tube_0)
{
    with (obj_enemy_aqua_reaper)
    {
        if (distance_to_point(other.id.x, other.id.y) > 64 || !in_view())
        {
            break;
        }
        image_index = 0;
        image_yscale = 0.69;
        y = ystart;
        if (in_view())
        {
            other.explody_counter += 1;
        }
    }
}
if (in_view() && explody_counter > 300)
{
    earthquake(10);
    repeat (12)
    {
        _x = (x - 13) + irandom(26);
        _y = (y - 13) + irandom(29);
        instance_create(_x, _y, obj_effect_glass);
    }
    instance_destroy();
}
