/*
 * Implementation: fn_stealthHoldFire.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Stealth & Hold Fire";

private _groupUnits = units group player - [player];

{
    _x setBehaviour "STEALTH";
    _x setUnitPos "MIDDLE";
    _x setCombatMode "GREEN"; // Hold fire
    // _x disableAI "AUTOCOMBAT";
    // _x disableAI "SUPPRESSION";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_stealthHoldFire.sqf", name _caller];
