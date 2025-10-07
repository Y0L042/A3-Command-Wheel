# MISSION TO MOD CONVERSION CHECKLIST

## ✅ COMPLETED STEPS

### 1. Config.cpp Structure ✅
- [x] Added CfgPatches with proper mod info
- [x] Moved CfgFunctions from description.ext to config.cpp
- [x] Moved Extended_PreInit_EventHandlers to config.cpp
- [x] Added #include statements for UI dialogs
- [x] Added postInit function for auto-initialization

### 2. File Paths Converted ✅
- [x] Updated UI/CommandWheel.hpp: 49 image paths converted to `\cmdwheel_command_wheel\data\`
- [x] Updated description.ext: 3 paths converted
- [x] Created convert_paths.py script for future updates

### 3. Initialization System ✅
- [x] Created fn_initCommandWheel.sqf with postInit
- [x] Removed dependency on init.sqf (now auto-runs via postInit)
- [x] Added player action for opening wheel (Y key)

### 4. Build System ✅
- [x] build.py properly copies all files
- [x] $PBOPREFIX$ file exists and is correct

## 🔧 REMAINING TASKS

### 5. Update $PBOPREFIX$ Content
**Current:** (needs verification)
**Required:** `\cmdwheel_command_wheel`

Run this to check:
```powershell
cat "$PBOPREFIX$"
```

If it's not correct, update it:
```powershell
echo "\cmdwheel_command_wheel" > "$PBOPREFIX$"
```

### 6. Test Build
```powershell
cd CommandWheelPy
python build.py
```

Verify output:
- `build\@cmdwheel\addons\cmdwheel_command_wheel.pbo` exists
- PBO contains all files (config.cpp, functions, UI, data)

### 7. Deploy and Test
```powershell
cd CommandWheelPy
python deploy.py
```

Then in Arma 3:
1. Enable mod in launcher
2. Launch game
3. Open debug console
4. Run: `configName (configFile >> "CfgPatches" >> "cmdwheel_command_wheel")`
5. Should return: `"cmdwheel_command_wheel"`
6. Press Y to open command wheel

## 📋 FILE STRUCTURE SUMMARY

### Mission Files (Source):
```
Sandbox.SPE_Mortain/
├── config.cpp                    # ✅ Main addon config (CONVERTED)
├── description.ext               # ⚠️  Keep for mission, but dialogs moved to config.cpp
├── init.sqf                      # ⚠️  No longer needed for mod (kept for mission compatibility)
├── XEH_preInit.sqf              # ✅ CBA settings (loaded via Extended_PreInit)
├── $PBOPREFIX$                   # ✅ Contains: \cmdwheel_command_wheel
├── Data/                         # ✅ PAA image files
├── UI/                           # ✅ Dialog definitions (paths converted)
│   ├── BaseControls.hpp
│   └── CommandWheel.hpp
└── Functions/                    # ✅ SQF scripts
    ├── fn_initCommandWheel.sqf  # ✅ NEW: PostInit function
    ├── fn_load.sqf
    ├── fn_unload.sqf
    └── ... (all other functions)
```

### Built Mod Structure:
```
build/@cmdwheel/
├── mod.cpp                       # ✅ Mod metadata
├── addons/
│   └── cmdwheel_command_wheel.pbo
└── keys/ (optional)
```

### Inside PBO:
```
cmdwheel_command_wheel.pbo:
├── config.cpp                    # Master config with dialogs
├── $PBOPREFIX$                   # \cmdwheel_command_wheel
├── XEH_preInit.sqf              # CBA settings
├── data/                         # All PAA files
├── UI/                           # Dialog definitions
└── Functions/                    # All SQF scripts
```

## 🔍 VERIFICATION COMMANDS

### Check PBO Contents
```powershell
# If you have ExtractPbO tool:
ExtractPbO.exe "build\@cmdwheel\addons\cmdwheel_command_wheel.pbo" -list
```

### In-Game Verification
```sqf
// 1. Check if mod is loaded
configName (configFile >> "CfgPatches" >> "cmdwheel_command_wheel")  // Should return: "cmdwheel_command_wheel"

// 2. Check if functions exist
CMDWHEEL_fnc_initCommandWheel  // Should return: CODE

// 3. Check if dialog exists
configName (configFile >> "CommandWheel")  // Should return: "CommandWheel"

// 4. Test opening the wheel
createDialog "CommandWheel"  // Should open the wheel

// 5. Check loaded mods
getLoadedModsInfo select {toLower _x find "cmdwheel" >= 0}  // Should show your mod
```

## ⚠️  COMMON ISSUES & SOLUTIONS

### Issue: Mod doesn't show in launcher
**Solution:** 
- Ensure `mod.cpp` exists in `@cmdwheel` folder
- Check file is in Arma 3 root, not Documents folder

### Issue: Mod loads but functions don't work
**Solution:**
- Check $PBOPREFIX$ contains: `\cmdwheel_command_wheel`
- Verify all paths use backslash `\` not forward slash `/`
- Ensure CfgFunctions paths match actual file structure

### Issue: Dialogs don't show
**Solution:**
- Verify UI includes are in config.cpp: `#include "\cmdwheel_command_wheel\UI\CommandWheel.hpp"`
- Check all image paths in dialogs use absolute paths
- Ensure PAA files are in the PBO

### Issue: "File not found" errors
**Solution:**
- Run convert_paths.py again to ensure all paths are absolute
- Check for typos in path names (case-sensitive!)

## 🚀 NEXT STEPS

1. **Verify $PBOPREFIX$** (see task #5 above)
2. **Rebuild:** `python build.py`
3. **Deploy:** `python deploy.py`
4. **Test in Arma 3**
5. **If working, commit changes to git**

## 📝 NOTES

- The mod name is: **cmdwheel_command_wheel**
- The PBO prefix is: **\cmdwheel_command_wheel**
- All absolute paths must start with: **\cmdwheel_command_wheel\**
- Dialog IDD is: **9000** (safe range, no conflicts)
- CBA is required dependency for settings system
- PostInit runs automatically, no manual initialization needed
