// Section 6, Subcommand 1 (COVER - Defensive)
// Take defensive cover position

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "COMBAT";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "RED";

{
    _x commandMove _targetPos;
    _x setUnitPos "DOWN"; // Prone for maximum cover
} forEach (units _playerGrp);

hint "COVER: Defensive Position";
