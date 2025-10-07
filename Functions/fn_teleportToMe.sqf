/*
 * Implementation: fn_teleportToMe.sqf
 *
 * Add your command logic here
 */
params ["_caller"];

hint "Teleport to me";

private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;
// Exit if no units to command
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

private _leaderPos = getPos player;
private _leaderDir = getDir player;

{
    // Cancel any existing commands and reset state
    _x doFollow player;
    _x setSpeedMode "FULL";
    _x setBehaviour "AWARE";
    _x setCombatMode "YELLOW";
    _x enableAI "AUTOCOMBAT";
    _x enableAI "SUPPRESSION";
    _x enableAI "MOVE";
    _x enableAI "TARGET";
    _x enableAI "AUTOTARGET";
    
    // Teleport to formation around player
    private _angle = 360 / (count _groupUnits) * _forEachIndex;
    private _distance = 2 + (floor (_forEachIndex / 8)) * 2;
    
    private _offsetX = _distance * sin(_leaderDir + _angle);
    private _offsetY = _distance * cos(_leaderDir + _angle);
    
    private _newPos = _leaderPos vectorAdd [_offsetX, _offsetY, 0];
    
    _x setPosATL _newPos;
    _x setDir (_leaderDir + _angle);
    
} forEach _groupUnits;

hint "Squad teleported and following";
systemChat format ["Command %1 called by %2", "fn_teleportToMe.sqf", name _caller];