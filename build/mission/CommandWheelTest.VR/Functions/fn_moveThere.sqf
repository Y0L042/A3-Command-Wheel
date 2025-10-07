/*
 * Implementation: fn_moveThere.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Move there";

// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

private _aimPos = screenToWorld [0.5, 0.5];

_groupUnits commandMove _aimPos;

systemChat format ["Command %1 called by %2", "fn_moveThere.sqf", name _caller];
