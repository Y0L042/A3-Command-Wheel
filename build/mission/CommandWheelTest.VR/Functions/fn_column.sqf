/*
 * Implementation: fn_column.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Column";

(group _caller) setFormation "COLUMN";

systemChat format ["Command %1 called by %2", "fn_column.sqf", name _caller];
