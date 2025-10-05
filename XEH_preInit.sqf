// Register settings for each command wheel action
private _category = "Command Wheel";

// Section 0 - MOVE
[
    "CMDWHEEL_action0_enabled",
    "CHECKBOX",
    ["Use Custom Action (MOVE)", "Enable custom action for MOVE"],
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
    "CMDWHEEL_action0_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint 'Hello'') or script call (e.g., 'call myFunction' or '[] execVM 'myScript.sqf'')"],
    [_category, "Section 0 - MOVE"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - FLANK
[
    "CMDWHEEL_action1_enabled",
    "CHECKBOX",
    ["Use Custom Action (FLANK)", "Enable custom action for FLANK"],
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
    "CMDWHEEL_action1_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 1 - FLANK"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - FOLLOW
[
    "CMDWHEEL_action2_enabled",
    "CHECKBOX",
    ["Use Custom Action (FOLLOW)", "Enable custom action for FOLLOW"],
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
    "CMDWHEEL_action2_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 2 - FOLLOW"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - HOLD
[
    "CMDWHEEL_action3_enabled",
    "CHECKBOX",
    ["Use Custom Action (HOLD)", "Enable custom action for HOLD"],
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
    "CMDWHEEL_action3_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 3 - HOLD"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 4 - STOP
[
    "CMDWHEEL_action4_enabled",
    "CHECKBOX",
    ["Use Custom Action (STOP)", "Enable custom action for STOP"],
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
    "CMDWHEEL_action4_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 4 - STOP"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 5 - REGROUP
[
    "CMDWHEEL_action5_enabled",
    "CHECKBOX",
    ["Use Custom Action (REGROUP)", "Enable custom action for REGROUP"],
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
    "CMDWHEEL_action5_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 5 - REGROUP"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 6 - COVER
[
    "CMDWHEEL_action6_enabled",
    "CHECKBOX",
    ["Use Custom Action (COVER)", "Enable custom action for COVER"],
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
    "CMDWHEEL_action6_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 6 - COVER"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 7 - ADVANCE
[
    "CMDWHEEL_action7_enabled",
    "CHECKBOX",
    ["Use Custom Action (ADVANCE)", "Enable custom action for ADVANCE"],
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
    "CMDWHEEL_action7_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute or script call"],
    [_category, "Section 7 - ADVANCE"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 0-0 - MOVE: Wedge Formation
[
    "CMDWHEEL_action0_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for MOVE: Wedge Formation"],
    [_category, "Section 0 - MOVE - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 0 - MOVE - Sub 0"],
    "Wedge Formation",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 0 - MOVE - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 0-1 - MOVE: Line Formation
[
    "CMDWHEEL_action0_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for MOVE: Line Formation"],
    [_category, "Section 0 - MOVE - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 0 - MOVE - Sub 1"],
    "Line Formation",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 0 - MOVE - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 0-2 - MOVE: Column Formation
[
    "CMDWHEEL_action0_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for MOVE: Column Formation"],
    [_category, "Section 0 - MOVE - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 0 - MOVE - Sub 2"],
    "Column Formation",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 0 - MOVE - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 0-3 - MOVE: Staggered Column
[
    "CMDWHEEL_action0_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for MOVE: Staggered Column"],
    [_category, "Section 0 - MOVE - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 0 - MOVE - Sub 3"],
    "Staggered Column",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 0 - MOVE - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 1-0 - FLANK: Flank Left
[
    "CMDWHEEL_action1_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FLANK: Flank Left"],
    [_category, "Section 1 - FLANK - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 1 - FLANK - Sub 0"],
    "Flank Left",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 1 - FLANK - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 1-1 - FLANK: Flank Right
[
    "CMDWHEEL_action1_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FLANK: Flank Right"],
    [_category, "Section 1 - FLANK - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 1 - FLANK - Sub 1"],
    "Flank Right",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 1 - FLANK - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 1-2 - FLANK: Wide Left
[
    "CMDWHEEL_action1_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FLANK: Wide Left"],
    [_category, "Section 1 - FLANK - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 1 - FLANK - Sub 2"],
    "Wide Left",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 1 - FLANK - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 1-3 - FLANK: Wide Right
[
    "CMDWHEEL_action1_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FLANK: Wide Right"],
    [_category, "Section 1 - FLANK - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 1 - FLANK - Sub 3"],
    "Wide Right",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 1 - FLANK - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 2-0 - FOLLOW: Close Formation
[
    "CMDWHEEL_action2_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FOLLOW: Close Formation"],
    [_category, "Section 2 - FOLLOW - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 2 - FOLLOW - Sub 0"],
    "Close Formation",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 2 - FOLLOW - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 2-1 - FOLLOW: Dispersed Formation
[
    "CMDWHEEL_action2_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FOLLOW: Dispersed Formation"],
    [_category, "Section 2 - FOLLOW - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 2 - FOLLOW - Sub 1"],
    "Dispersed Formation",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 2 - FOLLOW - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 2-2 - FOLLOW: Stealth Follow
[
    "CMDWHEEL_action2_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FOLLOW: Stealth Follow"],
    [_category, "Section 2 - FOLLOW - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 2 - FOLLOW - Sub 2"],
    "Stealth Follow",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 2 - FOLLOW - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 2-3 - FOLLOW: Combat Ready
[
    "CMDWHEEL_action2_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for FOLLOW: Combat Ready"],
    [_category, "Section 2 - FOLLOW - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 2 - FOLLOW - Sub 3"],
    "Combat Ready",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 2 - FOLLOW - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 3-0 - SUPPRESS: Suppress Target
[
    "CMDWHEEL_action3_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for SUPPRESS: Suppress Target"],
    [_category, "Section 3 - SUPPRESS - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 3 - SUPPRESS - Sub 0"],
    "Suppress Target",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 3 - SUPPRESS - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 3-1 - SUPPRESS: Suppress Area
[
    "CMDWHEEL_action3_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for SUPPRESS: Suppress Area"],
    [_category, "Section 3 - SUPPRESS - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 3 - SUPPRESS - Sub 1"],
    "Suppress Area",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 3 - SUPPRESS - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 3-2 - SUPPRESS: Suppress Nearest Enemy
[
    "CMDWHEEL_action3_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for SUPPRESS: Suppress Nearest Enemy"],
    [_category, "Section 3 - SUPPRESS - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 3 - SUPPRESS - Sub 2"],
    "Suppress Nearest Enemy",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 3 - SUPPRESS - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 3-3 - SUPPRESS: Suppress Watch Direction
[
    "CMDWHEEL_action3_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for SUPPRESS: Suppress Watch Direction"],
    [_category, "Section 3 - SUPPRESS - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 3 - SUPPRESS - Sub 3"],
    "Suppress Watch Direction",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 3 - SUPPRESS - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 4-0 - STOP: Hold Position
[
    "CMDWHEEL_action4_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for STOP: Hold Position"],
    [_category, "Section 4 - STOP - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 4 - STOP - Sub 0"],
    "Hold Position",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 4 - STOP - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 4-1 - STOP: Take Cover (Prone)
[
    "CMDWHEEL_action4_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for STOP: Take Cover (Prone)"],
    [_category, "Section 4 - STOP - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 4 - STOP - Sub 1"],
    "Take Cover (Prone)",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 4 - STOP - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 4-2 - STOP: Crouch
[
    "CMDWHEEL_action4_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for STOP: Crouch"],
    [_category, "Section 4 - STOP - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 4 - STOP - Sub 2"],
    "Crouch",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 4 - STOP - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 4-3 - STOP: Stealth Stop
[
    "CMDWHEEL_action4_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for STOP: Stealth Stop"],
    [_category, "Section 4 - STOP - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 4 - STOP - Sub 3"],
    "Stealth Stop",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 4 - STOP - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 5-0 - REGROUP: Regroup On Me
[
    "CMDWHEEL_action5_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for REGROUP: Regroup On Me"],
    [_category, "Section 5 - REGROUP - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 5 - REGROUP - Sub 0"],
    "Regroup On Me",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 5 - REGROUP - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 5-1 - REGROUP: Rally Point
[
    "CMDWHEEL_action5_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for REGROUP: Rally Point"],
    [_category, "Section 5 - REGROUP - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 5 - REGROUP - Sub 1"],
    "Rally Point",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 5 - REGROUP - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 5-2 - REGROUP: Regroup Nearest Unit
[
    "CMDWHEEL_action5_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for REGROUP: Regroup Nearest Unit"],
    [_category, "Section 5 - REGROUP - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 5 - REGROUP - Sub 2"],
    "Regroup Nearest Unit",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 5 - REGROUP - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 5-3 - REGROUP: Regroup Formation
[
    "CMDWHEEL_action5_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for REGROUP: Regroup Formation"],
    [_category, "Section 5 - REGROUP - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 5 - REGROUP - Sub 3"],
    "Regroup Formation",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 5 - REGROUP - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 6-0 - COVER: Suppressive Cover
[
    "CMDWHEEL_action6_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for COVER: Suppressive Cover"],
    [_category, "Section 6 - COVER - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 6 - COVER - Sub 0"],
    "Suppressive Cover",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 6 - COVER - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 6-1 - COVER: Defensive Cover
[
    "CMDWHEEL_action6_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for COVER: Defensive Cover"],
    [_category, "Section 6 - COVER - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 6 - COVER - Sub 1"],
    "Defensive Cover",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 6 - COVER - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 6-2 - COVER: Watch Cover
[
    "CMDWHEEL_action6_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for COVER: Watch Cover"],
    [_category, "Section 6 - COVER - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 6 - COVER - Sub 2"],
    "Watch Cover",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 6 - COVER - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 6-3 - COVER: Overwatch
[
    "CMDWHEEL_action6_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for COVER: Overwatch"],
    [_category, "Section 6 - COVER - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 6 - COVER - Sub 3"],
    "Overwatch",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 6 - COVER - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 7-0 - ADVANCE: Assault
[
    "CMDWHEEL_action7_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for ADVANCE: Assault"],
    [_category, "Section 7 - ADVANCE - Sub 0"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub0_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 7 - ADVANCE - Sub 0"],
    "Assault",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub0_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 7 - ADVANCE - Sub 0"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 7-1 - ADVANCE: Tactical Advance
[
    "CMDWHEEL_action7_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for ADVANCE: Tactical Advance"],
    [_category, "Section 7 - ADVANCE - Sub 1"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub1_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 7 - ADVANCE - Sub 1"],
    "Tactical Advance",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub1_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 7 - ADVANCE - Sub 1"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 7-2 - ADVANCE: Bounding Overwatch
[
    "CMDWHEEL_action7_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for ADVANCE: Bounding Overwatch"],
    [_category, "Section 7 - ADVANCE - Sub 2"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub2_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 7 - ADVANCE - Sub 2"],
    "Bounding Overwatch",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub2_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 7 - ADVANCE - Sub 2"],
    "",
    1
] call CBA_fnc_addSetting;

// Subsection 7-3 - ADVANCE: Stealth Advance
[
    "CMDWHEEL_action7_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Sub-Action", "Enable custom action for ADVANCE: Stealth Advance"],
    [_category, "Section 7 - ADVANCE - Sub 3"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub3_name",
    "EDITBOX",
    ["Sub-Action Name", "Display name for this sub-action"],
    [_category, "Section 7 - ADVANCE - Sub 3"],
    "Stealth Advance",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_sub3_code",
    "EDITBOX",
    ["Sub-Action Code", "SQF code to execute or script call"],
    [_category, "Section 7 - ADVANCE - Sub 3"],
    "",
    1
] call CBA_fnc_addSetting;