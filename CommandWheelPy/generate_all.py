# generate_all.py
"""
Master script to generate all Command Wheel files
Runs all generation scripts in the correct order
"""

import os
import sys

# Import all generators
import generate_commands
import generate_ui
import generate_preinit

def main():
    """Run all generators"""
    print("=" * 70)
    print("ARMA 3 COMMAND WHEEL - MASTER GENERATOR")
    print("=" * 70)
    print()
    
    print("Step 1: Generating wrapper functions (fn_XX.sqf, fn_XX_Y.sqf)...")
    print("-" * 70)
    generate_commands.generate_all()
    print()
    
    print("Step 2: Generating UI configuration (CommandWheel.hpp)...")
    print("-" * 70)
    if __name__ == "__main__":
        # Call the main code from generate_ui
        import math
        from commands import COMMANDS
        
        # Create output directory if it doesn't exist
        os.makedirs(generate_ui.OUTPUT_DIR, exist_ok=True)
        
        # Generate config
        config_content = generate_ui.generate_command_wheel()
        
        # Write to file
        output_path = os.path.join(generate_ui.OUTPUT_DIR, generate_ui.OUTPUT_FILENAME)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(config_content)
        
        # Count how many sections and subsections are defined
        defined_sections = sum(1 for i in range(8) if COMMANDS.get(i, {}).get('name'))
        defined_subsections = sum(
            1 for section in range(8) 
            for subsec in range(4) 
            if COMMANDS.get(section, {}).get('subs', {}).get(subsec, {}).get('name')
        )
        
        print(f"Generated {output_path}")
        print(f"- {defined_sections}/8 main sections defined")
        print(f"- {defined_subsections}/32 subsection labels defined")
    print()
    
    print("Step 3: Generating CBA settings (XEH_preInit.sqf)...")
    print("-" * 70)
    output_path = "../XEH_preInit.sqf"
    
    # Generate content
    content = generate_preinit.generate_preinit()
    
    # Write to file
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Count settings
    from commands import COMMANDS
    main_sections = sum(1 for i in range(8) if COMMANDS.get(i))
    subsections = sum(
        len(COMMANDS.get(i, {}).get('subs', {}))
        for i in range(8)
    )
    
    print(f"Generated {output_path}")
    print(f"- {main_sections} main sections with settings")
    print(f"- {subsections} subsections with settings")
    print(f"- Total: {(main_sections * 3) + (subsections * 3)} CBA settings")
    print()
    
    print("=" * 70)
    print("GENERATION COMPLETE!")
    print("=" * 70)
    print()
    print("All command wheel files have been generated from commands.py")
    print("Make sure to reload your mission in Arma 3 to see the changes.")

if __name__ == "__main__":
    main()
