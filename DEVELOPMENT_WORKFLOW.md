# Development Workflow

## Overview

This project uses a **mission-first development** approach. You develop and test directly in the mission folder, then build to a standalone mod when ready for distribution.

## How It Works

### The Key Insight

Mission files use **mod-style absolute paths** like `\cmdwheel_command_wheel\Functions\fn_load.sqf`, but these paths work in **both contexts**:

1. **In Mission:** Arma resolves paths relative to the mission folder
   - `\cmdwheel_command_wheel\Functions\fn_load.sqf` → `Sandbox.SPE_Mortain/Functions/fn_load.sqf`

2. **In Mod:** Arma resolves paths relative to the PBO root
   - `\cmdwheel_command_wheel\Functions\fn_load.sqf` → `cmdwheel_command_wheel.pbo/Functions/fn_load.sqf`

This means **one codebase works for both** mission testing and mod distribution!

## Development Workflow

### Daily Development (Mission Testing)

**1. Edit source files** in `Sandbox.SPE_Mortain/`
   - Functions in `Functions/`
   - UI dialogs in `UI/`
   - Graphics in `Data/`
   - Configuration in `description.ext`, `config.cpp`, `XEH_preInit.sqf`

**2. Test in Eden Editor:**
   - Open `Sandbox.SPE_Mortain.SPE_Mortain` in Eden Editor
   - Preview mission
   - Press User20 to open command wheel
   - Use debug console for testing

**3. Iterate quickly:**
   - Make changes to `.sqf` files
   - Preview mission again (changes load immediately)
   - No need to rebuild anything!

### Building for Distribution

When you're ready to distribute as a mod:

**1. Run the build script:**
```powershell
make build
```

Or directly:
```powershell
cd CommandWheelPy
uv run build.py
```

**2. Output:** `build/@cmdwheel/`
```
build/@cmdwheel/
├── mod.cpp                    # Mod metadata
├── meta.cpp                   # Steam Workshop metadata
├── README.txt                 # User instructions
└── addons/
    └── cmdwheel_command_wheel.pbo  # Compiled addon
```

**3. Test the mod:**
- Copy `build/@cmdwheel/` to your Arma 3 directory
- Enable in Arma 3 Launcher
- Test in any mission

**4. Publish:**
- If everything works, publish to Steam Workshop
- See [BUILD_AND_PUBLISH.md](BUILD_AND_PUBLISH.md) for details

## File Structure

### Source Files (Mission Folder)
```
Sandbox.SPE_Mortain/
├── mission.sqm               # Mission file
├── description.ext           # Mission config + CfgFunctions
├── config.cpp                # Addon config (for mod build)
├── init.sqf                  # Mission initialization
├── XEH_preInit.sqf          # CBA settings
├── $PBOPREFIX$              # PBO path: \cmdwheel_command_wheel
├── Data/                     # Graphics (.paa files)
├── UI/                       # Dialog definitions (.hpp)
│   ├── BaseControls.hpp
│   └── CommandWheel.hpp
├── Functions/                # SQF scripts (.sqf)
│   ├── fn_load.sqf
│   ├── fn_unload.sqf
│   ├── fn_wheelLoop.sqf
│   └── ... (all command functions)
└── CommandWheelPy/          # Build tools (Python)
    ├── build.py             # Main build script
    ├── generate_all.py      # Generate UI/commands
    └── ...
```

### Key Files Explained

**`description.ext`**
- Used by mission for CfgFunctions and dialog includes
- Includes UI files: `#include "UI\CommandWheel.hpp"`
- Defines functions with mod paths: `file = "\cmdwheel_command_wheel\Functions";`

**`config.cpp`**
- Used by mod build for CfgPatches, CfgFunctions, dialogs
- Includes UI files: `#include "\cmdwheel_command_wheel\UI\CommandWheel.hpp"`
- Defines initialization, dependencies, version

**`$PBOPREFIX$`**
- Contains: `\cmdwheel_command_wheel`
- Tells Arma how to resolve absolute paths in the PBO
- Critical for mod build to work correctly

**`UI/CommandWheel.hpp`**
- Dialog definitions with image paths
- Uses mod-style paths: `text = "\cmdwheel_command_wheel\data\command_wheel.paa";`
- Works in both mission and mod contexts

**`Functions/*.sqf`**
- SQF function scripts
- Called via CBA function framework: `CMDWHEEL_fnc_load`, etc.
- No special path handling needed

## Path Resolution Examples

### In Mission Context

File: `UI/CommandWheel.hpp`
```cpp
text = "\cmdwheel_command_wheel\data\command_wheel.paa";
```

Arma resolves to:
```
E:\vlamf\Documents\Arma 3\missions\Sandbox.SPE_Mortain\data\command_wheel.paa
```

