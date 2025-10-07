/*
 * Implementation: fn_stealthHoldFire.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Stealth & Hold Fire";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};


{
    _x setBehaviour "STEALTH";
    _x setUnitPos "MIDDLE";
    _x setCombatMode "GREEN"; // Hold fire
    // _x disableAI "AUTOCOMBAT";
    // _x disableAI "SUPPRESSION";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_stealthHoldFire.sqf", name _caller];
