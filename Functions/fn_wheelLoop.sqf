uiNamespace setVariable ['CommandWheel_Active', true];
uiNamespace setVariable ['CommandWheel_Selected', -1];

private _display = uiNamespace getVariable ['CommandWheel_Display', displayNull];
if (isNull _display) exitWith {};

private _centerX = GUI_GRID_CENTER_X + 20 * GUI_GRID_CENTER_W;
private _centerY = GUI_GRID_CENTER_Y + 12.5 * GUI_GRID_CENTER_H;

while {uiNamespace getVariable ['CommandWheel_Active', false]} do {
    if (isNull _display) exitWith {};
    
    private _mousePos = getMousePosition;
    private _deltaX = (_mousePos select 0) - _centerX;
    private _deltaY = (_mousePos select 1) - _centerY;
    
    private _angle = (_deltaX atan2 _deltaY) + 180;
    private _distance = sqrt (_deltaX^2 + _deltaY^2);
    
    private _selected = -1;
    
    if (_distance > 0.03) then {
        _selected = floor ((_angle + 22.5) / 45) % 8;
    };
    
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
    
    if (_selected != (uiNamespace getVariable ['CommandWheel_Selected', -1])) then {
        uiNamespace setVariable ['CommandWheel_Selected', _selected];
    };
    
};