// Get player's group
private _playerGrp = group player;

// Set group to follow formation
_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "NORMAL";
_playerGrp setCombatMode "YELLOW";

// Make all units follow player
{
    _x doFollow player;
} forEach (units _playerGrp - [player]);

hint "FOLLOW command issued";