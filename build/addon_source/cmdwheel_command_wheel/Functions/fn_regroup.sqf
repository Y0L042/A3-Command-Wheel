/*
 * Implementation: fn_regroup.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Regroup";

// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

// Make selected units regroup on the caller
{
    _x doFollow _caller;
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_regroup.sqf", name _caller];
