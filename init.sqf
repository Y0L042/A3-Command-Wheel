// // Add action to open command wheel
// player addAction [
//     "Open Command Wheel",
//     {
//         if (isNull (findDisplay 9000)) then {
//             createDialog "CommandWheel";
//         };
//     },
//     nil,
//     0,
//     false,
//     true,
//     "User20"
// ];

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
                        [_selected] call CMDWHEEL_fnc_executeAction;
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