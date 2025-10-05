// Section 1, Subcommand 1 (FLANK - Right)
// Flank target from the right side

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

// Calculate right flank position (90 degrees right)
private _dir = [player, _targetPos] call BIS_fnc_dirTo;
private _flankDir = _dir + 90;
private _distance = player distance _targetPos;
private _flankPos = _targetPos getPos [_distance * 0.5, _flankDir];

// Set aggressive flanking behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "FULL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "STAG COLUMN";

// Issue move command to flank position
_playerGrp move _flankPos;

hint "FLANK: Right Side";
