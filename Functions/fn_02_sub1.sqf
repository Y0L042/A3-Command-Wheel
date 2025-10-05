// Section 2, Subcommand 1 (FOLLOW - Dispersed)
// Follow player with dispersed formation

private _playerGrp = group player;

// Set follow behavior - dispersed
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";
_playerGrp setFormation "WEDGE";

// Make all units follow player in wedge
{
    _x doFollow player;
    _x setUnitPos "AUTO";
} forEach (units _playerGrp - [player]);

hint "FOLLOW: Dispersed Formation";
