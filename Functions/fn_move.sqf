private _groupUnits = units group player - [player];
{
    _x commandMove (screenToWorld [0.5, 0.5]);
} forEach _groupUnits;

closeDialog 0;
hint "MOVE command issued";