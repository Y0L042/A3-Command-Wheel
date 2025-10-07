params ["_caller"];

hint "Follow";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};


// Set group to follow formation
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";

// Make all units follow player
{
    _x doFollow _caller;
} forEach _groupUnits;