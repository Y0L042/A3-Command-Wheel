/*
 * Implementation: fn_cover.sqf
 *
 * Add your command logic here
 */
params ["_caller"];

hint "Cover";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

// Get threat direction from player's look direction
private _threatDir = getDir _caller;
private _callerPos = getPosATL _caller;

// Function to find cover position
private _fnc_findCover = {
    params ["_unit", "_threatDir"];
    
    private _unitPos = getPosATL _unit;
    private _coverPos = _unitPos;
    private _bestScore = -1;
    
    private _searchRadius = 50;
    private _searchPositions = [];
    
    // Generate search positions
    for "_i" from 0 to 11 do {
        private _angle = _i * 30;
        for "_dist" from 10 to _searchRadius step 10 do {
            _searchPositions pushBack (_unitPos getPos [_dist, _angle]);
        };
    };
    
    // Evaluate each position
    {
        private _pos = _x;
        private _score = 0;
        
        if (!surfaceIsWater _pos && !isOnRoad _pos) then {
            
            // Strongly prefer positions away from threat direction
            private _angleToPos = _unitPos getDir _pos;
            private _angleDiff = abs (_angleToPos - _threatDir);
            if (_angleDiff > 180) then {_angleDiff = 360 - _angleDiff};
            
            // Score based on angle (180 degrees is best - directly away from threat)
            _score = _score + (_angleDiff / 180) * 100;
            
            // Check for nearby objects (cover)
            private _nearObjects = nearestTerrainObjects [_pos, ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "WALL", "ROCK", "HIDE"], 5];
            _score = _score + (count _nearObjects * 20);
            
            // Prefer lower terrain
            private _terrainHeight = getTerrainHeightASL _pos;
            private _currentHeight = getTerrainHeightASL _unitPos;
            if (_terrainHeight < _currentHeight) then {
                _score = _score + 30;
            };
            
            // Check line of sight back to threat direction
            private _checkPos = _pos getPos [30, _threatDir];
            _checkPos set [2, (_pos select 2) + 1.6];
            private _testPos = _pos;
            _testPos set [2, (_pos select 2) + 0.5];
            
            if (terrainIntersectASL [_testPos, _checkPos]) then {
                _score = _score + 50;
            };
            
            // Penalize distance
            private _dist = _unitPos distance2D _pos;
            _score = _score - (_dist / 2);
            
            if (_score > _bestScore) then {
                _bestScore = _score;
                _coverPos = _pos;
            };
        };
    } forEach _searchPositions;
    
    _coverPos
};

// Order each unit to cover
{
    private _coverPos = [_x, _threatDir] call _fnc_findCover;
    
    _x doMove _coverPos;
    _x setSpeedMode "FULL";
    _x setBehaviour "COMBAT";
    _x setUnitPos "MIDDLE";
    
    // Go prone after reaching position
    [_x, _coverPos] spawn {
        params ["_unit", "_pos"];
        waitUntil {sleep 0.5; _unit distance2D _pos < 3 || !alive _unit};
        if (alive _unit) then {
            _unit setUnitPos "DOWN";
        };
    };
} forEach _groupUnits;