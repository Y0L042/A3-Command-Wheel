import math
import os
from commands import COMMANDS

# ============================================================================
# CONFIGURATION - Adjust these values to customize your command wheel
# ============================================================================

# Wheel dimensions (in pixels, for 1024x1024 source image)
WHEEL_SIZE_PIXELS = 600  # Size of the wheel image in Arma

# Main section labels
MAIN_LABEL_RADIUS = 120  # Distance from center for main section labels (pixels)
MAIN_LABEL_OFFSET_ANGLE = 22.5  # Clockwise rotation offset for main labels (degrees)
MAIN_LABEL_WIDTH = 5  # Width in GUI_GRID_CENTER_W units
MAIN_LABEL_HEIGHT = 1  # Height in GUI_GRID_CENTER_H units
MAIN_LABEL_FONT_SIZE = 1.0  # Font size multiplier
MAIN_LABEL_COLOR = [1, 1, 1, 1]  # RGBA color (white, fully opaque)

# Subsection labels
SUBSECTION_SPREAD_MULTIPLIER = 1.5  # 1.0 = normal spread, 1.5 = wider, 0.7 = tighter
SUBLABEL_RADIUS = 240  # Distance from center for subsection labels (pixels)
SUBLABEL_OFFSET_ANGLE = 22.5  # Additional clockwise rotation offset (degrees)
SUBLABEL_WIDTH = 4  # Width in GUI_GRID_CENTER_W units
SUBLABEL_HEIGHT = 0.8  # Height in GUI_GRID_CENTER_H units
SUBLABEL_FONT_SIZE = 0.8  # Font size multiplier
SUBLABEL_COLOR = [0.7, 0.9, 1, 0]  # RGBA color (cyan-ish, initially hidden)

# Output configuration
OUTPUT_DIR = "../UI"
OUTPUT_FILENAME = "CommandWheel.hpp"
DATA_PATH = "data"  # Path to .paa files relative to mission/mod root

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

def get_main_section_name(section_num):
    """Get main section name from COMMANDS dict, or return empty string"""
    cmd = COMMANDS.get(section_num, {})
    return cmd.get('name', '').upper() if cmd.get('name') else ''

def get_subsection_name(section_num, subsec_num):
    """Get subsection name from COMMANDS dict, or return empty string"""
    cmd = COMMANDS.get(section_num, {})
    if 'subs' in cmd:
        sub = cmd['subs'].get(subsec_num, {})
        return sub.get('name', '').upper() if sub.get('name') else ''
    return ''

def calculate_position(radius, angle_deg):
    """Calculate x,y pixel offsets from center given radius and angle"""
    angle_rad = math.radians(angle_deg)
    x = int(radius * math.sin(angle_rad))
    y = int(-radius * math.cos(angle_rad))
    return x, y

def format_color(color):
    """Format RGBA color array for config"""
    return "{" + ", ".join(str(c) for c in color) + "}"

def generate_main_label(section_num):
    """Generate config for a main section label"""
    section_name = get_main_section_name(section_num)
    if not section_name:
        return ""  # Don't generate label for empty sections
    
    base_angle = section_num * 45  # 8 sections = 45° each
    final_angle = base_angle + MAIN_LABEL_OFFSET_ANGLE
    x, y = calculate_position(MAIN_LABEL_RADIUS, final_angle)
    
    position_names = ['Top', 'TopRight', 'Right', 'BottomRight', 'Bottom', 'BottomLeft', 'Left', 'TopLeft']
    
    return f"""
        // {final_angle}° ({section_name})
        class Label{position_names[section_num]}: RscText {{
            idc = {9020 + section_num};
            text = "{section_name}";
            x = safeZoneX + safeZoneW * 0.5 + ({x} * pixelW) - ({MAIN_LABEL_WIDTH/2} * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + ({y} * pixelH) - ({MAIN_LABEL_HEIGHT/2} * GUI_GRID_CENTER_H);
            w = {MAIN_LABEL_WIDTH} * GUI_GRID_CENTER_W;
            h = {MAIN_LABEL_HEIGHT} * GUI_GRID_CENTER_H;
            colorText[] = {format_color(MAIN_LABEL_COLOR)};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * {MAIN_LABEL_FONT_SIZE})";
            style = 2 + 0x100;
            angle = {final_angle};
        }};"""

