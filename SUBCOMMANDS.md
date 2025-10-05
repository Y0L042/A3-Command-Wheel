# Command Wheel Subcommands

## Overview
The command wheel now supports subcommands! When you hold left-click and drag the mouse outside the main command wheel, you'll see 4 subcommand options for each main command.

## How to Use

### Basic Usage
1. Open the command wheel (your configured key)
2. Move mouse away from center (past the deadzone) to select a main command section
3. **Press and hold left-click** to lock the selected command and reveal its subcommands
4. While holding left-click, drag the mouse further out to select a subcommand
5. **Release left-click** to execute the selected command/subcommand

### Important Notes
- Main command selection is **free** when not clicking - just move the mouse
- **Holding left-click locks** the currently selected main command
- While holding click, you can **only** select subcommands of the locked command
- Release click anywhere to execute (main command if not dragged far enough, subcommand if dragged out)

### Visual Layout
- **Inner circle**: Dead zone (no selection)
- **Main ring**: 8 main commands (45° each)
- **Outer ring**: 32 subcommands (4 per main command, 11.25° each)

## Structure

### Main Commands (8 sections)
- Section 0: MOVE
- Section 1: FLANK
- Section 2: FOLLOW
- Section 3: SUPPRESS
- Section 4: STOP
- Section 5: REGROUP
- Section 6: COVER
- Section 7: ADVANCE

### Subcommands (4 per section)
Each main command has 4 subcommands numbered 0-3. For example:
- MOVE (Section 0):
  - Sub 0: Tactical (wedge formation)
  - Sub 1: Fast (urgent pace)
  - Sub 2: Stealth (sneaky movement)
  - Sub 3: Combat (combat ready)

## Customization

### Adding Subcommand Functions
Create function files named: `fn_XX_subY.sqf` where:
- XX = section number (00-07)
- Y = subcommand number (0-3)

Example: `fn_00_sub0.sqf` for MOVE section, first subcommand

### Register in description.ext
Add to CfgFunctions:
```sqf
class 00_sub0 {};
class 00_sub1 {};
// etc...
```

### Custom Code (Advanced)
You can also use mission variables to define custom behavior:
```sqf
// Enable custom subcommand
missionNamespace setVariable ["CMDWHEEL_action0_sub0_enabled", true];

// Set custom code
missionNamespace setVariable ["CMDWHEEL_action0_sub0_code", "systemChat 'Custom Move!'"];
```

## Technical Details

### UI Controls
- Main section highlights: IDC 9010-9017
- Subcommand highlights: IDC 9100-9131 (calculated as 9100 + section*4 + subsection)

### Distance Thresholds (normalized screen coordinates)
- Inner dead zone: < 0.05 (no selection)
- Main command selection: > 0.05 (any distance outside deadzone)
- Subcommand activation: > 0.12 (when left-click is held)

### State Variables
- `CommandWheel_Selected` - Currently selected main section (0-7)
- `CommandWheel_SelectedSub` - Currently selected subsection (0-3)
- `CommandWheel_ShowSubMenu` - Whether submenus are visible
- `CommandWheel_MouseButtonHeld` - Whether left mouse button is held
- `CommandWheel_LockedSection` - Section locked when mouse button pressed

### Files Modified
- `UI/CommandWheel.hpp` - Added 32 subcommand highlight controls
- `Functions/fn_wheelLoop.sqf` - Added subcommand detection logic
- `Functions/fn_wheelClick.sqf` - Added subcommand execution logic
- `Functions/fn_load.sqf` - Updated event handlers for subcommands
- `description.ext` - Registered subcommand functions

## Complete Subcommands

All 32 subcommands (8 sections × 4 subcommands each) have been implemented using official Arma 3 scripting commands. Each subcommand provides tactical variations of the main command.

**See SUBCOMMANDS_REFERENCE.md for complete documentation of all subcommands.**

### Implemented Sections:
- **Section 0 (MOVE)**: Different formations (Wedge, Line, Column, Stag Column)
- **Section 1 (FLANK)**: Flanking maneuvers (Left, Right, Wide Left, Wide Right)
- **Section 2 (FOLLOW)**: Follow modes (Close, Dispersed, Stealth, Combat)
- **Section 3 (SUPPRESS)**: Suppression options (Target, Area, Nearest, Watch)
- **Section 4 (STOP)**: Stop variants (Hold, Cover, Crouch, Stealth)
- **Section 5 (REGROUP)**: Rally options (On Me, Rally Point, Nearest, Formation)
- **Section 6 (COVER)**: Cover types (Suppressive, Defensive, Watch, Overwatch)
- **Section 7 (ADVANCE)**: Advance tactics (Assault, Tactical, Bounding, Stealth)

### Behavior Notes:
- Subcommands are **locked** when you press mouse button - they won't cycle as you move the mouse
- The angle when you first press determines which subcommand is selected
- This prevents accidental selection changes while dragging

## Graphics

The subcommand graphics are located in:
- `Data/command_wheel_sub_X_Y.paa` - Compiled textures
- `CommandWheelPy/command_wheel_sub_X_Y.png` - Source images

Where X = section (0-7) and Y = subsection (0-3)
