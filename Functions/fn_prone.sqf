/*
 * Implementation: fn_prone.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Prone";

private _groupUnits = units group player - [player];

{
    _x setUnitPos "DOWN";
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_prone.sqf", name _caller];
