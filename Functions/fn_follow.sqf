private _groupUnits = units group player - [player];
{
    _x commandFollow player;
} forEach _groupUnits;

closeDialog 0;
hint "FOLLOW command issued";