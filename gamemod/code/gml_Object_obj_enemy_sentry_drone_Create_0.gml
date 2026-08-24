event_inherited();
physics_init();
yspeed_accel = 0;
ai_init();
WANDER = 0;
CHARGE = 1;
STING = 2;
SHOOT = 2;
personality = 30 + irandom(20);
if (!ds_zero("Spazer phe_Research_Core x160 y552") && !ds_zero("Ice Beam") && object_index == obj_enemy_sentry_drone)
{
    instance_destroy(id, false);
}
