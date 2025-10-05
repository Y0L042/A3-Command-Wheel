// Section 5, Subcommand 3 (REGROUP - Formation)
// Regroup and reform in wedge formation

private _playerGrp = group player;
private _playerPos = getPos player;

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "WEDGE";

// Make everyone follow and reform
{
    _x doFollow player;
} forEach (units _playerGrp - [player]);

hint "REGROUP: Reforming";
