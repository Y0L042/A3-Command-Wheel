# Build System Documentation

## Overview

The build script (`build.py`) converts your Command Wheel mission files into a standalone Arma 3 mod that can be distributed and installed independently.

## Directory Structure

### Before Build:
```
Sandbox.SPE_Mortain/              (Mission root)
├── CommandWheelPy/               (Python scripts - NOT included in build)
│   └── build.py                  (Build script)
├── Data/                         (✓ Included in build)
├── Functions/                    (✓ Included in build)
├── UI/                           (✓ Included in build)
├── config.cpp                    (✓ Included in build)
├── description.ext               (✓ Included in build)
├── XEH_preInit.sqf              (✓ Included in build)
├── init.sqf                      (✓ Included in build)
├── mission.sqm                   (✗ NOT included - mission specific)
└── Examples/                     (✗ NOT included - documentation)
```

### After Build:
```
Sandbox.SPE_Mortain/
└── build/                        (Created by build script)
    ├── addon_source/             (Intermediate - source files for PBO)
    │   └── cmdwheel_command_wheel/
    │       ├── Data/
    │       ├── Functions/
    │       ├── UI/
    │       ├── config.cpp
    │       ├── description.ext
    │       ├── XEH_preInit.sqf
    │       └── init.sqf
    ├── pbo/                      (Intermediate - compiled PBO)
    │   └── cmdwheel_command_wheel.pbo
    └── @cmdwheel/                (FINAL MOD - ready to distribute)
        ├── addons/
        │   └── cmdwheel_command_wheel.pbo
        ├── mod.cpp
        └── README.txt
```

## What Gets Included

### ✅ Included in Build:
- **Data/** - All .paa texture files for the command wheel graphics
- **Functions/** - All .sqf script files (fn_*.sqf)
- **UI/** - All UI configuration files (.hpp)
- **config.cpp** - Addon configuration and patches
- **description.ext** - Function definitions and class configurations
- **XEH_preInit.sqf** - CBA settings definitions
- **init.sqf** - Initialization script (adds action to open wheel)

### ❌ NOT Included in Build:
- **mission.sqm** - Mission-specific file (terrain, units, objectives)
- **CommandWheelPy/** - Python generation scripts (dev tools)
- **.git/** - Version control data
- **.vscode/** - Editor settings
- **Examples/** - Documentation and example files
- **build/** - Build output directory (no recursive copying)

## How to Build

### Requirements:
1. **Arma 3 Tools** installed from Steam
2. **Python** (for running the build script)
3. Update `ARMA3_TOOLS_PATH` in `build.py` to match your installation

### Build Commands:

```bash
# From CommandWheelPy directory:
cd CommandWheelPy
python build.py

# Or using uv:
uv run build.py
```

### Build Process:
1. **Validates** Arma 3 Tools installation
2. **Cleans** previous build directories
3. **Copies** source files to `build/addon_source/`
4. **Compiles** PBO using AddonBuilder
5. **Creates** @cmdwheel mod structure
6. **Generates** mod.cpp and README.txt

## Configuration

Edit these variables in `build.py`:

```python
# Arma 3 Tools paths
ARMA3_TOOLS_PATH = r"G:\\Steam\\steamapps\\common\\Arma 3 Tools"

# Addon information
ADDON_PREFIX = "cmdwheel"              # @cmdwheel
ADDON_NAME = "command_wheel"           # PBO name
FULL_ADDON_NAME = "cmdwheel_command_wheel"  # Final PBO name

# Build options
BINARIZE = True  # Set to False for faster development builds
```

## Installation (After Build)

### Option 1: Local Testing
```
1. Navigate to: Sandbox.SPE_Mortain/build/@cmdwheel/
2. Copy entire @cmdwheel folder
3. Paste into your Arma 3 directory
4. Launch Arma 3
5. Enable @cmdwheel in the launcher
```

### Option 2: Distribution
```
1. Zip the @cmdwheel folder
2. Share with others
3. They extract to their Arma 3 directory
4. Enable in launcher
```

## Output Files

### build/addon_source/
Intermediate source files prepared for PBO compilation.
Safe to delete after successful build.

### build/pbo/
Contains the compiled .pbo file.
Safe to delete after successful build (it's copied to @cmdwheel).

### build/@cmdwheel/ ⭐
**This is the final, distributable mod!**
- Ready to copy to Arma 3
- Ready to distribute
- Contains everything needed

## Troubleshooting

### "AddonBuilder not found"
- Install Arma 3 Tools from Steam
- Update `ARMA3_TOOLS_PATH` in build.py

### "Build failed"
- Check AddonBuilder output in console
- Verify all source files exist
- Check for syntax errors in .sqf files

### "Mod doesn't load in game"
- Verify CBA_A3 is installed and enabled
- Check RPT log file for errors
- Ensure mod is enabled in launcher

## Development Workflow

### Standard Workflow:
```
1. Edit functions/UI in mission folder
2. Test in mission (preview in editor)
3. Run build.py when ready to test as mod
4. Copy @cmdwheel to Arma 3
5. Test in full game environment
```

### Quick Development:
```
# For faster iteration, disable binarization:
BINARIZE = False  # in build.py

# This skips compression, making builds much faster
# Use for testing, re-enable for final release
```

## What Makes This a Mod vs Mission

### Mission Mode (Current Files):
- Loaded per-mission
- Only works in specific mission file
- mission.sqm defines the scenario

### Mod Mode (After Build):
- Loaded globally with Arma 3
- Works in any mission/scenario
- No mission.sqm needed
- Command wheel available everywhere

## File Size Expectations

Typical build sizes:
- Source files: ~500KB - 2MB
- Compiled PBO: ~300KB - 1MB
- @cmdwheel folder: ~300KB - 1MB

If significantly larger, you may be including extra files.

## Clean Build

To force a complete rebuild:
```bash
# Delete build directory
rm -rf ../build/

# Run build again
python build.py
```

The script automatically cleans intermediate directories, but you can manually delete `build/` if needed.

## Advanced: Manual PBO Creation

If you need to manually create the PBO:

```bash
# Using AddonBuilder GUI:
1. Open AddonBuilder.exe
2. Source: Sandbox.SPE_Mortain/build/addon_source/cmdwheel_command_wheel/
3. Destination: Sandbox.SPE_Mortain/build/pbo/
4. Click "Pack"

# The GUI shows more detailed progress and errors
```

## Version Control

Add to your `.gitignore`:
```
build/
*.pbo
*.pbo.*
```

The build output should not be committed to version control. Only commit source files.
