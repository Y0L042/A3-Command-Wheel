/*
 * Implementation: fn_flankLeft.sqf
 *
 * Add your command logic here
 */
params ["_caller"];

hint "Flank Left";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};
systemChat format ["Command %1 called by %2", "fn_flankLeft.sqf", name _caller];

// Get target position from player's look direction
private _callerPos = getPosATL _caller;
private _lookDir = getDir _caller;
private _targetPos = _callerPos getPos [150, _lookDir];

// Raycast to find actual target point (max 100m)
private _intersections = lineIntersectsSurfaces [
    AGLToASL (_callerPos vectorAdd [0, 0, 1.6]),
    AGLToASL (_targetPos vectorAdd [0, 0, 1.6]),
    _caller,
    objNull,
    true,
    1,
    "GEOM",
    "NONE"
];

if (count _intersections > 0) then {
    _targetPos = ASLToAGL ((_intersections select 0) select 0);
} else {
    // No intersection, use ground position at max range
    _targetPos set [2, getTerrainHeightASL _targetPos];
};

// Calculate flank position to the left
private _distance = _callerPos distance2D _targetPos;
private _flankDir = _lookDir - 90;
private _flankDist = _distance * 0.8;
private _flankPos = _targetPos getPos [_flankDist, _flankDir];

// Order units to flank
{
    _x doMove _flankPos;
    _x setSpeedMode "FULL";
    _x setBehaviour "COMBAT";
    _x setUnitPos "AUTO";
} forEach _groupUnits;

hint format ["Flanking LEFT to grid %1", mapGridPosition _flankPos];
systemChat format ["%1 units flanking left", count _groupUnits];