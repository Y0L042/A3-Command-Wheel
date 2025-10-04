// Get player's group
private _playerGrp = units player;

// Get target position from screen center
private _targetPos = screenToWorld [0.5, 0.5];

// Issue group move command
_playerGrp doMove _targetPos;

hint "MOVE command issued";