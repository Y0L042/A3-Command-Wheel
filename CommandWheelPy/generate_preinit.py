# generate_preinit.py
"""
Generator script for XEH_preInit.sqf
Generates CBA settings for the Command Wheel based on commands.py
"""

import os
from commands import COMMANDS

def generate_main_section_settings(section_idx):
    """Generate CBA settings for a main section"""
    cmd_data = COMMANDS.get(section_idx, {})
    section_name = cmd_data.get('name', f'Section {section_idx}').upper()
    default_name = cmd_data.get('name', f'Section {section_idx}')
    
    return f"""// Section {section_idx} - {section_name}
[
    "CMDWHEEL_action{section_idx}_enabled",
    "CHECKBOX",
    ["Use Custom Action ({section_name})", "Enable custom action for {section_name}"],
    [_category, "Section {section_idx} - {section_name}"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action{section_idx}_name",
    "EDITBOX",
    ["Action Name", "Display name for this action"],
    [_category, "Section {section_idx} - {section_name}"],
    "{default_name}",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action{section_idx}_code",
    "EDITBOX",
    ["Action Code", "SQF code to execute (e.g., 'hint ''Hello''') or script call (e.g., 'call myFunction' or '[] execVM ''myScript.sqf''')"],
    [_category, "Section {section_idx} - {section_name}"],
    "",
    1
] call CBA_fnc_addSetting;
"""

def generate_subsection_settings(section_idx, subsec_idx):
    """Generate CBA settings for a subsection"""
    cmd_data = COMMANDS.get(section_idx, {})
    section_name = cmd_data.get('name', f'Section {section_idx}').upper()
    
    sub_data = cmd_data.get('subs', {}).get(subsec_idx, {})
    subsec_name = sub_data.get('name', f'Subsection {subsec_idx}')
    default_name = sub_data.get('name', f'Sub {subsec_idx}')
    
    return f"""// Section {section_idx} - Subsection {subsec_idx} ({subsec_name})
[
    "CMDWHEEL_action{section_idx}_sub{subsec_idx}_enabled",
    "CHECKBOX",
    ["Use Custom Subcommand ({subsec_name})", "Enable custom subcommand for {section_name} > {subsec_name}"],
    [_category, "Section {section_idx} - {section_name} > Subcommands"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action{section_idx}_sub{subsec_idx}_name",
    "EDITBOX",
    ["Subcommand Name", "Display name for this subcommand"],
    [_category, "Section {section_idx} - {section_name} > Subcommands"],
    "{default_name}",
    1
] call CBA_fnc_addSetting;

[
    "CMDWHEEL_action{section_idx}_sub{subsec_idx}_code",
    "EDITBOX",
    ["Subcommand Code", "SQF code to execute"],
    [_category, "Section {section_idx} - {section_name} > Subcommands"],
    "",
    1
] call CBA_fnc_addSetting;
"""

def generate_preinit():
    """Generate the complete XEH_preInit.sqf file"""
    
    content = """// Register settings for each command wheel action
private _category = "Command Wheel";

"""
    
    # Generate settings for all 8 main sections
    for section_idx in range(8):
        content += generate_main_section_settings(section_idx)
        content += "\n"
    
    # Generate settings for all subsections
    for section_idx in range(8):
        cmd_data = COMMANDS.get(section_idx, {})
        if 'subs' in cmd_data:
            for subsec_idx in range(4):
                if subsec_idx in cmd_data['subs']:
                    content += generate_subsection_settings(section_idx, subsec_idx)
                    content += "\n"
    
    return content

if __name__ == "__main__":
    output_path = "../XEH_preInit.sqf"
    
    # Generate content
    content = generate_preinit()
    
    # Write to file
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Count settings
    main_sections = sum(1 for i in range(8) if COMMANDS.get(i))
    subsections = sum(
        len(COMMANDS.get(i, {}).get('subs', {}))
        for i in range(8)
    )
    
    print(f"Generated {output_path}")
    print(f"- {main_sections} main sections with settings")
    print(f"- {subsections} subsections with settings")
    print(f"- Total: {(main_sections * 3) + (subsections * 3)} CBA settings")
