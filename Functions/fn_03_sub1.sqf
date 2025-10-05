// Section 3, Subcommand 1 (SUPPRESS - Area)
// Suppress fire on area at screen center

private _targetPos = screenToWorld [0.5, 0.5];

{
    _x doSuppressiveFire _targetPos;
} forEach (units group player);

hint "SUPPRESS: Area Fire";
