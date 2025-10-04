uiNamespace setVariable ['CommandWheel_Active', true];
uiNamespace setVariable ['CommandWheel_Selected', -1];

private _display = uiNamespace getVariable ['CommandWheel_Display', displayNull];
if (isNull _display) exitWith {};

private _centerX = GUI_GRID_CENTER_X + 20 * GUI_GRID_CENTER_W;
private _centerY = GUI_GRID_CENTER_Y + 12.5 * GUI_GRID_CENTER_H;

private _normalColor = [0.3, 0.3, 0.3, 0.8];
private _hoverColor = [0.6, 0.8, 0.3, 0.9];

while {uiNamespace getVariable ['CommandWheel_Active', false]} do {
    if (isNull _display) exitWith {};
    
    private _mousePos = getMousePosition;
    private _deltaX = (_mousePos select 0) - _centerX;
    private _deltaY = (_mousePos select 1) - _centerY;
    
    private _angle = (_deltaX atan2 _deltaY) + 180;
    private _distance = sqrt (_deltaX^2 + _deltaY^2);
    
    private _selected = -1;
    
    if (_distance > 0.02) then {
        if (_angle >= 315 || _angle < 45) then {
            _selected = 0;
        } else {
            if (_angle >= 45 && _angle < 135) then {
                _selected = 1;
            } else {
                if (_angle >= 135 && _angle < 225) then {
                    _selected = 2;
                } else {
                    if (_angle >= 225 && _angle < 315) then {
                        _selected = 3;
                    };
                };
            };
        };
    };
    
    {
        private _ctrl = _display displayCtrl (9010 + _forEachIndex);
        if (_forEachIndex == _selected) then {
            _ctrl ctrlSetBackgroundColor _hoverColor;
        } else {
            _ctrl ctrlSetBackgroundColor _normalColor;
        };
    } forEach [0, 1, 2, 3];
    
    if (_selected != (uiNamespace getVariable ['CommandWheel_Selected', -1])) then {
        uiNamespace setVariable ['CommandWheel_Selected', _selected];
        switch (_selected) do {
            case 0: { systemChat "MOVE"; };
            case 1: { systemChat "FOLLOW"; };
            case 2: { systemChat "HOLD"; };
            case 3: { systemChat "REGROUP"; };
        };
    };
};