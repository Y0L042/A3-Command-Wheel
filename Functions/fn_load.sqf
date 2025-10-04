// Command Wheel onLoad handler
// Params: _this = [display, ...]

uiNamespace setVariable ['CommandWheel_Display', _this select 0];
call CMDWHEEL_fnc_wheelLoop;
