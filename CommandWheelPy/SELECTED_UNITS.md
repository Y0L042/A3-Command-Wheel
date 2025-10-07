# Updating Commands to Work with Selected Units

## What Changed

All command functions now support **unit selection**:
- If you have units selected (F1-F12, or Team colors), only those units will execute the command
- If no units are selected, all group units (except player) will execute the command

## New Helper Function

**`fn_getCommandUnits.sqf`** - Returns the units that should execute the command
```sqf
// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

// Always check if there are units
if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};
```

## How to Update Your Other Functions

Replace this pattern:
```sqf
private _groupUnits = units group player - [player];
```

With this pattern:
```sqf
// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};
```

## Already Updated Functions

✅ `fn_garrison.sqf`
✅ `fn_moveThere.sqf`
✅ `fn_regroup.sqf`
✅ `fn_prone.sqf`

## Functions That Need Updating

Apply the same pattern to these files:

- `fn_hold.sqf`
- `fn_gogogo.sqf`
- `fn_teleportToMe.sqf`
- `fn_getUp.sqf`
- `fn_matchStance.sqf`
- `fn_findCover.sqf`
- `fn_stealthHoldFire.sqf`
- `fn_forcedSuppressiveFire.sqf`
- `fn_targetEnemy.sqf`
- `fn_healSoldier.sqf`
- `fn_disengage.sqf`
- `fn_staggeredColumn.sqf`
- `fn_wedge.sqf`
- `fn_file.sqf`
- `fn_line.sqf`
- `fn_column.sqf`
- `fn_suppressiveFire.sqf`

## Example: Before and After

### Before (fn_getUp.sqf):
```sqf
params ["_caller"];

hint "Get Up";

private _groupUnits = units group player - [player];

{
    _x setUnitPos "AUTO";
} forEach _groupUnits;
```

### After (fn_getUp.sqf):
```sqf
params ["_caller"];

hint "Get Up";

// Get units to command (selected units or all group units)
private _groupUnits = [_caller] call CMDWHEEL_fnc_getCommandUnits;

if (count _groupUnits == 0) exitWith {
    hint "No units to command";
};

{
    _x setUnitPos "AUTO";
} forEach _groupUnits;
```

## How to Use in Game

### Select Specific Units:
1. Press **F1-F12** to select individual units
2. Press **F1, F1** to select Team Red
3. Press **F2, F2** to select Team Green
4. Press **F3, F3** to select Team Blue
5. Press **F4, F4** to select Team Yellow

### Execute Command:
1. Open command wheel (User20 key)
2. Select command
3. Only selected units will execute

### Select All Units:
- Don't select anyone - command wheel will affect all group units

## Benefits

✅ Fine-grained control over which units execute commands
✅ Can split your team for different tasks
✅ Backwards compatible (no selection = all units)
✅ Works with F-key selection and team colors
✅ Consistent behavior across all commands

## Technical Details

The `groupSelectedUnits` command returns units currently selected in the group interface:
- Returns an array of selected units
- Empty array if no units selected
- Includes the player if player is selected (we filter this out)

Our helper function handles both cases automatically!
