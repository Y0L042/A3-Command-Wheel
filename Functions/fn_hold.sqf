// Get player's group// private _groupUnits = units group player - [player];

private _playerGrp = group player;// {

//     _x commandStop true;

// Set group to defensive stance// } forEach _groupUnits;

_playerGrp setBehaviour "COMBAT";

_playerGrp setSpeedMode "LIMITED";commandStop (units player);

_playerGrp setCombatMode "RED";

hint "HOLD command issued";
// Command all units to hold position


hint "HOLD command issued";
