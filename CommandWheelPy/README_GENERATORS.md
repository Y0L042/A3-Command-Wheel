# Command Wheel Generator Scripts - README

## Overview
The Command Wheel system now has automated generation scripts that read from `commands.py` to generate all necessary files. This ensures consistency across all components.

## Generation Scripts

### 1. `commands.py`
**The single source of truth** - Define all your commands here!

Structure:
```python
COMMANDS = {
    0: {  # Section number (0-7)
        "name": "Hold",  # Display name
        "hint": "hint 'Hold'",  # In-game hint
        "command": "fn_hold.sqf",  # Function to call
        "subs": {  # Subcommands (optional)
            0: {
                "name": "Regroup",
                "hint": "hint 'Regroup'",
                "command": "fn_regroup.sqf"
            }
        }
    }
}
```

### 2. `generate_commands.py`
Generates wrapper functions for all commands:
- Main wrappers: `fn_00.sqf`, `fn_01.sqf`, etc.
- Sub wrappers: `fn_00_0.sqf`, `fn_00_1.sqf`, etc.
- Stub implementations for actual command logic

**Run:** `uv run generate_commands.py`

### 3. `generate_ui.py`
Generates the UI configuration file `CommandWheel.hpp`:
- Reads label names from `commands.py`
- Creates all visual elements (highlights, labels)
- Positions labels at correct angles and distances

**Run:** `uv run generate_ui.py`

**Configuration:**
Edit the constants at the top of `generate_ui.py` to adjust:
- Label positions and sizes
- Font sizes
- Colors
- Angles and offsets

### 4. `generate_preinit.py` ✨ NEW
Generates the CBA settings file `XEH_preInit.sqf`:
- Creates settings for all main sections
- Creates settings for all subcommands
- Uses correct label names from `commands.py`

**Run:** `uv run generate_preinit.py`

**Note:** The file `XEH_preInit.sqf` must be closed in your editor before running this script.

### 5. `generate_all.py` ✨ NEW
Master script that runs all generators in the correct order:
1. Generate command wrappers
2. Generate UI configuration
3. Generate CBA settings

**Run:** `uv run generate_all.py`

This is the **recommended way** to regenerate everything at once.

## Workflow

### To Add or Modify Commands:

1. **Edit `commands.py`** - Update the COMMANDS dictionary
2. **Run generator:** `uv run generate_all.py`
3. **Reload mission** in Arma 3 to see changes

### What Gets Updated Automatically:

✅ Function wrapper files (`fn_XX.sqf`, `fn_XX_Y.sqf`)
✅ UI labels in the wheel (`CommandWheel.hpp`)
✅ CBA settings with correct names (`XEH_preInit.sqf`)
✅ Label text updates at runtime (`fn_load.sqf` reads CBA settings)

### What You Need to Implement:

- The actual command logic files (e.g., `fn_hold.sqf`, `fn_regroup.sqf`)
- These are generated as stubs but you need to add the actual implementation

## Label Update System

The system has **two levels** of label customization:

1. **Default labels** (from `commands.py`)
   - Defined in your COMMANDS dictionary
   - Baked into `CommandWheel.hpp` at generation time
   - Shown in the wheel immediately

2. **Custom labels** (from CBA settings)
   - Defined by users in CBA settings menu
   - Override default labels at runtime
   - Applied when the wheel opens (`fn_load.sqf`)

## Files Modified by Generators

| File | Modified By | Purpose |
|------|-------------|---------|
| `Functions/fn_XX.sqf` | `generate_commands.py` | Main command wrappers |
| `Functions/fn_XX_Y.sqf` | `generate_commands.py` | Subcommand wrappers |
| `UI/CommandWheel.hpp` | `generate_ui.py` | UI configuration with labels |
| `XEH_preInit.sqf` | `generate_preinit.py` | CBA settings |

## Important Notes

⚠️ **Do not manually edit generated files** - They will be overwritten!
- Wrappers (`fn_XX.sqf`, `fn_XX_Y.sqf`) - Always regenerated
- Implementation files (`fn_hold.sqf`, etc.) - Safe to edit
- `CommandWheel.hpp` - Always regenerated
- `XEH_preInit.sqf` - Always regenerated

✅ **Edit these files:**
- `commands.py` - Your command definitions
- `fn_XXX.sqf` - Your implementation files (not wrappers)
- `generate_*.py` - Configuration constants

## Current Command Structure

From your `commands.py`:

**Section 0 - Hold:**
- Sub 0: Regroup
- Sub 1: Move there
- Sub 2: GoGoGo!
- Sub 3: Teleport to me

**Section 1 - Stealth & Hold Fire:**
- Sub 0: Prone
- Sub 1: Get Up
- Sub 2: Match my stance
- Sub 3: Find cover

**Section 2 - Suppressive fire:**
- Sub 0: Forced suppressive fire
- Sub 1: Target enemy
- Sub 2: Heal soldier
- Sub 3: Disengage

**Section 3 - Column:**
- Sub 0: Staggered column
- Sub 1: Wedge
- Sub 2: File
- Sub 3: Line

**Sections 4-7:** Currently undefined (add them to `commands.py`!)
