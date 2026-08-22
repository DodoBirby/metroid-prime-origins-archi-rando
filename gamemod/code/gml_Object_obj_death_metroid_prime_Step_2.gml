instance_destroy(obj_grapple_mask);
with (obj_samus)
{
    grappling = 0;
}
bitBGM(bgmBattleMetroidPrime1);
if (!instance_exists(obj_death_metroid_prime_succ))
{
    exit;
}
if (!irandom(188))
{
    bitsound(sndPrimeExoDamage, 0.75);
}
x = lerp(x, room_width / 2, 0.09090909090909091);
y = lerp(y, room_height / 2, 0.09090909090909091);
if (player_distance() < 10)
{
    if (!audio_is_playing(snd_die))
    {
        bitsound(snd_die, 0.9);
    }
    par_player.hurt = 1;
    par_player.hurt_timer = irandom(12);
    par_player.x = x;
    par_player.y = y + 4;
    if (!irandom(5))
    {
        instance_create((x - 16) + irandom(32), y - irandom(32), obj_effect_enemy_boom);
    }
    // -- MW Changes Start
    // ds_write("Phazon Suit", 0);
    ds_write("Phazon Suit", -1);
    // -- MW Changes End
}
