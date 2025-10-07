import os
import subprocess
import shutil
from pathlib import Path

# ============================================================================
# CONFIGURATION
# ============================================================================

# Arma 3 Tools paths
ARMA3_TOOLS_PATH = r"G:\\Steam\\steamapps\\common\\Arma 3 Tools"
ADDON_BUILDER_PATH = os.path.join(ARMA3_TOOLS_PATH, "AddonBuilder", "AddonBuilder.exe")
PUBLISHER_PATH = os.path.join(ARMA3_TOOLS_PATH, "Publisher", "PublisherCmd.exe")

# Project paths
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)  # Parent directory (mission root)
SOURCE_DIR = os.path.join(PROJECT_ROOT, "build", "addon_source")
BUILD_DIR = os.path.join(PROJECT_ROOT, "build", "pbo")
OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "@cmdwheel")

# Addon information
ADDON_PREFIX = "cmdwheel"
ADDON_NAME = "command_wheel"
FULL_ADDON_NAME = f"{ADDON_PREFIX}_{ADDON_NAME}"

# Build options
BINARIZE = False  # Set to True to enable binarization (requires valid include folder)
INCLUDE_FOLDER = ""  # Path to Arma 3 include folder (needed only if BINARIZE = True)

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

def ensure_dir(directory):
    """Create directory if it doesn't exist"""
    Path(directory).mkdir(parents=True, exist_ok=True)

def clean_directory(directory):
    """Remove all files in directory"""
    if os.path.exists(directory):
        shutil.rmtree(directory)
    ensure_dir(directory)

def copy_files_to_source():
    """Copy project files to addon source directory"""
    print("Copying files to addon source...")
    
    # Create addon source structure
    addon_dir = os.path.join(SOURCE_DIR, FULL_ADDON_NAME)
    ensure_dir(addon_dir)
    
    # Copy $PBOPREFIX$ file (required for proper addon path resolution)
    pboprefix_src = os.path.join(PROJECT_ROOT, "$PBOPREFIX$")
    pboprefix_dst = os.path.join(addon_dir, "$PBOPREFIX$")
    if os.path.exists(pboprefix_src):
        shutil.copy2(pboprefix_src, pboprefix_dst)
        print(f"  Copied $PBOPREFIX$")
    else:
        # Create default $PBOPREFIX$ if it doesn't exist
        with open(pboprefix_dst, 'w') as f:
            f.write(f"x\\{ADDON_PREFIX}\\addons\\{ADDON_NAME}")
        print(f"  Created default $PBOPREFIX$")
    
    # Copy Data folder (PAA files)
    data_src = os.path.join(PROJECT_ROOT, "Data")
    data_dst = os.path.join(addon_dir, "data")
    if os.path.exists(data_src):
        if os.path.exists(data_dst):
            shutil.rmtree(data_dst)
        shutil.copytree(data_src, data_dst)
        print(f"  Copied Data folder ({len(os.listdir(data_src))} files)")
    
    # Copy UI folder
    ui_src = os.path.join(PROJECT_ROOT, "UI")
    ui_dst = os.path.join(addon_dir, "UI")
    if os.path.exists(ui_src):
        if os.path.exists(ui_dst):
            shutil.rmtree(ui_dst)
        shutil.copytree(ui_src, ui_dst)
        print(f"  Copied UI folder")
    
    # Copy Functions folder
    functions_src = os.path.join(PROJECT_ROOT, "Functions")
    functions_dst = os.path.join(addon_dir, "Functions")
    if os.path.exists(functions_src):
        if os.path.exists(functions_dst):
            shutil.rmtree(functions_dst)
        shutil.copytree(functions_src, functions_dst)
        print(f"  Copied Functions folder ({len(os.listdir(functions_src))} files)")
    
    # Copy config.cpp from project root
    config_src = os.path.join(PROJECT_ROOT, "config.cpp")
    config_dst = os.path.join(addon_dir, "config.cpp")
    if os.path.exists(config_src):
        shutil.copy2(config_src, config_dst)
        print(f"  Copied config.cpp")
    else:
        print(f"  WARNING: config.cpp not found, creating default")
        create_config(config_dst)
    
    # Copy description.ext from project root
    desc_src = os.path.join(PROJECT_ROOT, "description.ext")
    desc_dst = os.path.join(addon_dir, "description.ext")
    if os.path.exists(desc_src):
        shutil.copy2(desc_src, desc_dst)
        print(f"  Copied description.ext")
    
    # Copy XEH_preInit.sqf (CBA settings)
    preinit_src = os.path.join(PROJECT_ROOT, "XEH_preInit.sqf")
    preinit_dst = os.path.join(addon_dir, "XEH_preInit.sqf")
    if os.path.exists(preinit_src):
        shutil.copy2(preinit_src, preinit_dst)
        print(f"  Copied XEH_preInit.sqf")
    
    # Copy init.sqf (initialization script)
    init_src = os.path.join(PROJECT_ROOT, "init.sqf")
    init_dst = os.path.join(addon_dir, "init.sqf")
    if os.path.exists(init_src):
        shutil.copy2(init_src, init_dst)
        print(f"  Copied init.sqf")
    
    print("\nFile copy complete")
    print(f"Addon source prepared at: {addon_dir}")
    print("\nNOTE: The following are NOT included in the build:")
    print("  - mission.sqm (mission file)")
    print("  - CommandWheelPy/ (Python scripts)")
    print("  - .git/ (version control)")
    print("  - Examples/ (documentation)")

