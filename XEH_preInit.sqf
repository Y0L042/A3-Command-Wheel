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

// Section 1 - PRONE
[
    "CMDWHEEL_action1_enabled",
    "CHECKBOX",
    ["Use Custom Action (PRONE)", "Enable custom action for PRONE"],
    [_category, "Section 1 - PRONE"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 1 - PRONE"],
    "Prone",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 1 - PRONE"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - STEALTH
[
    "CMDWHEEL_action2_enabled",
    "CHECKBOX",
    ["Use Custom Action (STEALTH)", "Enable custom action for STEALTH"],
    [_category, "Section 2 - STEALTH"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 2 - STEALTH"],
    "Stealth",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 2 - STEALTH"],
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

// Section 4 - SUPPRESSIVE FIRE
[
    "CMDWHEEL_action4_enabled",
    "CHECKBOX",
    ["Use Custom Action (SUPPRESSIVE FIRE)", "Enable custom action for SUPPRESSIVE FIRE"],
    [_category, "Section 4 - SUPPRESSIVE FIRE"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 4 - SUPPRESSIVE FIRE"],
    "Suppressive fire",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 4 - SUPPRESSIVE FIRE"],
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

// Section 7 - TELEPORT TO ME
[
    "CMDWHEEL_action7_enabled",
    "CHECKBOX",
    ["Use Custom Action (TELEPORT TO ME)", "Enable custom action for TELEPORT TO ME"],
    [_category, "Section 7 - TELEPORT TO ME"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section 7 - TELEPORT TO ME"],
    "Teleport to me",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action7_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section 7 - TELEPORT TO ME"],
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

// Section 0 - Subsection 3 (Garrison)
[
    "CMDWHEEL_action0_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Garrison)", "Enable custom subcommand for HOLD > Garrison"],
    [_category, "Section 0 - HOLD > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action0_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 0 - HOLD > Subcommands"],
    "Garrison",
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

// Section 1 - Subsection 0 (Get Up)
[
    "CMDWHEEL_action1_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Get Up)", "Enable custom subcommand for PRONE > Get Up"],
    [_category, "Section 1 - PRONE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "Get Up",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 1 (Match my stance)
[
    "CMDWHEEL_action1_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Match my stance)", "Enable custom subcommand for PRONE > Match my stance"],
    [_category, "Section 1 - PRONE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "Match my stance",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 2 (Find cover)
[
    "CMDWHEEL_action1_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Find cover)", "Enable custom subcommand for PRONE > Find cover"],
    [_category, "Section 1 - PRONE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "Find cover",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 1 - Subsection 3 (Prone)
[
    "CMDWHEEL_action1_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Prone)", "Enable custom subcommand for PRONE > Prone"],
    [_category, "Section 1 - PRONE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "Prone",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action1_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 1 - PRONE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 0 (Alert)
[
    "CMDWHEEL_action2_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Alert)", "Enable custom subcommand for STEALTH > Alert"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "Alert",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 1 (Target enemy)
[
    "CMDWHEEL_action2_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Target enemy)", "Enable custom subcommand for STEALTH > Target enemy"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "Target enemy",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 2 (Heal soldier)
[
    "CMDWHEEL_action2_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Heal soldier)", "Enable custom subcommand for STEALTH > Heal soldier"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "Heal soldier",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 2 - Subsection 3 (Disengage)
[
    "CMDWHEEL_action2_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Disengage)", "Enable custom subcommand for STEALTH > Disengage"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 2 - STEALTH > Subcommands"],
    "Disengage",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action2_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 2 - STEALTH > Subcommands"],
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

// Section 4 - Subsection 0 (Forced suppressive fire)
[
    "CMDWHEEL_action4_sub0_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Forced suppressive fire)", "Enable custom subcommand for SUPPRESSIVE FIRE > Forced suppressive fire"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub0_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "Forced suppressive fire",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub0_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 4 - Subsection 1 (Target enemy)
[
    "CMDWHEEL_action4_sub1_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Target enemy)", "Enable custom subcommand for SUPPRESSIVE FIRE > Target enemy"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub1_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "Target enemy",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub1_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 4 - Subsection 2 (Heal soldier)
[
    "CMDWHEEL_action4_sub2_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Heal soldier)", "Enable custom subcommand for SUPPRESSIVE FIRE > Heal soldier"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub2_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "Heal soldier",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub2_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

// Section 4 - Subsection 3 (Disengage)
[
    "CMDWHEEL_action4_sub3_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand (Disengage)", "Enable custom subcommand for SUPPRESSIVE FIRE > Disengage"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub3_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "Disengage",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action4_sub3_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section 4 - SUPPRESSIVE FIRE > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;

