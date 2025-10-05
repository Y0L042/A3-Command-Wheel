// Section 7, Subcommand 3 (ADVANCE - Stealth)
// Advance stealthily

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "STEALTH";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "BLUE";
_playerGrp setFormation "STAG COLUMN";

{
    _x commandMove _targetPos;
    _x setUnitPos "MIDDLE"; // Crouch for stealth
} forEach (units _playerGrp);

hint "ADVANCE: Stealth";
