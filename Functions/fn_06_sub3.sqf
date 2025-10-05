// Section 6, Subcommand 3 (COVER - Overwatch)
// Take overwatch position at current location

private _playerGrp = group player;

_playerGrp setBehaviour "AWARE";
_playerGrp setSpeedMode "LIMITED";
_playerGrp setCombatMode "YELLOW";

{
    private _pos = getPos _x;
    _x commandMove _pos; // Stop in place
    _x setUnitPos "MIDDLE"; // Crouch
    
    // Look forward
    private _dir = getDir player;
    private _watchPos = _x getPos [200, _dir];
    _x doWatch _watchPos;
} forEach (units _playerGrp);

hint "COVER: Overwatch";
