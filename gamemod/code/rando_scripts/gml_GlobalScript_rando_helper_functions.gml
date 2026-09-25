function show_item_pickup_text(text)
{
    with (instance_create_layer(0, 0, "Instances", obj_message_in_game))
    {
        message_0 = text;
    }
}

function mw_small_text_height(text, width)
{
    return scribble(text).scale(0.75).wrap(width).get_height();
}

function mw_draw_small_text(x, y, text, width)
{
    var element = scribble(text).scale(0.75).align(draw_get_halign(), draw_get_valign()).blend(0, draw_get_alpha()).wrap(width);
    element.draw(x + 1, y + 1);
    element = scribble(text).scale(0.75).align(draw_get_halign(), draw_get_valign()).blend(draw_get_color(), draw_get_alpha()).wrap(width);
    element.draw(x, y);
}

function grant_item(item)
{
    switch item
    {
        case "Power Bomb":
            ds_write("Power Bomb Detonator", 1);
            ds_add("Power Bombs", 2);
            ds_add("Power Bombs Max", 2);
            return true;
        case "Energy Tank":
            ds_add("Energy Tanks Max", 1);
            ds_write("Energy", 99);
            ds_write("Energy Tanks", dz("Energy Tanks Max"));
            ds_write("Energy Tank", 1);
            return true;
        case "Missile Tank":
            ds_write("Missile Launcher", 1);
            ds_add("Missiles", 5);
            ds_add("Missiles Max", 5);
            return true;
        case "Progressive Grapple Beam":
            ds_add("ProgGrapples", 1);
            if (dz("ProgGrapples") == 1)
            {
                grant_item("Space Jump Boots");
            }
            else if (dz("ProgGrapples") == 2)
            {
                grant_item("Grapple Beam");
            }
            return true;
        default:
            var ds_name = convert_mw_name_to_ds_name(item);
            var is_artifact = string_pos("Artifact", ds_name) != 0;

            if (dz("MWLocal") && is_artifact)
            {
                // TODO: cleaner way to make remote items not duplicate the artifact count rather than checking mwlocal?
                ds_add("ArtifactCountCollected", 1);
            }
            if (dz(ds_name) == 0)
            {
                ds_write(ds_name, 1);
                if (is_artifact && dz("MWAeonPowers"))
                {
                    mw_handle_aeon_powers(ds_name);
                }
                return true;
            }
            return false;
    }
}

function load_seed_file(path)
{
    var file = file_text_open_read(path);
    var base64 = file_text_readln(file);
    var json = base64_decode(base64);
    var payload = json_decode(json);
    var result = false;
    if (payload != -1)
    {
        ds_map_copy(global.mwLocations, ds_map_find_value(payload, "items"));
        ds_list_copy(global.localStarterItems, ds_map_find_value(payload, "starter_items"));
        ds_list_copy(global.mwExoBeams, ds_map_find_value(payload, "exo_order"));
        global.mwPhazonHint = ds_map_find_value(payload, "phazon_hint");
        global.mwEndAtRidley = ds_map_find_value(payload, "end_at_ridley");
        ds_map_copy(global.mwArtifactHints, ds_map_find_value(payload, "artifact_hints"));
        global.mwArtifactsRequired = ds_map_find_value(payload, "artifacts_required");
        global.mwAeonPowers = ds_map_find_value(payload, "aeon_powers");
        ds_map_destroy(payload);
        global.localSeed = true;
        result = true;
    }
    file_text_close(file);
    return result;
}

function endgame_is_available()
{
    if (dz("MWArtifactsRequired") == 0)
    {
        return dz("Flaahgra Defeated") && dz("Thardus Defeated") && dz("Omega Pirate Defeated");
    }
    return dz("ArtifactCountCollected") >= dz("MWArtifactsRequired");
}
