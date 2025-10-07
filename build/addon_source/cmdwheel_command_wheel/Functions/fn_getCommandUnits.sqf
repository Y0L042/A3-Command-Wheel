/*
 * Helper function to get units that should be commanded
 * Returns selected units if any are selected, otherwise returns all group units except player
 */

params ["_caller"];

// Get selected units (excluding the player)
private _selectedUnits = (groupSelectedUnits _caller) - [_caller];

// If no units are selected, use all group units except player
if (count _selectedUnits == 0) then {
    _selectedUnits = (units group _caller) - [_caller];
};

_selectedUnits
