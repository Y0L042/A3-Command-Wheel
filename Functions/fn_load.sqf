// Command Wheel onLoad handler
// Params: _this = [display, ...]

params ["_display"];

uiNamespace setVariable ['CommandWheel_Display', _display];
call CMDWHEEL_fnc_wheelLoop;

// Update label texts from settings
for "_i" from 0 to 7 do {
    private _labelCtrl = _display displayCtrl (9020 + _i);
    private _customName = missionNamespace getVariable [format ["CMDWHEEL_action%1_name", _i], ""];
    
    if (_customName != "") then {
        _labelCtrl ctrlSetText _customName;
    };
};

uiNamespace setVariable ['CommandWheel_Display', _this select 0];
call CMDWHEEL_fnc_wheelLoop;

// Add MouseButtonDown event handler
private _ehMouseDown = (findDisplay 46) displayAddEventHandler [
    "MouseButtonDown",
    {
        private _button = _this select 1;
        
        // Right mouse button (1) - close without action
        if (_button == 1) exitWith {
            uiNamespace setVariable ['CommandWheel_MouseButtonHeld', false];
            uiNamespace setVariable ['CommandWheel_LockedSection', -1];
            closeDialog 9000;
        };
        
        // Left mouse button (0)
        if (_button == 0) then {
            // Mark that mouse button is being held
            uiNamespace setVariable ['CommandWheel_MouseButtonHeld', true];
            
            // Store the time when button was pressed (for hold detection)
            uiNamespace setVariable ['CommandWheel_MouseDownTime', time];
            
            // Lock the currently selected section
            private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
            uiNamespace setVariable ['CommandWheel_LockedSection', _selected];
        };
    }
];
uiNamespace setVariable ['CommandWheel_MouseDownEH', _ehMouseDown];

// Add MouseButtonUp event handler
private _ehMouseUp = (findDisplay 46) displayAddEventHandler [
    "MouseButtonUp",
    {
        // Only handle left mouse button
        if ((_this select 1) == 0) then {
            private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
            private _showSubMenu = uiNamespace getVariable ['CommandWheel_ShowSubMenu', false];
            private _selectedSub = uiNamespace getVariable ['CommandWheel_SelectedSub', -1];
            
            // Check how long the button was held
            private _mouseDownTime = uiNamespace getVariable ['CommandWheel_MouseDownTime', -1];
            private _holdDuration = time - _mouseDownTime;
            
            // Hold threshold: if released within 0.4 seconds, treat as quick click (main command only)
            private _holdThreshold = 0.4;
            
            // Reset mouse button state
            uiNamespace setVariable ['CommandWheel_MouseButtonHeld', false];
            uiNamespace setVariable ['CommandWheel_LockedSection', -1];
            uiNamespace setVariable ['CommandWheel_MouseDownTime', -1];
            
            if (_selected >= 0) then {
                // If held long enough AND submenu is showing AND a sub is selected, execute subcommand
                if (_holdDuration >= _holdThreshold && _showSubMenu && _selectedSub >= 0) then {
                    // Execute subcommand
                    [_selected, _selectedSub] call CMDWHEEL_fnc_wheelClick;
                } else {
                    // Execute main command (either quick click or no valid subcommand)
                    _selected call CMDWHEEL_fnc_wheelClick;
                };
                closeDialog 9000;
            };
        };
    }
];
uiNamespace setVariable ['CommandWheel_MouseUpEH', _ehMouseUp];

// Add KeyDown event handler
private _ehKey = (findDisplay 46) displayAddEventHandler [
    "KeyDown",
    {
        params ["_display", "_key", "_shift", "_ctrl", "_alt"];
        // User20 (220), Space (57)
        if (_key == 220) then {
            // Reset mouse button state on cancel
            uiNamespace setVariable ['CommandWheel_MouseButtonHeld', false];
            uiNamespace setVariable ['CommandWheel_LockedSection', -1];
            closeDialog 9000;
            true
        } else {
            if (_key == 57) then {
                private _selected = uiNamespace getVariable ['CommandWheel_Selected', -1];
                private _showSubMenu = uiNamespace getVariable ['CommandWheel_ShowSubMenu', false];
                private _selectedSub = uiNamespace getVariable ['CommandWheel_SelectedSub', -1];
                
                // Reset mouse button state
                uiNamespace setVariable ['CommandWheel_MouseButtonHeld', false];
                uiNamespace setVariable ['CommandWheel_LockedSection', -1];
                uiNamespace setVariable ['CommandWheel_MouseDownTime', -1];
                
                if (_selected >= 0) then {
                    if (_showSubMenu && _selectedSub >= 0) then {
                        // Execute subcommand
                        [_selected, _selectedSub] call CMDWHEEL_fnc_wheelClick;
                    } else {
                        // Execute main command
                        _selected call CMDWHEEL_fnc_wheelClick;
                    };
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
