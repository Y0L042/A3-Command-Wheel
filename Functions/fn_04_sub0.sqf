// Section 4, Subcommand 0 (STOP - Hold Position)
// Stop and hold current position

private _playerGrp = group player;

// Stop movement
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "YELLOW";

{
    _x doMove (getPos _x);
    _x setUnitPos "AUTO";
} forEach (units _playerGrp);

hint "STOP: Holding Position";
