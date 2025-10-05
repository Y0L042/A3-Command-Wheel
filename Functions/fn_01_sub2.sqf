// Section 1, Subcommand 2 (FLANK - Wide Left)
// Wide flanking maneuver from the left

private _playerGrp = group player;
private _targetPos = screenToWorld [0.5, 0.5];

// Calculate wide left flank position (120 degrees left, further distance)
private _dir = [player, _targetPos] call BIS_fnc_dirTo;
private _flankDir = _dir - 120;
private _distance = player distance _targetPos;
private _flankPos = _targetPos getPos [_distance * 0.75, _flankDir];

// Set cautious flanking behavior
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "STAG COLUMN";

// Issue move command to wide flank position
_playerGrp move _flankPos;

hint "FLANK: Wide Left";
