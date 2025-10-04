private _groupUnits = units group player - [player];
{
    _x doFollow player;
} forEach _groupUnits;

hint "REGROUP command issued";