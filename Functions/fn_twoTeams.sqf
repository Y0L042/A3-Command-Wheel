/*
 * Implementation: fn_twoTeams.sqf
 *
 * Add your command logic here
 */

params ["_caller"];

hint "Two Teams";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

systemChat format ["Command %1 called by %2", "fn_twoTeams.sqf", name _caller];

// Divide units into two teams
private _halfCount = ceil ((count _groupUnits) / 2);

// Assign first half to RED team
for "_i" from 0 to (_halfCount - 1) do {
    if (_i < count _groupUnits) then {
        (_groupUnits select _i) assignTeam "RED";
        systemChat format ["%1 assigned to RED team", name (_groupUnits select _i)];
    };
};

// Assign second half to GREEN team
for "_i" from _halfCount to ((count _groupUnits) - 1) do {
    (_groupUnits select _i) assignTeam "GREEN";
    systemChat format ["%1 assigned to GREEN team", name (_groupUnits select _i)];
};

hint format ["Divided %1 units: %2 RED, %3 GREEN", count _groupUnits, _halfCount, (count _groupUnits) - _halfCount];