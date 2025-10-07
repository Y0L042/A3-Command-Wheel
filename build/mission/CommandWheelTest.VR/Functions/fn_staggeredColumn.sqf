/*
 * Implementation: fn_staggeredColumn.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "Staggered Column";

(group _caller) setFormation "STAG COLUMN";

systemChat format ["Command %1 called by %2", "fn_staggeredColumn.sqf", name _caller];
