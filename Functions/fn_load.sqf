// Command Wheel onLoad handler
// Params: _this = [display, ...]
uiNamespace setVariable ['CommandWheel_Display', _this select 0];
call CMDWHEEL_fnc_wheelLoop;

// Add MouseButtonDown event handler
private _ehClick = (findDisplay 46) displayAddEventHandler [
    "MouseButtonDown",
    {
        // Only handle left mouse button
        if ((_this select 1) == 0) then {
            private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
            if (_selected >= 0) then {
                _selected call CMDWHEEL_fnc_wheelClick;
                closeDialog 9000;
            };
        };
    }
];
uiNamespace setVariable ['CommandWheel_MouseEH', _ehClick];

// Add KeyDown event handler
private _ehKey = (findDisplay 46) displayAddEventHandler [
    "KeyDown",
    {
        params ["_display", "_key", "_shift", "_ctrl", "_alt"];
        // User20 (220), Right Mouse Button (2), Space (57)
        if (_key in [200, 2]) then {
            closeDialog 9000;
            true
        } else {
            if (_key == 57) then {
                private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
                if (_selected >= 0) then {
                    _selected call CMDWHEEL_fnc_wheelClick;
                    closeDialog 9000;
                };
                true
            } else {
                false
            };
        };
    }
];
uiNamespace setVariable ['CommandWheel_KeyEH', _ehKey];
