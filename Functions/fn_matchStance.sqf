/*
 * Implementation: fn_matchStance.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Auto stance";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};


{
    _x setUnitPos "AUTO";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_matchStance.sqf", name _caller];
