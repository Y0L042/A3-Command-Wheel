/*
 * Implementation: fn_prone.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Prone";

// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

{
    _x setUnitPos "DOWN";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_prone.sqf", name _caller];
