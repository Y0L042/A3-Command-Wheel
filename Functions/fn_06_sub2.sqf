// Section 6, Subcommand 2 (COVER - Watch)
// Take cover and watch direction

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "YELLOW";

{
    _x commandMove _targetPos;
    _x setUnitPos "MIDDLE"; // Crouch
    _x doWatch _targetPos;
} forEach (units _playerGrp);

hint "COVER: Watching";
