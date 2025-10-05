/*
 * Implementation: fn_regroup.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Regroup";

// regroup.sqf
// Usage: [group player] execVM "regroup.sqf";

params ["_group"];

units _group doFollow leader _group;

systemChat format ["Command %1 called by %2", "fn_regroup.sqf", name _caller];
