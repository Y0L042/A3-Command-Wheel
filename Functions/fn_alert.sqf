/*
 * Implementation: fn_alert.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Alert";

private _groupUnits = units group player - [player];

{
    _x setUnitPos "UP";
    _x setCombatMode "YELLOW";
    _x setCombatBehaviour "AWARE";
    _x enableAI "AUTOCOMBAT";
    _x enableAI "SUPPRESSION";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_stealthHoldFire.sqf", name _caller];
