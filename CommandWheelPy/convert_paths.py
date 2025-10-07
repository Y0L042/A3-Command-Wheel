"""
Script to convert mission file paths to mod absolute paths
"""
from pathlib import Path
import re

def convert_paths_to_mod_format():
    """Convert all relative paths to absolute mod paths"""
    project_root = Path(__file__).parent.parent
    
    # Define the mod prefix
    MOD_PREFIX = r"\cmdwheel_command_wheel"
    
    # Files to update
    files_to_update = [
        project_root / "UI" / "CommandWheel.hpp",
        project_root / "config.cpp",
        project_root / "description.ext",
    ]
    
    replacements = {
        # Image paths
        (r'"data\\', r'"\\cmdwheel_command_wheel\\data\\'),
        (r'"Data\\', r'"\\cmdwheel_command_wheel\\Data\\'),
        
        # Function paths
        (r'"functions\\', r'"\\cmdwheel_command_wheel\\functions\\'),
        (r'"Functions\\', r'"\\cmdwheel_command_wheel\\Functions\\'),
        
        # UI paths
        (r'"UI\\', r'"\\cmdwheel_command_wheel\\UI\\'),
        (r'"ui\\', r'"\\cmdwheel_command_wheel\\UI\\'),
        
        # Script paths in includes
        (r"'XEH_preInit\.sqf'", r"'\\cmdwheel_command_wheel\\XEH_preInit.sqf'"),
        (r'"XEH_preInit\.sqf"', r'"\\cmdwheel_command_wheel\\XEH_preInit.sqf"'),
        
        # Include statements (but keep absolute ones as-is)
        (r'#include "UI\\', r'#include "\\cmdwheel_command_wheel\\UI\\'),
        (r'#include "ui\\', r'#include "\\cmdwheel_command_wheel\\UI\\'),
    }
    
    for file_path in files_to_update:
        if not file_path.exists():
            print(f"⚠️  Skipping {file_path.name} (not found)")
            continue
        
        print(f"\n📝 Processing: {file_path.name}")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        changes_made = 0
        
        for pattern, replacement in replacements:
            matches = len(re.findall(pattern, content))
            if matches > 0:
                content = re.sub(pattern, replacement, content)
                changes_made += matches
                print(f"   ✓ Replaced {matches} occurrences of {pattern}")
        
        if content != original_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"   ✅ Updated {file_path.name} ({changes_made} changes)")
        else:
            print(f"   ℹ️  No changes needed for {file_path.name}")
    
    print("\n" + "=" * 60)
    print("✅ Path conversion complete!")
    print("=" * 60)

if __name__ == "__main__":
    print("=" * 60)
    print("Mission to Mod Path Converter")
    print("=" * 60)
    convert_paths_to_mod_format()
