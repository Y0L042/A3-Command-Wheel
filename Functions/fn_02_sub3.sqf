// Section 2, Subcommand 3 (FOLLOW - Combat)
// Follow player in combat ready mode

private _playerGrp = group player;

// Set combat follow behavior
_playerGrp setBehaviour "COMBAT";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "RED";
_playerGrp setFormation "LINE";

// Make all units follow player combat ready
{
    _x doFollow player;
    _x setUnitPos "AUTO";
} forEach (units _playerGrp - [player]);

hint "FOLLOW: Combat Ready";
