/*
 * Implementation: fn_leapfrog.sqf
 *
 * Add your command logic here
 */

params ["_caller"];

hint "Leapfrog";

systemChat format ["Command %1 called by %2", "fn_leapfrog.sqf", name _caller];

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

// Determine which units to use and their team structure
private _teamsToUse = [];
private _needsTeamAssignment = false;

if (count _groupUnits > 0) then {
    // Check if selected units are already in teams
    private _redUnits = _groupUnits select {assignedTeam _x == "RED"};
    private _greenUnits = _groupUnits select {assignedTeam _x == "GREEN"};
    private _blueUnits = _groupUnits select {assignedTeam _x == "BLUE"};
    
    private _teamCount = 0;
    if (count _redUnits > 0) then {_teamCount = _teamCount + 1; _teamsToUse pushBack _redUnits};
    if (count _greenUnits > 0) then {_teamCount = _teamCount + 1; _teamsToUse pushBack _greenUnits};
    if (count _blueUnits > 0) then {_teamCount = _teamCount + 1; _teamsToUse pushBack _blueUnits};
    
    if (_teamCount == 2 || _teamCount == 3) then {
        // Use existing team structure
        systemChat format ["Using %1 existing teams", _teamCount];
    } else {
        // Need to divide into two teams
        _needsTeamAssignment = true;
    };
} else {
    // No selection, use all group units
    _groupUnits = units group _caller;
    _groupUnits = _groupUnits - [_caller]; // Exclude caller
    
    if (count _groupUnits == 0) exitWith {
        hint "No units to command";
    };
    
    // Check existing teams in group
    private _redUnits = _groupUnits select {assignedTeam _x == "RED"};
    private _greenUnits = _groupUnits select {assignedTeam _x == "GREEN"};
    private _blueUnits = _groupUnits select {assignedTeam _x == "BLUE"};
    
    private _teamCount = 0;
    if (count _redUnits > 0) then {_teamCount = _teamCount + 1; _teamsToUse pushBack _redUnits};
    if (count _greenUnits > 0) then {_teamCount = _teamCount + 1; _teamsToUse pushBack _greenUnits};
    if (count _blueUnits > 0) then {_teamCount = _teamCount + 1; _teamsToUse pushBack _blueUnits};
    
    if (_teamCount == 2 || _teamCount == 3) then {
        systemChat format ["Using %1 existing teams from group", _teamCount];
    } else {
        _needsTeamAssignment = true;
    };
};

// Divide into two teams if needed
if (_needsTeamAssignment) then {
    systemChat "Dividing units into two teams for leapfrog";
    private _halfCount = ceil ((count _groupUnits) / 2);
    private _team1 = [];
    private _team2 = [];
    
    for "_i" from 0 to (_halfCount - 1) do {
        if (_i < count _groupUnits) then {
            (_groupUnits select _i) assignTeam "RED";
            _team1 pushBack (_groupUnits select _i);
        };
    };
    
    for "_i" from _halfCount to ((count _groupUnits) - 1) do {
        (_groupUnits select _i) assignTeam "GREEN";
        _team2 pushBack (_groupUnits select _i);
    };
    
    _teamsToUse = [_team1, _team2];
};

// Get direction and calculate target distance
private _callerPos = getPosATL _caller;
private _direction = getDir _caller;
private _lookDir = getDir _caller;
private _targetPos = _callerPos getPos [200, _lookDir];

// Raycast to find actual target point (max 200m)
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

private _totalDistance = 150; // Default max distance
if (count _intersections > 0) then {
    _targetPos = ASLToAGL ((_intersections select 0) select 0);
    private _foundDistance = _callerPos distance2D _targetPos;
    _totalDistance = (_foundDistance min 150) max 100; // Clamp between 100-150m
} else {
    _totalDistance = 150; // Looking at distance, use max
};

private _leapDistance = 30; // Distance each team moves per leap

systemChat format ["Leapfrog distance: %1m", round _totalDistance];

