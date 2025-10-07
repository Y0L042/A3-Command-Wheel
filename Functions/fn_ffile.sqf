/*
 * Implementation: fn_ffile.sqf
 * 
 * Add your command logic here
 */

params ["_caller"];

hint "File";

(group _caller) setFormation "FILE";

systemChat format ["Command %1 called by %2", "fn_file.sqf", name _caller];
