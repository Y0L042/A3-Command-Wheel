// Get player's group
private _playerGrp = group player;

// Get target position from screen center
private _targetPos = screenToWorld [0.5, 0.5];

// Set group to tactical behavior for flanking
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "FULL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "STAG COLUMN"; // Good for flanking

// Issue move command
_playerGrp move _targetPos;

hint "FLANK command issued";