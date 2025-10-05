/*
 * Implementation: fn_getUp.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Get up";

private _groupUnits = units group player - [player];

{
    _x setUnitPos "UP";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_getUp.sqf", name _caller];
