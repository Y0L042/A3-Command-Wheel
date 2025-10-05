/*
 * Implementation: fn_moveThere.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Move there";

private _groupUnits = units group player - [player];

private _aimPos = screenToWorld [0.5, 0.5];

_groupUnits commandMove _aimPos;

systemChat format ["Command %1 called by %2", "fn_moveThere.sqf", name _caller];
