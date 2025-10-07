/*
 * Implementation: fn_hold.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Hold";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

doStop (_groupUnits);

systemChat format ["Command %1 called by %2", "fn_hold.sqf", name _caller];
