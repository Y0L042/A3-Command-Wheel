// Section 0, Subcommand 1 (MOVE - Line Formation)
// Move to position in line formation for assault or patrol

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

// Set tactical behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "LINE";

// Issue move command
_playerGrp move _targetPos;

hint "MOVE: Line Formation";
