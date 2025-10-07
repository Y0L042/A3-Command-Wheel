/*
 * Implementation: fn_matchStance.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Auto stance";

// TODO

private _groupUnits = units group player - [player];

{
    _x setUnitPos "AUTO";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_matchStance.sqf", name _caller];
