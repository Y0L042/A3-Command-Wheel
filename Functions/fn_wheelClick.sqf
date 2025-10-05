// Execute the selected command
// _this can be:
//   - Single number (selected section index 0-7) for main commands
//   - Array [section, subsection] for subcommands

private _selected = _this;
private _isSubcommand = false;
private _subsection = -1;

// Check if this is a subcommand (array format)
if (_selected isEqualType []) then {
    _subsection = _selected select 1;
    _selected = _selected select 0;
    _isSubcommand = true;
};

if (_isSubcommand) then {
    // Execute subcommand
    systemChat format ["Executing subcommand: Section %1, Sub %2", _selected, _subsection];
    
    // Check for custom subcommand code
    private _useCustom = missionNamespace getVariable [format ["CMDWHEEL_action%1_sub%2_enabled", _selected, _subsection], false];
    private _customCode = missionNamespace getVariable [format ["CMDWHEEL_action%1_sub%2_code", _selected, _subsection], ""];
    
    if (_useCustom && _customCode != "") then {
        try {
            call compile _customCode;
        } catch {
            systemChat format ["Command Wheel Error: Failed to execute subcommand %1-%2", _selected, _subsection];
            systemChat format ["Error: %1", _exception];
        };
    } else {
        // Execute default subcommand function if it exists
        private _funcName = format ["CMDWHEEL_fnc_%1_sub%2", _selected, _subsection];
        private _func = missionNamespace getVariable [_funcName, {}];
        
        if (str _func != "{}") then {
            call _func;
        } else {
            // Fallback: show message if function not defined
            systemChat format ["Subcommand %1-%2 (function not defined: %3)", _selected, _subsection, _funcName];
        };
    };
} else {
    // Execute main command
    [_selected] call CMDWHEEL_fnc_executeAction;
};