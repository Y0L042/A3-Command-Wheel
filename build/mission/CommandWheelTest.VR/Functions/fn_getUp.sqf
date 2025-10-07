/*
 * Implementation: fn_getUp.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Get up";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

{
    _x setUnitPos "UP";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_getUp.sqf", name _caller];
