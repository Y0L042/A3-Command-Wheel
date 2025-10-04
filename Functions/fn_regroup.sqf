// Get player's group
private _playerGrp = group player;
private _leader = leader _playerGrp;

// Make all units follow the leader (regroup)
{
    _x doFollow _leader;
} forEach (units _playerGrp - [_leader]);

hint "REGROUP command issued";