/*
 * Implementation: fn_wedge.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Wedge";

(group _caller) setFormation "WEDGE";

systemChat format ["Command %1 called by %2", "fn_wedge.sqf", name _caller];
