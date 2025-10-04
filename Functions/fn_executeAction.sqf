params ["_actionIndex"];

// Get settings for this action
private _useCustom = missionNamespace getVariable [format ["CMDWHEEL_action%1_enabled", _actionIndex], false];
private _scriptPath = missionNamespace getVariable [format ["CMDWHEEL_action%1_script", _actionIndex], ""];

if (_useCustom && _scriptPath != "") then {
    // Execute custom script
    if (fileExists _scriptPath) then {
        call compile preprocessFileLineNumbers _scriptPath;
    } else {
        systemChat format ["Command Wheel: Script not found: %1", _scriptPath];
    };
} else {
    // Execute default action
    private _defaultFunctions = [
        CMDWHEEL_fnc_move,
        CMDWHEEL_fnc_flank,
        CMDWHEEL_fnc_follow,
        CMDWHEEL_fnc_hold,
        CMDWHEEL_fnc_stop,
        CMDWHEEL_fnc_regroup,
        CMDWHEEL_fnc_cover,
        CMDWHEEL_fnc_advance
    ];
    
    call (_defaultFunctions select _actionIndex);
};