// Section 6, Subcommand 0 (COVER - Suppressive)
// Take cover and provide suppressive fire

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "COMBAT";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "RED";

{
    _x commandMove _targetPos;
    _x setUnitPos "MIDDLE"; // Crouch for cover
    _x doSuppressiveFire _targetPos;
} forEach (units _playerGrp);

hint "COVER: Suppressive Fire";
