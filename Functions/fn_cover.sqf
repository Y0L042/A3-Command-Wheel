// Get player's group
private _playerGrp = group player;

// Set group to cover/suppression mode
_playerGrp setBehaviour "COMBAT";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "RED";

// Make units take cover at current position
private _targetPos = screenToWorld [0.5, 0.5];
{
    _x commandMove _targetPos;
    _x setUnitPos "DOWN"; // Go prone for cover
} forEach (units _playerGrp);

hint "COVER command issued";