// Start leapfrog sequence
[_teamsToUse, _callerPos, _direction, _leapDistance, _totalDistance] spawn {
    params ["_teams", "_startPos", "_dir", "_distance", "_totalDist"];
    
    private _teamPositions = [];
    
    // Initialize team positions array - all teams start at startPos
    {
        _teamPositions pushBack _startPos;
    } forEach _teams;
    
    // Continue leapfrogging until all teams reach target
    private _allTeamsAtTarget = false;
    private _moveCount = 0;
    
    while {!_allTeamsAtTarget} do {
        private _teamIndex = _moveCount mod (count _teams);
        private _movingTeam = _teams select _teamIndex;
        private _coveringTeams = _teams - [_movingTeam];
        
        // Get current position for this team
        private _teamCurrentPos = _teamPositions select _teamIndex;
        
        // Calculate zigzag offset (alternates between teams)
        private _zigzagSide = if (_teamIndex mod 2 == 0) then {1} else {-1};
        private _lateralOffset = 5 * _zigzagSide; // 5m to the side
        
        // Find the furthest team position to leap past
        private _furthestDist = 0;
        {
            private _dist = _startPos distance2D _x;
            if (_dist > _furthestDist) then {
                _furthestDist = _dist;
            };
        } forEach _teamPositions;
        
        // Calculate next position - leap past the furthest team
        private _nextCenterDist = _furthestDist + _distance;
        
        // Don't go past the target
        if (_nextCenterDist > _totalDist) then {
            _nextCenterDist = _totalDist;
        };
        
        private _nextCenterPos = _startPos getPos [_nextCenterDist, _dir];
        private _nextPos = _nextCenterPos getPos [_lateralOffset, _dir + 90];
        
        // Update team position
        _teamPositions set [_teamIndex, _nextPos];
        
        // Covering teams maintain overwatch
        {
            private _team = _x;
            {
                private _unit = _x;
                
                if (alive _unit) then {
                    doStop _unit;
                    _unit setUnitPos "MIDDLE";
                    _unit setBehaviour "COMBAT";
                    _unit doWatch _nextPos;
                    _unit setUnitCombatMode "YELLOW";
                };
            } forEach _team;
        } forEach _coveringTeams;
        
        sleep 0.5;
        
        systemChat format ["Team %1 leaping forward", _teamIndex + 1];
        
        // Moving team sprints forward with spread
        private _teamSize = count _movingTeam;
        {
            private _unitIndex = _forEachIndex;
            private _spreadAngle = _dir + ((_unitIndex - (_teamSize / 2)) * 5);
            private _unitTarget = _nextPos getPos [2 + (_unitIndex * 1.5), _spreadAngle];
            
            _x doMove _unitTarget;
            _x setSpeedMode "FULL";
            _x setBehaviour "AWARE";
            _x setUnitPos "UP";
            _x forceSpeed 21;
        } forEach _movingTeam;
        
        // Wait for team to reach position
        waitUntil {
            sleep 1;
            private _allArrived = true;
            {
                if (_x distance2D _nextPos > 15 && alive _x) then {
                    _allArrived = false;
                };
            } forEach _movingTeam;
            _allArrived || {!alive _x} count _movingTeam == count _movingTeam
        };
        
        // Moving team takes cover with spread
        private _teamSize = count _movingTeam;
        {
            if (alive _x) then {
                private _unitIndex = _forEachIndex;
                private _spreadAngle = _dir + ((_unitIndex - (_teamSize / 2)) * 15);
                private _spreadDist = 3 + (_unitIndex * 2);
                private _spreadPos = (getPosATL _x) getPos [_spreadDist, _spreadAngle];
                
                _x forceSpeed -1;
                _x doMove _spreadPos;
                _x setSpeedMode "LIMITED";
                
                [_x, _nextPos, _dir] spawn {
                    params ["_unit", "_pos", "_direction"];
                    sleep 0.5;
                    doStop _unit;
                    _unit setUnitPos "MIDDLE";
                    _unit setBehaviour "COMBAT";
                    _unit doWatch (_pos getPos [50, _direction]);
                };
            };
        } forEach _movingTeam;
        
        sleep 2;
        
        // Check if all teams have reached the target
        _allTeamsAtTarget = true;
        {
            if ((_startPos distance2D _x) < _totalDist) then {
                _allTeamsAtTarget = false;
            };
        } forEach _teamPositions;
        
        _moveCount = _moveCount + 1;
    };
    
    systemChat "Leapfrog complete - all teams at objective";
    hint "Leapfrog maneuver complete";
    
    // All teams stand down
    {
        {
            _x forceSpeed -1;
            _x setUnitPos "AUTO";
            _x setBehaviour "AWARE";
            _x setUnitCombatMode "GREEN";
        } forEach _x;
    } forEach _teams;
};

hint format ["Starting leapfrog with %1 teams to %2m", count _teamsToUse, round _totalDistance];