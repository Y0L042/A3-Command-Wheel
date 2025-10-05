// Section 7, Subcommand 1 (ADVANCE - Tactical)
// Advance tactically with caution

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "WEDGE";

_playerGrp move _targetPos;

hint "ADVANCE: Tactical";
