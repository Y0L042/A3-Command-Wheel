// Execute the selected command
// _this = selected section index (0-7)
private _selected = _this;

// Map section index to command function
private _commands = [
    CMDWHEEL_fnc_move,      // 0 - Top
    CMDWHEEL_fnc_flank,     // 1 - Top Right
    CMDWHEEL_fnc_follow,    // 2 - Right
    CMDWHEEL_fnc_hold,      // 3 - Bottom Right
    CMDWHEEL_fnc_stop,      // 4 - Bottom
    CMDWHEEL_fnc_regroup,   // 5 - Bottom Left
    CMDWHEEL_fnc_cover,     // 6 - Left
    CMDWHEEL_fnc_advance    // 7 - Top Left
];

// Execute the selected command
call (_commands select _selected);
