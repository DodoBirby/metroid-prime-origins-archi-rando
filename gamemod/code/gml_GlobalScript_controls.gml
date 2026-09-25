function controls()
{
    static _dash_left_t = -99999;
    static _dash_right_t = -99999;
    
    // -- MW Changes Start: Prevent input while ap menu is open
    if (instance_exists(obj_MWConnector) && obj_MWConnector.nativeConsoleOpen)
    {
        global.key_up = 0;
        global.key_down = 0;
        global.key_left = 0;
        global.key_right = 0;
        global.key_up_tap = 0;
        global.key_down_tap = 0;
        global.key_left_tap = 0;
        global.key_right_tap = 0;
        global.key_left_long = 0;
        global.key_left_repeat = 0;
        global.key_up_repeat = 0;
        global.key_down_repeat = 0;
        global.key_right_long = 0;
        global.key_right_repeat = 0;
        global.key_accept = 0;
        global.key_accept_hold = 0;
        global.key_cancel = 0;
        global.key_option_l = 0;
        global.key_option_r = 0;
        global.key_option_x = 0;
        global.key_option_y = 0;
        global.key_option_l_hold = 0;
        global.key_option_r_hold = 0;
        global.key_jump = 0;
        global.key_jump_hold = 0;
        global.key_shoot = 0;
        global.key_shoot_hold = 0;
        global.key_missile = 0;
        global.key_ball = 0;
        global.key_aim_lock = 0;
        global.key_aim_lock_pressed = 0;
        global.key_free_aim = 0;
        global.key_free_aim_pressed = 0;
        global.key_free_aim_released = 0;
        global.key_scan = 0;
        global.key_scan_pressed = 0;
        global.key_map = 0;
        global.key_menu = 0;
        global.key_beam = 0;
        global.key_beam_hold = 0;
        global.key_beam_0 = 0;
        global.key_beam_1 = 0;
        global.key_beam_2 = 0;
        global.key_beam_3 = 0;
        global.key_dash_left = 0;
        global.key_dash_right = 0;
        global.key_grapple = 0;
        global.key_grapple_pressed = 0;
        exit;
    }
    // -- MW Changes End
    
    d = !instance_exists(obj_samus);
    global.key_up = min(1, InputCheck(UnknownEnum.Value_0) + (InputCheck(UnknownEnum.Value_4) * d));
    global.key_down = min(1, InputCheck(UnknownEnum.Value_1) + (InputCheck(UnknownEnum.Value_5) * d));
    global.key_left = min(1, InputCheck(UnknownEnum.Value_2) + (InputCheck(UnknownEnum.Value_6) * d));
    global.key_right = min(1, InputCheck(UnknownEnum.Value_3) + (InputCheck(UnknownEnum.Value_7) * d));
    global.key_up_tap = min(1, InputPressed(UnknownEnum.Value_0) + (InputPressed(UnknownEnum.Value_4) * d));
    global.key_down_tap = min(1, InputPressed(UnknownEnum.Value_1) + (InputPressed(UnknownEnum.Value_5) * d));
    global.key_left_tap = min(1, InputPressed(UnknownEnum.Value_2) + (InputPressed(UnknownEnum.Value_6) * d));
    global.key_right_tap = min(1, InputPressed(UnknownEnum.Value_3) + (InputPressed(UnknownEnum.Value_7) * d));
    global.key_left_long = min(1, InputLongPressed(UnknownEnum.Value_2) + (InputLongPressed(UnknownEnum.Value_6) * d));
    global.key_left_repeat = min(1, InputRepeat(UnknownEnum.Value_2) + (InputRepeat(UnknownEnum.Value_6) * d));
    global.key_up_repeat = min(1, InputRepeat(UnknownEnum.Value_0) + (InputRepeat(UnknownEnum.Value_4) * d));
    global.key_down_repeat = min(1, InputRepeat(UnknownEnum.Value_1) + (InputRepeat(UnknownEnum.Value_5) * d));
    global.key_right_long = min(1, InputLongPressed(UnknownEnum.Value_3) + (InputLongPressed(UnknownEnum.Value_7) * d));
    global.key_right_repeat = min(1, InputRepeat(UnknownEnum.Value_3) + (InputRepeat(UnknownEnum.Value_7) * d));
    global.key_accept = InputPressed(UnknownEnum.Value_8);
    global.key_accept_hold = InputCheck(UnknownEnum.Value_8);
    global.key_cancel = InputPressed(UnknownEnum.Value_9);
    global.key_option_l = InputPressed(UnknownEnum.Value_10);
    global.key_option_r = InputPressed(UnknownEnum.Value_11);
    global.key_option_x = InputPressed(UnknownEnum.Value_12);
    global.key_option_y = InputPressed(UnknownEnum.Value_13);
    global.key_option_l_hold = InputCheck(UnknownEnum.Value_10);
    global.key_option_r_hold = InputCheck(UnknownEnum.Value_11);
    global.key_jump = InputPressed(UnknownEnum.Value_14);
    global.key_jump_hold = InputCheck(UnknownEnum.Value_14);
    global.key_shoot = InputPressed(UnknownEnum.Value_15);
    global.key_shoot_hold = InputCheck(UnknownEnum.Value_15);
    global.key_missile = InputPressed(UnknownEnum.Value_16);
    if (instance_exists(obj_samus))
    {
        global.key_ball = InputPressed(UnknownEnum.Value_17) + obj_samus.tap_ball;
    }
    else
    {
        global.key_ball = InputPressed(UnknownEnum.Value_17);
    }
    global.key_aim_lock = InputCheck(UnknownEnum.Value_18);
    global.key_aim_lock_pressed = InputPressed(UnknownEnum.Value_18);
    global.key_free_aim = InputCheck(UnknownEnum.Value_19);
    global.key_free_aim_pressed = InputPressed(UnknownEnum.Value_19);
    global.key_free_aim_released = InputReleased(UnknownEnum.Value_19);
    global.key_scan = InputCheck(UnknownEnum.Value_26);
    global.key_scan_pressed = InputPressed(UnknownEnum.Value_26);
    global.key_map = InputPressed(UnknownEnum.Value_28);
    global.key_menu = InputPressed(UnknownEnum.Value_27);
    global.key_beam = InputPressed(UnknownEnum.Value_24);
    global.key_beam_hold = InputCheck(UnknownEnum.Value_24);
    global.key_beam_0 = InputCheck(UnknownEnum.Value_20);
    global.key_beam_1 = InputCheck(UnknownEnum.Value_21);
    global.key_beam_2 = InputCheck(UnknownEnum.Value_22);
    global.key_beam_3 = InputCheck(UnknownEnum.Value_23);
    var _now = current_time;
    if (InputPressed(UnknownEnum.Value_2))
    {
        global.key_dash_left = ((_now - _dash_left_t) < 250) * InputPressed(UnknownEnum.Value_14);
        _dash_left_t = _now;
    }
    else
    {
        global.key_dash_left = 0;
    }
    if (InputPressed(UnknownEnum.Value_3))
    {
        global.key_dash_right = ((_now - _dash_right_t) < 250) * InputPressed(UnknownEnum.Value_14);
        _dash_right_t = _now;
    }
    else
    {
        global.key_dash_right = 0;
    }
    if (InputBufferPressed(UnknownEnum.Value_2, 12) && InputPressed(UnknownEnum.Value_14))
    {
        global.key_dash_left = 1;
    }
    if (InputBufferPressed(UnknownEnum.Value_3, 12) && InputPressed(UnknownEnum.Value_14))
    {
        global.key_dash_right = 1;
    }
    global.key_grapple = InputCheck(UnknownEnum.Value_25);
    global.key_grapple_pressed = InputPressed(UnknownEnum.Value_25);
    if (global.cutscene)
    {
        global.key_free_aim = 0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28
}