def generate_sublabel(section_num, subsec_num):
    """Generate config for a subsection label"""
    subsec_name = get_subsection_name(section_num, subsec_num)
    if not subsec_name:
        return ""  # Don't generate label for empty subsections
    
    # Calculate subsection angle
    main_angle = section_num * 45
    base_spread = 11.25 * SUBSECTION_SPREAD_MULTIPLIER
    center_offset = base_spread * 1.5  # Center the 4 subsections around the main section
    subsec_base_angle = subsec_num * base_spread - center_offset
    final_angle = main_angle + subsec_base_angle + SUBLABEL_OFFSET_ANGLE
    
    x, y = calculate_position(SUBLABEL_RADIUS, final_angle)
    idc = 9200 + section_num * 4 + subsec_num
    
    return f"""class SubLabel{section_num}_{subsec_num}: RscText {{
    idc = {idc};
    text = "{subsec_name}";
    x = safeZoneX + safeZoneW * 0.5 + ({x} * pixelW) - ({SUBLABEL_WIDTH/2} * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + ({y} * pixelH) - ({SUBLABEL_HEIGHT/2} * GUI_GRID_CENTER_H);
    w = {SUBLABEL_WIDTH} * GUI_GRID_CENTER_W;
    h = {SUBLABEL_HEIGHT} * GUI_GRID_CENTER_H;
    colorText[] = {format_color(SUBLABEL_COLOR)};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * {SUBLABEL_FONT_SIZE})";
    style = 2 + 0x100;
    angle = {final_angle:.2f};
}};"""

# ============================================================================
# MAIN GENERATION
# ============================================================================

def generate_command_wheel():
    """Generate the complete CommandWheel.hpp file"""
    
    config = f"""class CommandWheel {{
    idd = 9000;
    movingEnable = 1;
    enableSimulation = 1;
    disableSerialization = 1;
    onLoad = "_this call CMDWHEEL_fnc_load;";
    onUnload = "_this call CMDWHEEL_fnc_unload;";

    class controlsBackground {{
        class Background: RscText {{
            idc = -1;
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
            colorBackground[] = {{0, 0, 0, 0.7}};
        }};
        
        class WheelBase: RscPicture {{
            idc = 9001;
            text = "{DATA_PATH}\\command_wheel.paa";
            x = safeZoneX + safeZoneW * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelH * 0.5);
            w = {WHEEL_SIZE_PIXELS} * pixelW;
            h = {WHEEL_SIZE_PIXELS} * pixelH;
        }};
    }};
    
    class controls {{"""

    # Main section highlights
    for i in range(8):
        config += f"""
        class SectionHighlight{i}: RscPicture {{
            idc = {9010 + i};
            text = "{DATA_PATH}\\command_wheel_section_{i}.paa";
            x = safeZoneX + safeZoneW * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelH * 0.5);
            w = {WHEEL_SIZE_PIXELS} * pixelW;
            h = {WHEEL_SIZE_PIXELS} * pixelH;
            colorText[] = {{1, 1, 1, 0}};
        }};"""

    # Subcommand base overlays
    config += "\n        \n        // Subcommand base overlays (shown when submenus are active)"
    for i in range(8):
        config += f"""
        class SubBase{i}: RscPicture {{
            idc = {9040 + i};
            text = "{DATA_PATH}\\command_wheel_subbase_{i}.paa";
            x = safeZoneX + safeZoneW * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelH * 0.5);
            w = {WHEEL_SIZE_PIXELS} * pixelW;
            h = {WHEEL_SIZE_PIXELS} * pixelH;
            colorText[] = {{1, 1, 1, 0}};
        }};"""

    # Subcommand highlights
    config += "\n        \n        // Subcommand highlights (8 sections × 4 subsections = 32 total)"
    for section in range(8):
        config += f"\n        // Section {section} subcommands"
        for subsec in range(4):
            idc = 9100 + section * 4 + subsec
            config += f"""
        class SubHighlight{section}_{subsec}: RscPicture {{
            idc = {idc};
            text = "{DATA_PATH}\\command_wheel_sub_{section}_{subsec}.paa";
            x = safeZoneX + safeZoneW * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - ({WHEEL_SIZE_PIXELS} * pixelH * 0.5);
            w = {WHEEL_SIZE_PIXELS} * pixelW;
            h = {WHEEL_SIZE_PIXELS} * pixelH;
            colorText[] = {{1, 1, 1, 0}};
        }};"""

    # Main section labels
    config += "\n        "
    for i in range(8):
        label = generate_main_label(i)
        if label:
            config += label

    # Subsection labels
    config += "\n        \n        // Subcommand Labels (outer ring)"
    for section in range(8):
        section_name = get_main_section_name(section)
        if section_name:
            config += f"\n\n        // Section {section} ({section_name}) subcommand labels"
        else:
            config += f"\n\n        // Section {section} (empty) subcommand labels"
        
        for subsec in range(4):
            label = generate_sublabel(section, subsec)
            if label:
                config += "\n        " + label

    config += """
    };
};"""

    return config

# ============================================================================
# WRITE TO FILE
# ============================================================================

if __name__ == "__main__":
    # Create output directory if it doesn't exist
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    # Generate config
    config_content = generate_command_wheel()
    
    # Write to file
    output_path = os.path.join(OUTPUT_DIR, OUTPUT_FILENAME)
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
    print(f"\nConfiguration used:")
    print(f"  Main label radius: {MAIN_LABEL_RADIUS}px")
    print(f"  Main label offset: {MAIN_LABEL_OFFSET_ANGLE}°")
    print(f"  Sublabel radius: {SUBLABEL_RADIUS}px")
    print(f"  Sublabel offset: {SUBLABEL_OFFSET_ANGLE}°")