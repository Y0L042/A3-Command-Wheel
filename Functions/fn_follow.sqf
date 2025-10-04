private _groupUnits = units group player - [player];
{
    _x commandFollow player;
} forEach _groupUnits;

hint "FOLLOW command issued";