def create_config(config_path):
    """Create a basic config.cpp"""
    config_content = f'''class CfgPatches {{
    class {FULL_ADDON_NAME} {{
        name = "Command Wheel";
        author = "Your Name";
        url = "";
        units[] = {{}};
        weapons[] = {{}};
        requiredVersion = 2.00;
        requiredAddons[] = {{"A3_UI_F"}};
    }};
}};

#include "UI\\defines.hpp"
#include "UI\\CommandWheel.hpp"

class CfgFunctions {{
    class CMDWHEEL {{
        class Functions {{
            file = "\\{FULL_ADDON_NAME}\\Functions";
            class load {{}};
            class unload {{}};
        }};
    }};
}};
'''
    
    with open(config_path, 'w') as f:
        f.write(config_content)
    print(f"  Created config.cpp")

def build_addon():
    """Build the PBO using AddonBuilder"""
    print("\nBuilding addon...")
    
    if not os.path.exists(ADDON_BUILDER_PATH):
        print(f"ERROR: AddonBuilder not found at {ADDON_BUILDER_PATH}")
        print("Please update ARMA3_TOOLS_PATH in the script")
        return False
    
    addon_source = os.path.join(SOURCE_DIR, FULL_ADDON_NAME)
    output_pbo = os.path.join(BUILD_DIR, f"{FULL_ADDON_NAME}.pbo")
    
    # Build command
    cmd = [
        ADDON_BUILDER_PATH,
        addon_source,
        BUILD_DIR,
        "-clear",
        "-packonly",  # Don't sign the PBO
    ]
    
    if BINARIZE:
        cmd.extend([
            "-binarize",
            f"-include={INCLUDE_FOLDER}"
        ])
    
    # Run AddonBuilder
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            check=True
        )
        
        print("AddonBuilder output:")
        print(result.stdout)
        
        if os.path.exists(output_pbo):
            print(f"\nBuild successful: {output_pbo}")
            
            # Create @mod folder structure
            create_mod_structure(output_pbo)
            return True
        else:
            print("ERROR: PBO file was not created")
            return False
            
    except subprocess.CalledProcessError as e:
        print(f"ERROR: AddonBuilder failed")
        print(f"Exit code: {e.returncode}")
        print(f"Output: {e.stdout}")
        print(f"Error: {e.stderr}")
        return False

