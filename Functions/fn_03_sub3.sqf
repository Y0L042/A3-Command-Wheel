// Section 3, Subcommand 3 (SUPPRESS - Watch Direction)
// Suppress and watch the direction player is facing

private _playerGrp = group player;
private _dir = getDir player;
private _targetPos = player getPos [200, _dir]; // 200m in facing direction

// Set suppressive behavior
_playerGrp setBehaviour "COMBAT";
_playerGrp setCombatMode "RED";

{
    _x doSuppressiveFire _targetPos;
    _x doWatch _targetPos;
} forEach (units _playerGrp);

hint format ["SUPPRESS: Watching %1°", round _dir];
