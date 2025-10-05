params ["_actionIndex"];

// Get settings for this action
private _useCustom = missionNamespace getVariable [format ["CMDWHEEL_action%1_enabled", _actionIndex], false];
private _customCode = missionNamespace getVariable [format ["CMDWHEEL_action%1_code", _actionIndex], ""];

if (_useCustom && _customCode != "") then {
    systemChat "Executing CUSTOM action";
    // Execute custom code
    try {
        call compile _customCode;
    } catch {
        systemChat format ["Command Wheel Error: Failed to execute action %1", _actionIndex];
        systemChat format ["Error: %1", _exception];
    };
} else {
    // Execute default action
    private _defaultFunctions = [
        CMDWHEEL_fnc_00,    // 0 - Top          NNE
        CMDWHEEL_fnc_01,    // 1 - Top Right    NEE
        CMDWHEEL_fnc_02,    // 2 - Right        SEE
        CMDWHEEL_fnc_03,    // 3 - Bottom Right SSE
        CMDWHEEL_fnc_04,    // 4 - Bottom       SSW
        CMDWHEEL_fnc_05,    // 5 - Bottom Left  SWW
        CMDWHEEL_fnc_06,    // 6 - Left         NWW
        CMDWHEEL_fnc_07     // 7 - Top Left     NNW
    ];
    
    if (_actionIndex >= 0 && _actionIndex < count _defaultFunctions) then {
        player call (_defaultFunctions select _actionIndex);
    };
};