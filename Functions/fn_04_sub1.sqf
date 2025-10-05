// Section 4, Subcommand 1 (STOP - Take Cover)
// Stop and take cover (prone)

private _playerGrp = group player;

// Stop and go prone
_playerGrp setBehaviour "COMBAT";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "RED";

{
    _x doMove (getPos _x);
    _x setUnitPos "DOWN"; // Prone
} forEach (units _playerGrp);

hint "STOP: Taking Cover (Prone)";
