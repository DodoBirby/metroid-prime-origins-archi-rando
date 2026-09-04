function mw_handle_aeon_powers(major)
{
    var aeonArray = dz("Aeon");
    var aeonStatus = dz("Aeon Status");
    var isAeon = false;
    var aeon0 = "Nothing";
    var aeon1 = "Nothing";
    var aeon2 = "Nothing";
    var aeon3 = "Nothing";
    switch major
    {
        case "Artifact 1":
            isAeon = true;
            aeon0 = "Auto-Logger";
            aeon1 = "Debris Scope";
            aeon2 = "Velocity Beam";
            aeon3 = "Aqua-Recovery";
            break;
        case "Artifact 2":
            isAeon = true;
            aeon0 = "Offensive Boost";
            aeon1 = "Seeker Beam";
            aeon2 = "Seeker Missile";
            aeon3 = "Maximum Power";
            break;
        case "Artifact 3":
            isAeon = true;
            aeon0 = "Chain Missile";
            aeon1 = "Boost-Sprint";
            aeon2 = "Swift Boots";
            aeon3 = "Speed-Ball";
            break;
        case "Artifact 4":
            isAeon = true;
            aeon0 = "Blazing Spider";
            aeon1 = "Proximity Beam";
            aeon2 = "Quick Bombs";
            aeon3 = "Flare Ball";
            break;
        case "Artifact 5":
            isAeon = true;
            aeon0 = "Reinforced Suit";
            aeon1 = "Energy Generator";
            aeon2 = "Missile Generator";
            aeon3 = "Power Bomb Generator";
            break;
        case "Artifact 6":
            isAeon = true;
            aeon0 = "Gatling Beam";
            aeon1 = "Blaze Missile";
            aeon2 = "Frost Missile";
            aeon3 = "Shock Missile";
            break;
        case "Artifact 7":
            isAeon = true;
            aeon0 = "Static Power Bomb";
            aeon1 = "Flare Power Bomb";
            aeon2 = "Frost Power Bomb";
            aeon3 = "Hefty Beam";
            break;
        case "Artifact 8":
            isAeon = true;
            aeon0 = "Bountiful Pickups";
            aeon1 = "Static Bomb";
            aeon2 = "Flare Bomb";
            aeon3 = "Frost Bomb";
            break;
        case "Artifact 9":
            isAeon = true;
            aeon0 = "Chip Bomb";
            aeon1 = "Charge Module";
            aeon2 = "Mine Bomb";
            aeon3 = "Side-Dash";
            break;
        case "Artifact 10":
            isAeon = true;
            aeon0 = "Damage Discharge";
            aeon1 = "Boost Extender";
            aeon2 = "Boost Charger";
            aeon3 = "Pickup-Poison";
            break;
        case "Artifact 11":
            isAeon = true;
            aeon0 = "Cleeted Boots";
            aeon1 = "Screw Inferno";
            aeon2 = "Screw Shock";
            aeon3 = "Screw Blizzard";
            break;
        case "Artifact 12":
            isAeon = true;
            aeon0 = "Death Ball";
            aeon1 = "Phazon Shield";
            aeon2 = "Phazon Generator";
            aeon3 = "Ricochet Cannon";
            break;
    }
    if (is_array(aeonStatus))
    {
        if (isAeon)
        {
            if (aeon0 != "Nothing")
            {
                array_push(aeonStatus, 0);
                array_push(aeonArray, aeon0);
            }
            if (aeon1 != "Nothing")
            {
                array_push(aeonStatus, 0);
                array_push(aeonArray, aeon1);
            }
            if (aeon2 != "Nothing")
            {
                array_push(aeonStatus, 0);
                array_push(aeonArray, aeon2);
            }
            if (aeon3 != "Nothing")
            {
                array_push(aeonStatus, 0);
                array_push(aeonArray, aeon3);
            }
            ds_write("Aeon", aeonArray);
            ds_write("Aeon Status", aeonStatus);
        }
    }
}
