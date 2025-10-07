/*
 * Implementation: fn_garrison.sqf
 *
 * Add your command logic here
 */
params ["_caller"];

hint "Garrison";

// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};
// Get building player is looking at
private _aimPos = screenToWorld [0.5, 0.5];
private _building = nearestBuilding _aimPos;
// Get building positions
private _buildingPositions = _building buildingPos -1; // -1 gets all positions
// Check if building has positions
if (count _buildingPositions == 0) exitWith {
    hint "No garrison positions available in target building";
};
// Check if this is the same building as last garrison command
private _lastBuilding = missionNamespace getVariable ["GARRISON_lastBuilding", objNull];
private _lastTime = missionNamespace getVariable ["GARRISON_lastTime", 0];
private _currentTime = time;
private _usePathfinding = true;
if (_building == _lastBuilding && (_currentTime - _lastTime) < 120) then {
    _usePathfinding = false;
    hint "Teleporting to garrison positions";
} else {
    hint "Moving to garrison positions";
};
// Store current building and time
missionNamespace setVariable ["GARRISON_lastBuilding", _building];
missionNamespace setVariable ["GARRISON_lastTime", _currentTime];

// Get building center for calculating outward direction
private _buildingCenter = getPos _building;

// Garrison units
{
    private _unit = _x;
    private _posIndex = _forEachIndex min ((count _buildingPositions) - 1);
    private _pos = _buildingPositions select _posIndex;
    
    // Calculate direction from building center to position
    private _dirToOutward = _buildingCenter getDir _pos;
   
    if (_usePathfinding) then {
        // Pathfind to position
        _unit doMove _pos;
       
        // Wait until arrived, then hold position
        [_unit, _pos, _dirToOutward] spawn {
            params ["_unit", "_targetPos", "_dir"];
           
            waitUntil {sleep 0.5; (_unit distance _targetPos < 2) || !alive _unit};
            
            if (alive _unit) then {
                _unit setUnitPos "MIDDLE";
                _unit setDir _dir;
                doStop _unit;
            };
        };
    } else {
        // Teleport to position
        _unit setPosATL _pos;
        _unit setUnitPos "MIDDLE";
        _unit setDir _dirToOutward;
        doStop _unit;
    };
   
} forEach _groupUnits;
hint format ["Garrisoning %1 units in building", count _groupUnits min count _buildingPositions];
systemChat format ["Command %1 called by %2", "fn_garrison.sqf", name _caller];