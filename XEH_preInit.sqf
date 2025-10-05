// Register settings for each command wheel action
private _category = "Command Wheel";

// Section 0 - HOLD
[
    "CMDWHEEL_action0_enabled",
    "CHECKBOX",
    ["Use Custom Action (HOLD)", "Enable custom action for HOLD"],
    [_category, "Section 0 - HOLD"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 0 - HOLD"],
    "Hold",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 0 - HOLD"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - STEALTH & HOLD FIRE
[
    "CMDWHEEL_action1_enabled",
    "CHECKBOX",
    ["Use Custom Action (STEALTH & HOLD FIRE)", "Enable custom action for STEALTH & HOLD FIRE"],
    [_category, "Section 1 - STEALTH & HOLD FIRE"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 1 - STEALTH & HOLD FIRE"],
    "Stealth & Hold Fire",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 1 - STEALTH & HOLD FIRE"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - SUPPRESSIVE FIRE
[
    "CMDWHEEL_action2_enabled",
    "CHECKBOX",
    ["Use Custom Action (SUPPRESSIVE FIRE)", "Enable custom action for SUPPRESSIVE FIRE"],
    [_category, "Section 2 - SUPPRESSIVE FIRE"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 2 - SUPPRESSIVE FIRE"],
    "Suppressive fire",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 2 - SUPPRESSIVE FIRE"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - COLUMN
[
    "CMDWHEEL_action3_enabled",
    "CHECKBOX",
    ["Use Custom Action (COLUMN)", "Enable custom action for COLUMN"],
    [_category, "Section 3 - COLUMN"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 3 - COLUMN"],
    "Column",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 3 - COLUMN"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 4 - SECTION 4
[
    "CMDWHEEL_action4_enabled",
    "CHECKBOX",
    ["Use Custom Action (SECTION 4)", "Enable custom action for SECTION 4"],
    [_category, "Section 4 - SECTION 4"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 4 - SECTION 4"],
    "Section 4",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 4 - SECTION 4"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 5 - SECTION 5
[
    "CMDWHEEL_action5_enabled",
    "CHECKBOX",
    ["Use Custom Action (SECTION 5)", "Enable custom action for SECTION 5"],
    [_category, "Section 5 - SECTION 5"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 5 - SECTION 5"],
    "Section 5",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action5_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 5 - SECTION 5"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 6 - SECTION 6
[
    "CMDWHEEL_action6_enabled",
    "CHECKBOX",
    ["Use Custom Action (SECTION 6)", "Enable custom action for SECTION 6"],
    [_category, "Section 6 - SECTION 6"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 6 - SECTION 6"],
    "Section 6",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action6_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 6 - SECTION 6"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 7 - SECTION 7
[
    "CMDWHEEL_action7_enabled",
    "CHECKBOX",
    ["Use Custom Action (SECTION 7)", "Enable custom action for SECTION 7"],
    [_category, "Section 7 - SECTION 7"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 7 - SECTION 7"],
    "Section 7",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 7 - SECTION 7"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 0 - Subsection 0 (Regroup)
[
    "CMDWHEEL_action0_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Regroup)", "Enable custom subcommand for HOLD > Regroup"],
    [_category, "Section 0 - HOLD > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "Regroup",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 0 - Subsection 1 (Move there)
[
    "CMDWHEEL_action0_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Move there)", "Enable custom subcommand for HOLD > Move there"],
    [_category, "Section 0 - HOLD > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "Move there",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 0 - Subsection 2 (GoGoGo!)
[
    "CMDWHEEL_action0_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (GoGoGo!)", "Enable custom subcommand for HOLD > GoGoGo!"],
    [_category, "Section 0 - HOLD > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "GoGoGo!",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 0 - Subsection 3 (Teleport to me)
[
    "CMDWHEEL_action0_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Teleport to me)", "Enable custom subcommand for HOLD > Teleport to me"],
    [_category, "Section 0 - HOLD > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "Teleport to me",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 0 (Prone)
[
    "CMDWHEEL_action1_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Prone)", "Enable custom subcommand for STEALTH & HOLD FIRE > Prone"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "Prone",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 1 (Get Up)
[
    "CMDWHEEL_action1_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Get Up)", "Enable custom subcommand for STEALTH & HOLD FIRE > Get Up"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "Get Up",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 2 (Match my stance)
[
    "CMDWHEEL_action1_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Match my stance)", "Enable custom subcommand for STEALTH & HOLD FIRE > Match my stance"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "Match my stance",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 3 (Find cover)
[
    "CMDWHEEL_action1_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Find cover)", "Enable custom subcommand for STEALTH & HOLD FIRE > Find cover"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "Find cover",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - STEALTH & HOLD FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 0 (Forced suppressive fire)
[
    "CMDWHEEL_action2_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Forced suppressive fire)", "Enable custom subcommand for SUPPRESSIVE FIRE > Forced suppressive fire"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "Forced suppressive fire",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 1 (Target enemy)
[
    "CMDWHEEL_action2_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Target enemy)", "Enable custom subcommand for SUPPRESSIVE FIRE > Target enemy"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "Target enemy",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 2 (Heal soldier)
[
    "CMDWHEEL_action2_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Heal soldier)", "Enable custom subcommand for SUPPRESSIVE FIRE > Heal soldier"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "Heal soldier",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 3 (Disengage)
[
    "CMDWHEEL_action2_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Disengage)", "Enable custom subcommand for SUPPRESSIVE FIRE > Disengage"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "Disengage",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - Subsection 0 (Staggered column)
[
    "CMDWHEEL_action3_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Staggered column)", "Enable custom subcommand for COLUMN > Staggered column"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "Staggered column",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - Subsection 1 (Wedge)
[
    "CMDWHEEL_action3_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Wedge)", "Enable custom subcommand for COLUMN > Wedge"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "Wedge",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - Subsection 2 (File)
[
    "CMDWHEEL_action3_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (File)", "Enable custom subcommand for COLUMN > File"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "File",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 3 - Subsection 3 (Line)
[
    "CMDWHEEL_action3_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Line)", "Enable custom subcommand for COLUMN > Line"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "Line",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action3_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 3 - COLUMN > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

