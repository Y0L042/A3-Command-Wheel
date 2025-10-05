// Section 0, Subcommand 0 (MOVE - Wedge Formation)
// Move to position in wedge formation for tactical advancement

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

// Set tactical behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "WEDGE";

// Issue move command
_playerGrp move _targetPos;

hint "MOVE: Wedge Formation";
