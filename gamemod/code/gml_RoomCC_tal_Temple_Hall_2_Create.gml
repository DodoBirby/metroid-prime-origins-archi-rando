// -- MW Change: check for custom endgame condition
if (!(!dz("Ridley Defeated") && endgame_is_available()))
{
    instance_destroy();
}
/*
if (dz("Classic Mode") && !(dz("Artifact 1") && dz("Artifact 2") && dz("Artifact 3") && dz("Artifact 4") && dz("Artifact 5") && dz("Artifact 6") && dz("Artifact 7") && dz("Artifact 8") && dz("Artifact 10") && dz("Artifact 11") && dz("Artifact 12")))
{
    instance_destroy();
}
*/
