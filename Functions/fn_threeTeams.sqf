/*
 * Implementation: fn_threeTeams.sqf
 *
 * Add your command logic here
 */

params ["_caller"];

hint "Three Teams";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

systemChat format ["Command %1 called by %2", "fn_threeTeams.sqf", name _caller];

// Divide units into three teams
private _unitCount = count _groupUnits;
private _redCount = ceil (_unitCount / 3);
private _greenCount = ceil ((_unitCount - _redCount) / 2);
private _blueCount = _unitCount - _redCount - _greenCount;

// Assign RED team
for "_i" from 0 to (_redCount - 1) do {
    if (_i < _unitCount) then {
        (_groupUnits select _i) assignTeam "RED";
        systemChat format ["%1 assigned to RED team", name (_groupUnits select _i)];
    };
};

// Assign GREEN team
for "_i" from _redCount to (_redCount + _greenCount - 1) do {
    if (_i < _unitCount) then {
        (_groupUnits select _i) assignTeam "GREEN";
        systemChat format ["%1 assigned to GREEN team", name (_groupUnits select _i)];
    };
};

// Assign BLUE team
for "_i" from (_redCount + _greenCount) to (_unitCount - 1) do {
    (_groupUnits select _i) assignTeam "BLUE";
    systemChat format ["%1 assigned to BLUE team", name (_groupUnits select _i)];
};

hint format ["Divided %1 units: %2 RED, %3 GREEN, %4 BLUE", _unitCount, _redCount, _greenCount, _blueCount];