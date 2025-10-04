player addAction [
    "Open Command Wheel",
    {
        if (isNull (findDisplay 9000)) then {
            createDialog "CommandWheel";
            systemChat "Command Wheel opened";
            
            (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
                params ["_display", "_button"];
                if (_button == 0) then {
                    private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
                    if (_selected >= 0) then {
                        switch (_selected) do {
                            case 0: { call CMDWHEEL_fnc_move; };
                            case 1: { call CMDWHEEL_fnc_follow; };
                            case 2: { call CMDWHEEL_fnc_hold; };
                            case 3: { call CMDWHEEL_fnc_regroup; };
                        };
                    };
                };
            }];
        };
    },
    nil,
    0,
    false,
    true,
    "User20"
];