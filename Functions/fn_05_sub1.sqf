// Section 5, Subcommand 1 (REGROUP - Rally Point)
// Regroup at designated rally point (screen center)

private _playerGrp = group player;
private _rallyPos = screenToWorld [0.5, 0.5];

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "FULL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "WEDGE";

{
    _x doMove _rallyPos;
} forEach (units _playerGrp);

hint "REGROUP: Rally Point Set";
