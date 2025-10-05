// Section 0, Subcommand 2 (MOVE - Column Formation)
// Move to position in column formation for roads or confined spaces

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

// Set tactical behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "COLUMN";

// Issue move command
_playerGrp move _targetPos;

hint "MOVE: Column Formation";
