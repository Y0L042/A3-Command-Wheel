/*
 * Implementation: fn_line.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Line";

(group _caller) setFormation "LINE";

systemChat format ["Command %1 called by %2", "fn_line.sqf", name _caller];