### In Mod Context

Same file in compiled PBO:
```cpp
text = "\cmdwheel_command_wheel\data\command_wheel.paa";
```

Arma resolves to:
```
@cmdwheel\addons\cmdwheel_command_wheel.pbo\data\command_wheel.paa
```

The **same code** works in both places!

## Common Commands

### Build Commands
```powershell
# Generate all UI/commands/settings
make generate_all

# Build mod (PBO)
make build

# Generate + Build
make generate_and_build

# Individual generators
make generate_wheel      # Command wheel graphics
make generate_ui         # UI dialogs
make generate_commands   # Command functions
make generate_preinit    # CBA settings
```

### Quick Development Loop
```powershell
# 1. Make changes to source files
# 2. Preview in Eden Editor (Ctrl+S to save mission, Preview)
# 3. Test command wheel (User20 key)
# 4. Repeat!
```

### Publishing Workflow
```powershell
# 1. Generate all assets
make generate_all

# 2. Build mod
make build

# 3. Test locally
# Copy build/@cmdwheel/ to Arma 3 directory
# Test in game

# 4. Publish to Steam Workshop
# See BUILD_AND_PUBLISH.md
```

## Advantages of This Approach

✅ **Fast iteration:** Edit → Preview, no build step
✅ **Single codebase:** No syncing between mission/mod versions
✅ **Debug console:** Full testing tools available in mission mode
✅ **Version control friendly:** Mission folder is your source of truth
✅ **Simple mental model:** Develop in mission, build to mod

## Build Script Details

`CommandWheelPy/build.py` performs these steps:

1. **Copy files** to `build/addon_source/cmdwheel_command_wheel/`:
   - `$PBOPREFIX$`
   - `config.cpp` (mod configuration)
   - `description.ext` (for reference)
   - `XEH_preInit.sqf` (CBA settings)
   - `Data/` (graphics)
   - `UI/` (dialogs)
   - `Functions/` (scripts)

2. **Run AddonBuilder** to compile PBO:
   - Input: `build/addon_source/cmdwheel_command_wheel/`
   - Output: `build/pbo/cmdwheel_command_wheel.pbo`

3. **Create mod structure** at `build/@cmdwheel/`:
   - Copy PBO to `addons/`
   - Generate `mod.cpp` (mod metadata)
   - Generate `meta.cpp` (Steam Workshop)
   - Create `README.txt` (user guide)

## Troubleshooting

### Issue: Functions not found in mission
**Cause:** CfgFunctions not loading properly
**Fix:** Check `description.ext` has correct function definitions

### Issue: Images not showing in mission
**Cause:** Paths incorrect or PAA files missing
**Fix:**
- Verify paths in `UI/CommandWheel.hpp` use `\cmdwheel_command_wheel\data\`
- Ensure PAA files exist in `Data/` folder
- Check file names match exactly (case-sensitive)

### Issue: Mod build fails
**Cause:** AddonBuilder not found or config errors
**Fix:**
- Update `ARMA3_TOOLS_PATH` in `CommandWheelPy/build.py`
- Check for syntax errors in `config.cpp`
- Verify $PBOPREFIX$ contains `\cmdwheel_command_wheel`

### Issue: Mod loads but nothing works
**Cause:** PBO prefix mismatch
**Fix:**
- Verify `$PBOPREFIX$` file contains: `\cmdwheel_command_wheel`
- Check all absolute paths start with `\cmdwheel_command_wheel\`
- Rebuild: `make build`

### Issue: Changes not appearing
**In mission:** Save mission and preview again
**In mod:** Must rebuild PBO (`make build`) and restart Arma 3

## Best Practices

1. **Develop in mission** for fast iteration
2. **Test thoroughly in mission** before building mod
3. **Build mod only when ready** for distribution or full testing
4. **Use version control** (git) to track changes
5. **Update version numbers** before publishing
6. **Test mod build** before publishing to Steam Workshop
7. **Keep documentation updated** as features change

## Additional Resources

- [BUILD_AND_PUBLISH.md](BUILD_AND_PUBLISH.md) - Publishing to Steam Workshop
- [MOD_STRUCTURE.md](MOD_STRUCTURE.md) - Detailed mod structure info
- [CONVERSION_CHECKLIST.md](CONVERSION_CHECKLIST.md) - Mission to mod conversion notes

## Quick Reference

| Task | Command | Speed |
|------|---------|-------|
| Test changes | Preview in Eden | ⚡ Instant |
| Build mod | `make build` | 🐌 ~10 seconds |
| Generate assets | `make generate_all` | ⚙️ ~5 seconds |
| Full workflow | `make generate_and_build` | ⚙️ ~15 seconds |

**Tip:** Use mission testing for rapid development, build to mod only when publishing or testing with other mods.
