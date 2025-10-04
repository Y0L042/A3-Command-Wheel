// Execute the selected command
// _this = selected section index (0-7)
private _selected = _this;

// Map section index to command function
private _commands = [
    CMDWHEEL_fnc_00,    // 0 - Top          NNE
    CMDWHEEL_fnc_01,    // 1 - Top Right    NEE
    CMDWHEEL_fnc_02,    // 2 - Right        SEE
    CMDWHEEL_fnc_03,    // 3 - Bottom Right SSE
    CMDWHEEL_fnc_04,    // 4 - Bottom       SSW
    CMDWHEEL_fnc_05,    // 5 - Bottom Left  SWW
    CMDWHEEL_fnc_06,    // 6 - Left         NWW
    CMDWHEEL_fnc_07     // 7 - Top Left     NNW
];

// Execute the selected command
call (_commands select _selected);
