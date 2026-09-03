/*
if (dz("Artifact 6"))
{
    exit;
}
*/
event_inherited();
instance_create(x, y - 64, obj_artifact_5);
if (_age > 69)
{
    instance_create(x, y - 64, obj_mystery_camera);
}
instance_destroy(obj_camera_solid);
instance_destroy(obj_camera_lock_no_solid);
