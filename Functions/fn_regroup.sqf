private _groupUnits = units group player - [player];
{
    _x doFollow player;
} forEach _groupUnits;

closeDialog 0;
hint "REGROUP command issued";