# generate.py
"""
Generator script for ARMA 3 Command Wheel
Generates wrapper SQF functions (fn_00.sqf, fn_00_0.sqf) that call actual command implementations
"""

import os
from commands import *

def generate_wrapper_function(main_idx, sub_idx=None, cmd_data=None):
    """Generate wrapper SQF function that calls the actual command function"""
    if sub_idx is None:
        # Main command wrapper
        func_name = f"fn_{main_idx:02d}.sqf"
        if cmd_data and cmd_data.get('command'):
            content = f"""/*
 * Wrapper for: {cmd_data['name']}
 * Calls: {cmd_data['command']}
 */

params ["_caller"];

_caller call CMDWHEEL_fnc_{cmd_data['command'].replace('.sqf', '').replace('fn_', '')};
"""
        else:
            # Empty command slot
            content = f"""/*
 * Empty command slot {main_idx:02d}
 */

params ["_caller"];

// No command assigned
"""
    else:
        # Sub-command wrapper
        func_name = f"fn_{main_idx:02d}_{sub_idx}.sqf"
        if cmd_data and cmd_data.get('command'):
            parent_name = COMMANDS.get(main_idx, {}).get('name', f'Command {main_idx:02d}')
            content = f"""/*
 * Wrapper for: {parent_name} > {cmd_data['name']}
 * Calls: {cmd_data['command']}
 */

params ["_caller"];

_caller call CMDWHEEL_fnc_{cmd_data['command'].replace('.sqf', '').replace('fn_', '')};
"""
        else:
            # Empty sub-command slot
            content = f"""/*
 * Empty sub-command slot {main_idx:02d}_{sub_idx}
 */

params ["_caller"];

// No command assigned
"""
    
    return func_name, content

def update_functions():
    """Generate wrapper functions only"""
    functions_path = "../Functions"
    
    if not os.path.exists(functions_path):
        print(f"Error: Functions directory not found at {functions_path}")
        return
    
    wrapper_files = []
    
    # Generate ALL wrapper functions (00-07, each with 0-3 subs)
    for main_idx in range(8):  # 00-07
        cmd_data = COMMANDS.get(main_idx)
        
        # Generate main wrapper (always, always overwrite)
        wrapper_name, wrapper_content = generate_wrapper_function(main_idx, None, cmd_data)
        wrapper_path = os.path.join(functions_path, wrapper_name)
        
        with open(wrapper_path, 'w') as f:
            f.write(wrapper_content)
        wrapper_files.append(wrapper_name)
        
        # Generate sub-command wrappers (always, for 0-3, always overwrite)
        for sub_idx in range(4):  # 0-3
            sub_data = None
            if cmd_data and "subs" in cmd_data:
                sub_data = cmd_data["subs"].get(sub_idx)
            
            wrapper_name, wrapper_content = generate_wrapper_function(main_idx, sub_idx, sub_data)
            wrapper_path = os.path.join(functions_path, wrapper_name)
            
            with open(wrapper_path, 'w') as f:
                f.write(wrapper_content)
            wrapper_files.append(wrapper_name)
    
    print(f"Generated {len(wrapper_files)} wrapper files in Functions/ (all overwritten):")
    for f in wrapper_files[:5]:
        print(f"  - {f}")
    if len(wrapper_files) > 5:
        print(f"  ... and {len(wrapper_files) - 5} more")

def generate_all():
    """Generate all files"""
    print("Generating Command Wheel wrapper functions...")
    print()
    
    update_functions()
    print()
    print("Generation complete!")
    print(f"Total wrapper files: 8 main + 32 sub = 40 files")
    print("\nNote: Implementation files (fn_hold.sqf, etc.) are not modified.")
    print("Create these manually in the Functions/ directory.")

if __name__ == "__main__":
    generate_all()