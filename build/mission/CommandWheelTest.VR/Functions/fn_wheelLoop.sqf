setMousePosition [0.5, 0.5];
onEachFrame {
    // Get the display
    private _display = findDisplay 9000;
    if (isNull _display) exitWith {};
    
    private _centerX = safeZoneX + safeZoneW * 0.5;
    private _centerY = safeZoneY + safeZoneH * 0.5;

    // Get Arma's virtual mouse position
    private _mousePos = getMousePosition;
    private _deltaX = (_mousePos select 0) - _centerX;
    private _deltaY = (_mousePos select 1) - _centerY;
    
    // Calculate angle from center (0 = top, clockwise)
    private _angle = (_deltaX atan2 -_deltaY);
    if (_angle < 0) then { _angle = _angle + 360; };
    
    private _distance = sqrt (_deltaX^2 + _deltaY^2);
    
    private _selected = -1;
    private _selectedSub = -1;
    private _showSubMenu = false;
    
    // Distance thresholds (normalized screen coordinates)
    private _deadZone = 0.09;        // Dead zone in center
    private _subMenuThreshold = 0.27; // Distance to trigger submenus

    // Check if left mouse button is being held down
    private _mouseButtonHeld = uiNamespace getVariable ['CommandWheel_MouseButtonHeld', false];

    // Get the locked section (when mouse button was first pressed)
    private _lockedSection = uiNamespace getVariable ['CommandWheel_LockedSection', -1];

    // If mouse is outside dead zone, select a main section
    if (_distance > _deadZone) then {
        if (_mouseButtonHeld && _lockedSection >= 0) then {
            // Mouse button is held - lock to the section that was selected when button was pressed
            _selected = _lockedSection;
            
            // Show submenus if mouse has moved far enough out
            if (_distance > _subMenuThreshold) then {
                _showSubMenu = true;
                
                // Main sections span: 0-45°, 45-90°, 90-135°, etc.
                // Subsections are centered at section_center + offset
                // Section center is at: section * 45 + 22.5
                private _sectionCenterAngle = _lockedSection * 45 + 22.5;
                
                // Calculate angle relative to section center
                private _relativeAngle = _angle - _sectionCenterAngle;
                
                // Normalize to -180 to +180 range
                if (_relativeAngle > 180) then { _relativeAngle = _relativeAngle - 360; };
                if (_relativeAngle < -180) then { _relativeAngle = _relativeAngle + 360; };
                
                // Subsection centers from Python: -16.875°, -5.625°, +5.625°, +16.875°
                // Boundaries halfway between centers: -11.25°, 0°, +11.25°
                if (_relativeAngle < -20) then {
                    _selectedSub = 0;
                } else {
                    if (_relativeAngle < 0) then {
                        _selectedSub = 1;
                    } else {
                        if (_relativeAngle < 20) then {
                            _selectedSub = 2;
                        } else {
                            _selectedSub = 3;
                        };
                    };
                };
            };
        } else {
            // No mouse button held - freely select based on angle
            // Main sections: 0-45° = section 0, 45-90° = section 1, etc.
            _selected = floor (_angle / 45) mod 8;
        };
    };

    
    // Update highlights only if selection changed
    private _oldSelected = uiNamespace getVariable ['CommandWheel_Selected', -1];
    private _oldSelectedSub = uiNamespace getVariable ['CommandWheel_SelectedSub', -1];
    private _oldShowSubMenu = uiNamespace getVariable ['CommandWheel_ShowSubMenu', false];
    
    if (_selected != _oldSelected || _selectedSub != _oldSelectedSub || _showSubMenu != _oldShowSubMenu) then {
        // Hide all main section highlights
        for "_i" from 0 to 7 do {
            private _ctrl = _display displayCtrl (9010 + _i);
            _ctrl ctrlSetTextColor [1, 1, 1, 0];
        };
        
        // Hide all subcommand base overlays
        for "_i" from 0 to 7 do {
            private _ctrl = _display displayCtrl (9040 + _i);
            _ctrl ctrlSetTextColor [1, 1, 1, 0];
        };
        
        // Hide all subcommand highlights
        for "_i" from 0 to 31 do {
            private _ctrl = _display displayCtrl (9100 + _i);
            _ctrl ctrlSetTextColor [1, 1, 1, 0];
        };
        
        // Hide/Show subcommand labels based on submenu state
        if (_showSubMenu && _selected >= 0) then {
            // Show only the selected section's subcommand labels
            for "_i" from 0 to 31 do {
                private _ctrl = _display displayCtrl (9200 + _i);
                private _sectionIdx = floor (_i / 4);
                if (_sectionIdx == _selected) then {
                    _ctrl ctrlSetTextColor [0.7, 0.9, 1, 1]; // Show labels for selected section
                } else {
                    _ctrl ctrlSetTextColor [0.7, 0.9, 1, 0]; // Hide other labels
                };
            };
        } else {
            // Hide all subcommand labels when not in submenu
            for "_i" from 0 to 31 do {
                private _ctrl = _display displayCtrl (9200 + _i);
                _ctrl ctrlSetTextColor [0.7, 0.9, 1, 0];
            };
        };
        
        // Show selected highlight
        if (_selected >= 0) then {
            if (_showSubMenu && _selectedSub >= 0) then {
                // Show subcommand base for this section
                private _baseCtrl = _display displayCtrl (9040 + _selected);
                _baseCtrl ctrlSetTextColor [1, 1, 1, 1];
                
                // Show subcommand highlight
                private _subIdx = _selected * 4 + _selectedSub;
                private _ctrl = _display displayCtrl (9100 + _subIdx);
                _ctrl ctrlSetTextColor [1, 1, 1, 1];
            } else {
                // Show main section highlight
                private _ctrl = _display displayCtrl (9010 + _selected);
                _ctrl ctrlSetTextColor [1, 1, 1, 1];
            };
        };
        
        uiNamespace setVariable ['CommandWheel_Selected', _selected];
        uiNamespace setVariable ['CommandWheel_SelectedSub', _selectedSub];
        uiNamespace setVariable ['CommandWheel_ShowSubMenu', _showSubMenu];
    };
};