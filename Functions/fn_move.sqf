// Get player's group
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};


// Get target position from screen center
private _targetPos = screenToWorld [0.5, 0.5];

// Issue group move command
_groupUnits doMove _targetPos;

hint "MOVE command issued";