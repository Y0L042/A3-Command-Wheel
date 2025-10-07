/*
 * Implementation: fn_aggro.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Aggro";

private _groupUnits = units group player - [player];

{
    _x setUnitPos "UP";
    _x setCombatMode "RED";
    _x setCombatBehaviour "COMBAT";
    _x enableAI "AUTOCOMBAT";
    _x enableAI "SUPPRESSION";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_stealthHoldFire.sqf", name _caller];
