// Section 7, Subcommand 0 (ADVANCE - Assault)
// Advance aggressively in assault mode

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "COMBAT";
_playerGrp setSpeedMode "FULL";
_playerGrp setCombatMode "RED";
_playerGrp setFormation "LINE";

_playerGrp move _targetPos;

hint "ADVANCE: Assault";
