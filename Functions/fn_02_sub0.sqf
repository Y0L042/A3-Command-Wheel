// Section 2, Subcommand 0 (FOLLOW - Close)
// Follow player at close distance

private _playerGrp = group player;

// Set follow behavior - close distance
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "COLUMN";

// Make all units follow player closely
{
    _x doFollow player;
    _x setUnitPos "AUTO";
} forEach (units _playerGrp - [player]);

hint "FOLLOW: Close Formation";
