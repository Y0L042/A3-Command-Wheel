/*
 * Implementation: fn_gogogo.sqf
 *
 * Add your command logic here
 */
params ["_caller"];

hint "GoGoGo";

private _groupUnits = units group player - [player];
private _aimPos = screenToWorld [0.5, 0.5];

{
    _x doMove _aimPos;
    _x setSpeedMode "FULL";
    _x setBehaviour "CARELESS";
    _x setUnitPos "UP";
    _x setCombatMode "BLUE"; // Hold fire
    _x disableAI "AUTOCOMBAT";
    _x disableAI "SUPPRESSION";
    
    // Wait for unit to reach position, then restore AI
    [_x, _aimPos] spawn {
        params ["_unit", "_targetPos"];
        
        waitUntil {sleep 1; (_unit distance _targetPos < 10) || !alive _unit};
        
        if (alive _unit) then {
            _unit setBehaviour "AWARE";
            _unit setCombatMode "YELLOW";
            _unit enableAI "AUTOCOMBAT";
            _unit enableAI "SUPPRESSION";
        };
    };
} forEach _groupUnits;

systemChat format ["Command %1 called by %2", "fn_gogogo.sqf", name _caller];