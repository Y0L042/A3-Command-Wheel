// Section 4, Subcommand 3 (STOP - Stealth)
// Stop in stealth mode

private _playerGrp = group player;

// Stop in stealth
_playerGrp setBehaviour "STEALTH";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "BLUE";

{
    _x doMove (getPos _x);
    _x setUnitPos "MIDDLE"; // Crouch for stealth
} forEach (units _playerGrp);

hint "STOP: Stealth Mode";
