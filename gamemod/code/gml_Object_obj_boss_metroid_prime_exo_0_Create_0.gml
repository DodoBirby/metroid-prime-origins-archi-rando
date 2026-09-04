event_inherited();
alarm[0] = 180;
if (room != imp_Phazon_Infusion_Chamber)
{
    alarm[1] = 5;
}
draw_samus_in = 0;
physics_init();
yspeed_accel = 0.14285714285714285;
enemy_id = 80;
repeat (256)
{
    if (place_meeting(x, y, par_solid))
    {
        y -= 1;
    }
    else
    {
        break;
    }
}
goal_xspeed = 0;
ai_init();
ROAR = 0;
IDLE = 1;
SQUAT = 2;
JUMP = 3;
SHOCKWAVE = 4;
CRABWALK = 5;
LAZER = 6;
ORB = 7;
MISSILE = 8;
PULL = 9;
phase_0_array = [ROAR, IDLE, SQUAT, JUMP, SHOCKWAVE, IDLE, ORB, CRABWALK, ORB, ORB, IDLE, SQUAT, JUMP, SHOCKWAVE, IDLE, ORB, ORB, CRABWALK];
phase_1_array = [ROAR, MISSILE, ORB, IDLE, SQUAT, JUMP, SHOCKWAVE, IDLE, MISSILE, ORB, CRABWALK, ORB, IDLE, SQUAT, JUMP, SHOCKWAVE, IDLE, ORB, MISSILE, ORB, ORB, CRABWALK, MISSILE];
phase_2_array = [ROAR, LAZER, IDLE, ORB, MISSILE, SQUAT, JUMP, SHOCKWAVE, ORB, IDLE, MISSILE, ORB, CRABWALK, LAZER, ORB, ORB, IDLE, SQUAT, JUMP, SHOCKWAVE, IDLE, ORB, LAZER, MISSILE, ORB, LAZER, ORB, LAZER, CRABWALK, MISSILE];
phase_3_array = [ROAR, PULL, IDLE, LAZER, ORB, MISSILE, SQUAT, JUMP, SHOCKWAVE, ORB, IDLE, ORB, PULL, MISSILE, ORB, CRABWALK, LAZER, ORB, IDLE, SQUAT, JUMP, SHOCKWAVE, IDLE, ORB, PULL, LAZER, MISSILE, ORB, LAZER, ORB, LAZER, CRABWALK, PULL, ORB, MISSILE];
// -- MW Changes Start
var lockedExoBeams = dz("MWLockedExoBeams");
beam = lockedExoBeams[beam];
// -- MW Changes End
if (beam == 0)
{
    resistances = ["Electric", "Ice", "Fire", "Concussive", "Screw Attack"];
}
if (beam == 1)
{
    resistances = ["Normal", "Ice", "Fire", "Concussive", "Screw Attack"];
}
if (beam == 2)
{
    resistances = ["Electric", "Normal", "Fire", "Concussive", "Screw Attack"];
}
if (beam == 3)
{
    resistances = ["Electric", "Ice", "Normal", "Concussive", "Screw Attack"];
}
factor = 1;
if (room == imp_Subchamber_One)
{
    factor = 1.21;
}
if (room == imp_Subchamber_Two)
{
    factor = 1.69;
}
if (room == imp_Subchamber_Three)
{
    factor = 2.1;
}
hp = round(hp * factor);
if (beam == 1)
{
    hp = round(hp / 4);
}
if ((beam == 0 && dz("Charge Beam") == 0 && dz("Spazer") == 0) || (beam == 2 && dz("Charge Beam") == 0 && dz("Ice Spreader") == 0))
{
    hp /= 6;
}
if (beam == 0)
{
    hp /= 2;
}
hp_max = hp;
hp_phase_0 = (hp_max * 4) / 4;
hp_phase_1 = (hp_max * 3) / 4;
hp_phase_2 = (hp_max * 2) / 4;
hp_phase_3 = (hp_max * 1) / 4;
if (beam == 1)
{
    can_status = 0;
}
