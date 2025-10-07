# Command Wheel - Mod Structure Documentation

## Overview
This document explains the proper Arma 3 addon/mod structure for the Command Wheel project following Bohemia Interactive's official guidelines.

## Directory Structure

```
Sandbox.SPE_Mortain/                    # Project root
│
├── $PREFIX$                            # Contains "cmdwheel" - defines mod prefix
├── $PBOPREFIX$                         # Contains "x\cmdwheel\addons\command_wheel"
│                                       # Defines the P: drive path for the addon
│
├── config.cpp                          # Main addon configuration (CfgPatches, etc.)
├── description.ext                     # Function definitions
├── XEH_preInit.sqf                     # CBA Extended Event Handlers pre-init
├── init.sqf                            # Initialization script
│
├── Data/                               # Graphics and textures (.paa files)
│   ├── command_wheel.paa
│   ├── command_wheel_section_*.paa
│   └── ...
│
├── UI/                                 # User interface definitions
│   ├── defines.hpp
│   ├── CommandWheel.hpp
│   └── ...
│
├── Functions/                          # SQF function files
│   ├── fn_00.sqf
│   ├── fn_00_0.sqf
│   └── ...
│
├── CommandWheelPy/                     # Python build tools (NOT included in PBO)
│   ├── build.py                        # Main build script
│   ├── generate_all.py
│   └── ...
│
└── build/                              # Build output directory
    ├── addon_source/                   # Temporary staging area for build
    │   └── cmdwheel_command_wheel/     # Addon source files
    │
    ├── pbo/                            # Compiled PBO files
    │   └── cmdwheel_command_wheel.pbo
    │
    └── @cmdwheel/                      # FINAL MOD FOLDER (ready to use)
        ├── mod.cpp                     # Mod metadata
        ├── meta.cpp                    # Steam Workshop metadata
        ├── logo.paa                    # Mod logo (512x512 recommended)
        ├── README.txt                  # User instructions
        └── addons/                     # PBO files go here
            └── cmdwheel_command_wheel.pbo
```

## Key Files Explained

### $PREFIX$
- Contains a single word: `cmdwheel`
- Defines your mod's namespace/prefix
- Used by Arma 3 Tools to organize addons

### $PBOPREFIX$
- Contains the virtual path: `x\cmdwheel\addons\command_wheel`
- This is the path as it appears on the P: drive
- Used for include statements in config files
- Format: `x\<prefix>\addons\<addon_name>`

### config.cpp
The main configuration file for your addon. Must contain:

```cpp
class CfgPatches {
    class cmdwheel_command_wheel {
        name = "Command Wheel";
        author = "Y0L042";
        url = "https://github.com/Y0L042/A3-Command-Wheel";
        units[] = {};           // List of new units added
        weapons[] = {};         // List of new weapons added
        requiredVersion = 2.00; // Minimum Arma 3 version
        requiredAddons[] = {    // Dependencies
            "cba_settings",
            "A3_UI_F"
        };
        version = "1.0.0";
        versionStr = "1.0.0";
        versionAr[] = {1,0,0};  // Array format: {major, minor, patch}
    };
};
```

### mod.cpp
Describes your mod in the Arma 3 launcher:

```cpp
name = "Command Wheel";
author = "Y0L042";
description = "Description here";
picture = "logo.paa";           // Mod logo
logo = "logo.paa";
logoOver = "logo.paa";
tooltip = "Command Wheel";
action = "https://github.com/Y0L042/A3-Command-Wheel";
hideName = 0;
hidePicture = 0;
```

### meta.cpp
Used by Steam Workshop for publishing:

```cpp
protocol = 1;
publishedid = 0;  // Steam Workshop ID (auto-filled on upload)
name = "Command Wheel";
timestamp = 0;
```

## Build Process

### 1. Preparation
The build script (`CommandWheelPy/build.py`) performs these steps:

1. **Creates addon source directory**: `build/addon_source/cmdwheel_command_wheel/`
2. **Copies necessary files**:
   - `$PBOPREFIX$` (required!)
   - `config.cpp`
   - `description.ext`
   - `XEH_preInit.sqf`
   - `init.sqf`
   - `Data/` folder
   - `UI/` folder
   - `Functions/` folder

