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
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
SOURCE_DIR = os.path.join(PROJECT_ROOT, "addon_source")
BUILD_DIR = os.path.join(PROJECT_ROOT, "build")
OUTPUT_DIR = os.path.join(PROJECT_ROOT, "release")

# Addon information
ADDON_PREFIX = "cmdwheel"
ADDON_NAME = "command_wheel"
FULL_ADDON_NAME = f"{ADDON_PREFIX}_{ADDON_NAME}"

# Build options
BINARIZE = True  # Set to False for faster builds during development
INCLUDE_FOLDER = os.path.join(ARMA3_TOOLS_PATH, "AddonBuilder", "Include")

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
    
    # Copy Data folder (PAA files)
    data_src = os.path.join(PROJECT_ROOT, "Data")
    data_dst = os.path.join(addon_dir, "data")
    if os.path.exists(data_src):
        if os.path.exists(data_dst):
            shutil.rmtree(data_dst)
        shutil.copytree(data_src, data_dst)
        print(f"  Copied Data folder")
    
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
        print(f"  Copied Functions folder")
    
    # Create config.cpp if it doesn't exist
    config_path = os.path.join(addon_dir, "config.cpp")
    if not os.path.exists(config_path):
        create_config(config_path)
    
    print("File copy complete")

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
        "-sign=",  # No signing for now
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
            
            # Copy to release folder
            ensure_dir(OUTPUT_DIR)
            release_pbo = os.path.join(OUTPUT_DIR, f"{FULL_ADDON_NAME}.pbo")
            shutil.copy2(output_pbo, release_pbo)
            print(f"Copied to: {release_pbo}")
            
            # Create @mod folder structure
            create_mod_structure(release_pbo)
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
    mod_dir = os.path.join(OUTPUT_DIR, f"@{ADDON_PREFIX}")
    addons_dir = os.path.join(mod_dir, "addons")
    
    ensure_dir(addons_dir)
    
    # Copy PBO to @mod/addons
    dest_pbo = os.path.join(addons_dir, os.path.basename(pbo_path))
    shutil.copy2(pbo_path, dest_pbo)
    
    # Create mod.cpp
    mod_cpp_path = os.path.join(mod_dir, "mod.cpp")
    mod_cpp_content = f'''name = "Command Wheel";
author = "Your Name";
description = "Radial command wheel for Arma 3";
picture = "";
actionName = "Website";
action = "";
'''
    with open(mod_cpp_path, 'w') as f:
        f.write(mod_cpp_content)
    
    print(f"\nMod structure created: {mod_dir}")
    print(f"Copy this folder to your Arma 3 directory to test")

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
        print(f"\nYour addon is ready in: {OUTPUT_DIR}")
        print(f"\nTo use in Arma 3:")
        print(f"1. Copy '@{ADDON_PREFIX}' folder to your Arma 3 directory")
        print(f"2. Launch Arma 3 with the mod enabled")
        print(f"3. In-game, use the command wheel keybind")
    else:
        print("\n" + "=" * 70)
        print("BUILD FAILED")
        print("=" * 70)
        print("Check the error messages above for details")

if __name__ == "__main__":
    main()