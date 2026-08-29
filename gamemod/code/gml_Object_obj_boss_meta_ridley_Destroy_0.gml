event_inherited();
global.boss = 0;
instance_create(x, y, obj_meta_ridley_death);
// -- MW Changes Start
if (dz("MWEndAtRidley"))
{
    global.mwcompleted = 1;
}
// -- MW Changes End
