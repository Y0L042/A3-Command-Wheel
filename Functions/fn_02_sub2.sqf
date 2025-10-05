// Section 2, Subcommand 2 (FOLLOW - Stealth)
// Follow player in stealth mode

private _playerGrp = group player;

// Set stealth follow behavior
_playerGrp setBehaviour "STEALTH";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "BLUE";
_playerGrp setFormation "STAG COLUMN";

// Make all units follow player stealthily
{
    _x doFollow player;
    _x setUnitPos "MIDDLE"; // Crouch
} forEach (units _playerGrp - [player]);

hint "FOLLOW: Stealth Mode";
