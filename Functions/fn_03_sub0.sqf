// Section 3, Subcommand 0 (SUPPRESS - Target)
// Suppress fire on cursor target

private _target = cursorTarget;

if (!isNull _target) then {
    {
        _x doSuppressiveFire _target;
    } forEach (units group player);
    
    hint format ["SUPPRESS: Firing on %1", getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName")];
} else {
    hint "SUPPRESS: No target detected";
};
