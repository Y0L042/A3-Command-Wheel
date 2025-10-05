// Section 5, Subcommand 2 (REGROUP - Nearest Unit)
// Regroup on nearest squad member

private _playerGrp = group player;
private _nearestUnit = objNull;
private _nearestDist = 1000;

// Find nearest squad member
{
    if (_x != player && alive _x) then {
        private _dist = player distance _x;
        if (_dist < _nearestDist) then {
            _nearestDist = _dist;
            _nearestUnit = _x;
        };
    };
} forEach (units _playerGrp);

if (!isNull _nearestUnit) then {
    private _targetPos = getPos _nearestUnit;
    
    _playerGrp setBehaviour "AWARE";
    _playerGrp setSpeedMode "FULL";
    _playerGrp setCombatMode "YELLOW";
    
    {
        _x doMove _targetPos;
    } forEach (units _playerGrp);
    
    hint format ["REGROUP: On %1", name _nearestUnit];
} else {
    hint "REGROUP: No squad members found";
};
