onEachFrame {																
    _pos = getMousePosition;
    // systemChat format ["Mouse Position: %1", _pos];

        
    private _centerX = 0.5;
    private _centerY = 0.5;
    
    // Get Arma's virtual mouse position
    private _mousePos = getMousePosition;
    private _deltaX = (_mousePos select 0) - _centerX;
    private _deltaY = (_mousePos select 1) - _centerY;
    
    // Calculate angle from center (0 = top, clockwise)
    private _angle = (_deltaX atan2 -_deltaY);
    if (_angle < 0) then { _angle = _angle + 360; };
    
    private _distance = sqrt (_deltaX^2 + _deltaY^2);
    
    private _selected = -1;
    
    // Only select if mouse is far enough from center
    if (_distance > 0.05) then {
        _selected = floor ((_angle + 22.5) / 45) mod 8;
    };

    systemChat format ["Angle: %1, Distance: %2, Selected: %3", _angle, _distance, _selected];
    
    // Update highlights only if selection changed
    private _oldSelected = uiNamespace getVariable ['CommandWheel_Selected', -1];
    if (_selected != _oldSelected) then {
        // Hide all highlights
        for "_i" from 0 to 7 do {
            private _ctrl = _display displayCtrl (9010 + _i);
            _ctrl ctrlSetTextColor [1, 1, 1, 0];
        };
        
        // Show selected highlight
        if (_selected >= 0) then {
            private _ctrl = _display displayCtrl (9010 + _selected);
            _ctrl ctrlSetTextColor [1, 1, 1, 1];
        };
        
        uiNamespace setVariable ['CommandWheel_Selected', _selected];
    };
};

