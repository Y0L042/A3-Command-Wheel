// Section 3, Subcommand 2 (SUPPRESS - Nearest Enemy)
// Suppress nearest known enemy

private _playerGrp = group player;
private _nearestEnemy = objNull;
private _nearestDist = 1000;

// Find nearest known enemy
{
    private _enemy = _x;
    {
        if (side _x != side player && alive _x) then {
            private _dist = player distance _x;
            if (_dist < _nearestDist) then {
                _nearestDist = _dist;
                _nearestEnemy = _x;
            };
        };
    } forEach (units _enemy);
} forEach (allGroups select {side _x getFriend side player < 0.6});

if (!isNull _nearestEnemy) then {
    {
        _x doSuppressiveFire _nearestEnemy;
    } forEach (units _playerGrp);
    hint format ["SUPPRESS: Nearest enemy at %1m", round _nearestDist];
} else {
    hint "SUPPRESS: No enemies detected";
};
