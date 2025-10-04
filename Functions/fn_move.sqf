private _groupUnits = units group player - [player];
{
    _x commandMove (screenToWorld [0.5, 0.5]);
} forEach _groupUnits;

hint "MOVE command issued";