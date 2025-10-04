// Register settings for each command wheel action
private _category = "Command Wheel";

// Section 0 - MOVE
[
    "CMDWHEEL_action0_enabled",
    "CHECKBOX",
    ["Use Custom Action (MOVE)", "Enable custom script for MOVE action"],
    [_category, "Section 0 - MOVE"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 0 - MOVE"],
    "MOVE",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file (e.g., 'scripts\myAction.sqf') or leave empty for default"],
    [_category, "Section 0 - MOVE"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - FLANK
[
    "CMDWHEEL_action1_enabled",
    "CHECKBOX",
    ["Use Custom Action (FLANK)", "Enable custom script for FLANK action"],
    [_category, "Section 1 - FLANK"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 1 - FLANK"],
    "FLANK",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 1 - FLANK"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - FOLLOW
[
    "CMDWHEEL_action2_enabled",
    "CHECKBOX",
    ["Use Custom Action (FOLLOW)", "Enable custom script for FOLLOW action"],
    [_category, "Section 2 - FOLLOW"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 2 - FOLLOW"],
    "FOLLOW",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 2 - FOLLOW"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - HOLD
[
    "CMDWHEEL_action3_enabled",
    "CHECKBOX",
    ["Use Custom Action (HOLD)", "Enable custom script for HOLD action"],
    [_category, "Section 3 - HOLD"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 3 - HOLD"],
    "HOLD",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 3 - HOLD"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 4 - STOP
[
    "CMDWHEEL_action4_enabled",
    "CHECKBOX",
    ["Use Custom Action (STOP)", "Enable custom script for STOP action"],
    [_category, "Section 4 - STOP"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 4 - STOP"],
    "STOP",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 4 - STOP"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 5 - REGROUP
[
    "CMDWHEEL_action5_enabled",
    "CHECKBOX",
    ["Use Custom Action (REGROUP)", "Enable custom script for REGROUP action"],
    [_category, "Section 5 - REGROUP"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 5 - REGROUP"],
    "REGROUP",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 5 - REGROUP"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 6 - COVER
[
    "CMDWHEEL_action6_enabled",
    "CHECKBOX",
    ["Use Custom Action (COVER)", "Enable custom script for COVER action"],
    [_category, "Section 6 - COVER"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 6 - COVER"],
    "COVER",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 6 - COVER"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 7 - ADVANCE
[
    "CMDWHEEL_action7_enabled",
    "CHECKBOX",
    ["Use Custom Action (ADVANCE)", "Enable custom script for ADVANCE action"],
    [_category, "Section 7 - ADVANCE"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 7 - ADVANCE"],
    "ADVANCE",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_script",
    "EDITBOX",
    ["Script Path", "Path to .sqf file or leave empty for default"],
    [_category, "Section 7 - ADVANCE"],
    "",
    1
] call CBA_fnc_addSetting;