/*
 * Implementation: fn_hold.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Hold";

// private _groupUnits = group player;
private _groupUnits = units group player - [player];
// {
//     _x doMove (getPos _x);
// } forEach _groupUnits;

doStop (units player);

systemChat format ["Command %1 called by %2", "fn_hold.sqf", name _caller];
