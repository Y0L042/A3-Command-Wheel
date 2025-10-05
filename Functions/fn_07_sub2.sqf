// Section 7, Subcommand 2 (ADVANCE - Bounding)
// Advance with bounding overwatch (half move, half cover)

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];
private _units = units _playerGrp;
private _halfCount = ceil ((count _units) / 2);

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";

// First half advances
for "_i" from 0 to (_halfCount - 1) do {
    private _unit = _units select _i;
    _unit commandMove _targetPos;
    _unit setUnitPos "AUTO";
};

// Second half provides cover
for "_i" from _halfCount to (count _units - 1) do {
    private _unit = _units select _i;
    _unit commandMove (getPos _unit);
    _unit setUnitPos "MIDDLE";
    _unit doWatch _targetPos;
};

hint "ADVANCE: Bounding Overwatch";
