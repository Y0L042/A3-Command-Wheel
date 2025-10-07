// Get player's group
private _playerGrp = group player;

// Get target position from screen center
private _targetPos = screenToWorld [0.5, 0.5];

// Set group to aggressive advance behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "FULL";
_playerGrp setCombatMode "RED";
_playerGrp setFormation "LINE"; // Good for advancing

// Issue move command
_playerGrp move _targetPos;

hint "ADVANCE command issued";