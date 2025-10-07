"""
Quick test script to verify mod structure before building
"""
from pathlib import Path
import os

def verify_structure():
    """Verify all required files exist"""
    project_root = Path(__file__).parent.parent
    
    print("=" * 60)
    print("PRE-BUILD VERIFICATION")
    print("=" * 60)
    
    checks = {
        "config.cpp": project_root / "config.cpp",
        "$PBOPREFIX$": project_root / "$PBOPREFIX$",
        "XEH_preInit.sqf": project_root / "XEH_preInit.sqf",
        "fn_initCommandWheel.sqf": project_root / "Functions" / "fn_initCommandWheel.sqf",
        "UI/CommandWheel.hpp": project_root / "UI" / "CommandWheel.hpp",
        "UI/BaseControls.hpp": project_root / "UI" / "BaseControls.hpp",
        "Data folder": project_root / "Data",
        "Functions folder": project_root / "Functions",
    }
    
    all_ok = True
    for name, path in checks.items():
        if path.exists():
            if path.is_file():
                size = path.stat().st_size
                print(f"✅ {name:<30} ({size:,} bytes)")
            else:
                count = len(list(path.iterdir()))
                print(f"✅ {name:<30} ({count} items)")
        else:
            print(f"❌ {name:<30} MISSING!")
            all_ok = False
    
    # Check $PBOPREFIX$ content
    pboprefix = project_root / "$PBOPREFIX$"
    if pboprefix.exists():
        with open(pboprefix, 'r') as f:
            content = f.read().strip()
        if content == r"\cmdwheel_command_wheel":
            print(f"\n✅ $PBOPREFIX$ content: {content}")
        else:
            print(f"\n⚠️  $PBOPREFIX$ content: {content}")
            print(f"   Expected: \\cmdwheel_command_wheel")
    
    # Check for mod paths in files
    print("\n" + "-" * 60)
    print("Checking file paths...")
    print("-" * 60)
    
    ui_file = project_root / "UI" / "CommandWheel.hpp"
    if ui_file.exists():
        with open(ui_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Count path formats
        mod_paths = content.count('\\cmdwheel_command_wheel\\')
        relative_paths = content.count('"data\\') + content.count('"Data\\')
        
        print(f"✅ Absolute mod paths: {mod_paths}")
        if relative_paths > 0:
            print(f"⚠️  Relative paths remaining: {relative_paths}")
        else:
            print(f"✅ No relative paths found")
    
    print("\n" + "=" * 60)
    if all_ok:
        print("✅ ALL CHECKS PASSED - Ready to build!")
    else:
        print("❌ SOME CHECKS FAILED - Fix issues before building")
    print("=" * 60)
    
    return all_ok

if __name__ == "__main__":
    verify_structure()
