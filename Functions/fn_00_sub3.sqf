// Section 0, Subcommand 3 (MOVE - Staggered Column)
// Move to position in staggered column for urban or flanking

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

// Set tactical behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "STAG COLUMN";

// Issue move command
_playerGrp move _targetPos;

hint "MOVE: Staggered Column";
