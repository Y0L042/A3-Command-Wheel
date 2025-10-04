player addAction [
    "Open Command Wheel",
    {
        if (isNull (findDisplay 9000)) then {
            createDialog "CommandWheel";
            
            (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
                params ["_display", "_button"];
                if (_button == 0) then {
                    private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
                    if (_selected >= 0) then {
                        private _functions = [
                            CMDWHEEL_fnc_move,
                            CMDWHEEL_fnc_flank,
                            CMDWHEEL_fnc_follow,
                            CMDWHEEL_fnc_hold,
                            CMDWHEEL_fnc_stop,
                            CMDWHEEL_fnc_regroup,
                            CMDWHEEL_fnc_cover,
                            CMDWHEEL_fnc_advance
                        ];
                        call (_functions select _selected);
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