3. **Excludes**:
   - `mission.sqm` (mission file, not needed in addon)
   - `CommandWheelPy/` (Python scripts)
   - `.git/` (version control)
   - `Examples/` (documentation)

### 2. Compilation
Uses Arma 3 Tools AddonBuilder:

```powershell
AddonBuilder.exe <source_folder> <output_folder> -clear -packonly
```

Options:
- `-clear`: Clean output folder before build
- `-packonly`: Don't sign the PBO (for development)
- `-binarize`: Optimize configs (requires P: drive setup)

### 3. Final Structure
Creates `build/@cmdwheel/` folder:

```
@cmdwheel/
├── mod.cpp          # Mod metadata
├── meta.cpp         # Steam Workshop metadata
├── logo.paa         # Mod logo
├── README.txt       # Instructions
└── addons/
    └── cmdwheel_command_wheel.pbo  # Your compiled addon
```

## Installation & Testing

### Local Testing
1. Copy `build/@cmdwheel/` to your Arma 3 directory
2. Launch Arma 3
3. Enable "@cmdwheel" in the launcher
4. Test in-game

### Steam Workshop Publishing
1. Ensure `meta.cpp` exists in `@cmdwheel/`
2. Use Publisher tool or Arma 3 Launcher
3. Upload `@cmdwheel/` folder
4. Steam will fill in `publishedid` automatically

## Naming Conventions

### Addon Name Format
- **Prefix**: `cmdwheel` (from $PREFIX$)
- **Component**: `command_wheel`
- **Full name**: `cmdwheel_command_wheel`

### Class Names
- Use prefix for all classes: `cmdwheel_<classname>`
- Example: `cmdwheel_command_wheel` (CfgPatches)
- Example: `CMDWHEEL` (CfgFunctions tag)

### File Paths
- Inside PBO: `\cmdwheel_command_wheel\Functions\fn_load.sqf`
- On P: drive: `P:\x\cmdwheel\addons\command_wheel\Functions\fn_load.sqf`

## Dependencies

### Required Addons
- **CBA_A3**: Community Base Addons (for settings system)
- **A3_UI_F**: Arma 3 UI framework (built-in)

### Optional Addons
Add to `requiredAddons[]` in config.cpp if needed

## Versioning

Use semantic versioning: `MAJOR.MINOR.PATCH`

```cpp
version = "1.0.0";
versionStr = "1.0.0";
versionAr[] = {1,0,0};
```

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes

## Troubleshooting

### Common Issues

1. **"Addon requires unknown addon"**
   - Check `requiredAddons[]` in config.cpp
   - Ensure CBA is installed and enabled

2. **"Cannot find file"**
   - Check $PBOPREFIX$ path
   - Verify file paths use correct slashes: `\` not `/`
   - Ensure path starts with `\<pbo_name>\`

3. **"Config error"**
   - Validate config.cpp syntax
   - Check for missing semicolons
   - Ensure all classes are properly closed

4. **Mod doesn't appear in launcher**
   - Verify `mod.cpp` exists in mod root
   - Check folder name starts with `@`
   - Restart Arma 3 launcher

## Best Practices

1. **Always include $PBOPREFIX$** - Required for proper file path resolution
2. **Use versioning** - Track changes and compatibility
3. **Document dependencies** - List all required addons
4. **Test locally first** - Before publishing to Workshop
5. **Use proper naming** - Follow prefix conventions
6. **Keep source separate** - Don't include build tools in PBO
7. **Create backups** - Before major changes

## Resources

- [Official Arma 3 Creating an Addon Guide](https://community.bistudio.com/wiki/Arma_3:_Creating_an_Addon)
- [CfgPatches Documentation](https://community.bistudio.com/wiki/CfgPatches)
- [PBO File Format](https://community.bistudio.com/wiki/PBO_File_Format)
- [Addon Configuration](https://community.bistudio.com/wiki/Addon_Configuration)

## Quick Commands

```powershell
# Build the mod
cd CommandWheelPy
uv run build.py

# Or use Makefile
make build

# Test in Arma 3 (after copying to Arma 3 directory)
# Launch via Arma 3 Launcher with @cmdwheel enabled
```

---

**Author**: Y0L042  
**Repository**: https://github.com/Y0L042/A3-Command-Wheel  
**Last Updated**: October 2025
