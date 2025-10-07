// Get player's group
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};


// Stop all units in group
doStop _groupUnits;

hint "STOP command issued";