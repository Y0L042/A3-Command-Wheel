// Section 4, Subcommand 2 (STOP - Crouch)
// Stop and crouch

private _playerGrp = group player;

// Stop and crouch
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "YELLOW";

{
    _x doMove (getPos _x);
    _x setUnitPos "MIDDLE"; // Crouch
} forEach (units _playerGrp);

hint "STOP: Crouching";
