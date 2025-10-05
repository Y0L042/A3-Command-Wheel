// Section 5, Subcommand 0 (REGROUP - On Me)
// Regroup all units on player position

private _playerGrp = group player;
private _playerPos = getPos player;

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "FULL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "WEDGE";

{
    _x doMove _playerPos;
} forEach (units _playerGrp - [player]);

hint "REGROUP: On Me";