def create_mod_structure(pbo_path):
    """Create @mod folder structure for easy testing"""
    addons_dir = os.path.join(OUTPUT_DIR, "addons")
    
    ensure_dir(addons_dir)
    
    # Copy PBO to @mod/addons
    dest_pbo = os.path.join(addons_dir, os.path.basename(pbo_path))
    shutil.copy2(pbo_path, dest_pbo)
    
    # Create mod.cpp
    mod_cpp_path = os.path.join(OUTPUT_DIR, "mod.cpp")
    mod_cpp_content = f'''name = "Command Wheel";
author = "Y0L042";
description = "Radial command wheel for Arma 3 - Provides an intuitive radial menu interface for issuing commands to AI units";
picture = "logo.paa";
logo = "logo.paa";
logoOver = "logo.paa";
tooltip = "Command Wheel";
tooltipOwned = "Command Wheel - Owned";
overview = "A customizable radial command wheel for Arma 3";
actionName = "GitHub";
action = "https://github.com/Y0L042/A3-Command-Wheel";
hideName = 0;
hidePicture = 0;
'''
    with open(mod_cpp_path, 'w') as f:
        f.write(mod_cpp_content)
    
    # Create meta.cpp for Steam Workshop
    meta_cpp_path = os.path.join(OUTPUT_DIR, "meta.cpp")
    meta_cpp_content = f'''protocol = 1;
publishedid = 0; // Will be filled by Steam Workshop upon upload
name = "Command Wheel";
timestamp = 0;
'''
    with open(meta_cpp_path, 'w') as f:
        f.write(meta_cpp_content)
    
    # Create README in the mod folder
    readme_path = os.path.join(OUTPUT_DIR, "README.txt")
    readme_content = f'''Command Wheel for Arma 3
======================

Installation:
1. Copy this @cmdwheel folder to your Arma 3 directory
2. Launch Arma 3 and enable the mod in the launcher
3. In-game, press User20 key to open the command wheel

Requirements:
- CBA_A3 (Community Base Addons)

Configuration:
- Use CBA Settings in-game to customize commands
- Keybind can be changed in Controls > Configure Addons

For more information:
https://github.com/Y0L042/A3-Command-Wheel
'''
    with open(readme_path, 'w') as f:
        f.write(readme_content)
    
    print(f"\nMod structure created: {OUTPUT_DIR}")
    print(f"Ready to use! Copy to your Arma 3 directory to test")

# ============================================================================
# MAIN BUILD PROCESS
# ============================================================================

def main():
    print("=" * 70)
    print("Arma 3 Command Wheel - Build Script")
    print("=" * 70)
    
    # Validate paths
    if not os.path.exists(ARMA3_TOOLS_PATH):
        print(f"\nERROR: Arma 3 Tools not found at: {ARMA3_TOOLS_PATH}")
        print("Please update ARMA3_TOOLS_PATH in the script configuration")
        return
    
    # Clean and prepare directories
    print("\nPreparing build directories...")
    ensure_dir(SOURCE_DIR)
    clean_directory(BUILD_DIR)
    
    # Copy files to source
    copy_files_to_source()
    
    # Build addon
    success = build_addon()
    
    if success:
        print("\n" + "=" * 70)
        print("BUILD COMPLETE")
        print("=" * 70)
        print(f"\nYour mod is ready at: {OUTPUT_DIR}")
        print(f"\nBuild structure:")
        print(f"  {PROJECT_ROOT}/build/")
        print(f"    ├── addon_source/      (Source files used for building)")
        print(f"    ├── pbo/               (Compiled PBO file)")
        print(f"    └── @cmdwheel/         (READY TO USE MOD)")
        print(f"         ├── addons/       (Contains the PBO)")
        print(f"         ├── mod.cpp       (Mod metadata)")
        print(f"         └── README.txt    (Installation instructions)")
        print(f"\nTo use in Arma 3:")
        print(f"1. Copy '{OUTPUT_DIR}' to your Arma 3 directory")
        print(f"2. Launch Arma 3 and enable '@cmdwheel' in the launcher")
        print(f"3. In-game, press User20 key to open the command wheel")
        print(f"\nWhat's included:")
        print(f"  ✓ UI/ (Command wheel interface)")
        print(f"  ✓ Functions/ (All command scripts)")
        print(f"  ✓ Data/ (Graphics and textures)")
        print(f"  ✓ config.cpp (Addon configuration)")
        print(f"  ✓ description.ext (Function definitions)")
        print(f"  ✓ XEH_preInit.sqf (CBA settings)")
        print(f"  ✓ init.sqf (Initialization)")
        print(f"\nWhat's NOT included:")
        print(f"  ✗ mission.sqm (Mission file)")
        print(f"  ✗ CommandWheelPy/ (Python generation scripts)")
        print(f"  ✗ .git/ (Version control)")
    else:
        print("\n" + "=" * 70)
        print("BUILD FAILED")
        print("=" * 70)
        print("Check the error messages above for details")

if __name__ == "__main__":
    main()