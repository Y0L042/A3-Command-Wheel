# Quick Build & Publish Guide

## Build Your Mod

### Option 1: Using Python directly
```powershell
cd CommandWheelPy
uv run build.py
```

### Option 2: Using Make
```powershell
make build
```

## After Building

Your mod is ready at: `build/@cmdwheel/`

```
build/@cmdwheel/
├── mod.cpp
├── meta.cpp
├── logo.paa
├── README.txt
└── addons/
    └── cmdwheel_command_wheel.pbo
```

## Local Testing

1. Copy `build/@cmdwheel/` to your Arma 3 directory
   ```
   C:\Program Files (x86)\Steam\steamapps\common\Arma 3\@cmdwheel\
   ```

2. Launch Arma 3

3. In launcher, click "Mods" and enable "@cmdwheel"

4. Start game and test (default key: User20)

## Steam Workshop Publishing

### Method 1: Using Arma 3 Publisher GUI
1. Launch Arma 3 Tools
2. Open "Publisher"
3. Click "New Item"
4. Select your `build/@cmdwheel/` folder
5. Fill in details
6. Click "Publish"

### Method 2: Using Publisher Command Line
```powershell
# From your project root
cd build
& "G:\Steam\steamapps\common\Arma 3 Tools\Publisher\PublisherCmd.exe" ^
  update /changeNote:"Initial release" /path:"@cmdwheel"
```

### First Time Publishing
The `meta.cpp` file will be automatically updated with your Workshop ID after first upload.

## Updating Your Mod

1. Make your changes to the source files
2. Rebuild: `uv run build.py` or `make build`
3. Test locally
4. Republish to Workshop with updated change notes

## Version Numbering

Update version in `config.cpp`:
```cpp
version = "1.0.1";      // Increment this
versionStr = "1.0.1";   // Keep in sync
versionAr[] = {1,0,1};  // Array format
```

Semantic versioning:
- **1**.0.0 - Major (breaking changes)
- 1.**1**.0 - Minor (new features)
- 1.0.**1** - Patch (bug fixes)

## Checklist Before Publishing

- [ ] All files build without errors
- [ ] Tested locally in Arma 3
- [ ] Version number updated
- [ ] `mod.cpp` has correct description
- [ ] `meta.cpp` exists (for Steam Workshop)
- [ ] Dependencies listed in `config.cpp`
- [ ] Change notes prepared
- [ ] Logo image exists (optional but recommended)

## Common Paths to Update

If you need to change paths in `build.py`:

```python
# Line 11-12: Your Arma 3 Tools location
ARMA3_TOOLS_PATH = r"G:\\Steam\\steamapps\\common\\Arma 3 Tools"
ADDON_BUILDER_PATH = os.path.join(ARMA3_TOOLS_PATH, "AddonBuilder", "AddonBuilder.exe")
```

## File Naming Convention

- Prefix: `cmdwheel` (defined in $PREFIX$)
- Addon: `command_wheel`
- PBO: `cmdwheel_command_wheel.pbo`
- Mod folder: `@cmdwheel`

## Troubleshooting

### Build fails with "AddonBuilder not found"
Update `ARMA3_TOOLS_PATH` in `CommandWheelPy/build.py` line 11

### Mod doesn't appear in launcher
- Ensure folder starts with `@`
- Check `mod.cpp` exists in root
- Restart Arma 3 launcher

### "Addon requires unknown addon" error
Add missing dependencies to `config.cpp`:
```cpp
requiredAddons[] = {"cba_settings", "A3_UI_F", "your_missing_addon"};
```

### Files not included in build
Check `copy_files_to_source()` function in `build.py`

## Support

- GitHub: https://github.com/Y0L042/A3-Command-Wheel
- Issues: https://github.com/Y0L042/A3-Command-Wheel/issues

---

**Quick Command Reference:**
```powershell
# Generate all files
make generate_all

# Build mod
make build

# Or individual steps
make generate_wheel
make generate_ui
make generate_commands
make generate_preinit
```
