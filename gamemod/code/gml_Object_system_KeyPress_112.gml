// Check connection to mw
if (instance_exists(obj_MWConnector))
{
    bitsound(sndMessageConfirm);
    if (obj_MWConnector.connectedToClient)
    {
        show_item_pickup_text("Status: Connected");
    }
    else
    {
        show_item_pickup_text("Status: Not Connected");
    }
    
}