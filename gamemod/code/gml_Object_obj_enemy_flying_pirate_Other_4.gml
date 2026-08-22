if (!ds_zero("Super Missile") && !ds_zero("Spazer phe_Research_Core x160 y552") && room != phe_Control_Tower)
{
    instance_destroy();
}
if (room == phe_Control_Tower)
{
    ds_add("Required Flying Pirates", 1);
}
if (room == phe_Control_Tower && !ds_zero("Spazer phe_Research_Core x160 y552"))
{
    instance_destroy();
}
