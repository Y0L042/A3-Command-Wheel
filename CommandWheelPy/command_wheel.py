from PIL import Image, ImageDraw, ImageFilter
import math
import os
import subprocess

# Configuration
IMAGE_SOURCE_DIR = "out"
PAA_OUTPUT_DIR = "../Data"
IMAGETOPAA_PATH = r"G:\Steam\steamapps\common\Arma 3 Tools\ImageToPAA\ImageToPAA.exe"

# Create directories if they don't exist
os.makedirs(IMAGE_SOURCE_DIR, exist_ok=True)
os.makedirs(PAA_OUTPUT_DIR, exist_ok=True)

# Create image with transparent background
width, height = 1024, 1024

def draw_section(draw, center_x, center_y, inner_r, outer_r, start_angle, end_angle, fill_color, outline_color, gap_angle=2):
    """Draw a circular section (pizza slice) with gap"""
    points_outer = []
    points_inner = []
    
    # Adjust angles to create gap
    start_angle += gap_angle / 2
    end_angle -= gap_angle / 2
    
    # Generate outer arc points
    steps = 50
    for i in range(steps + 1):
        angle = math.radians(start_angle + (end_angle - start_angle) * i / steps)
        x = center_x + outer_r * math.cos(angle)
        y = center_y + outer_r * math.sin(angle)
        points_outer.append((x, y))
    
    # Generate inner arc points (reversed)
    for i in range(steps + 1):
        angle = math.radians(end_angle - (end_angle - start_angle) * i / steps)
        x = center_x + inner_r * math.cos(angle)
        y = center_y + inner_r * math.sin(angle)
        points_inner.append((x, y))
    
    # Combine points to form closed polygon
    all_points = points_outer + points_inner
    
    # Draw filled section
    draw.polygon(all_points, fill=fill_color, outline=outline_color, width=2)

# Wheel parameters
center_x = width // 2
center_y = height // 2
outer_radius = 300
inner_radius = 120
sub_outer_radius = 480
sub_inner_radius = 310
gap_angle = 2
num_sections = 8
num_subsections = 4
angle_per_section = 360 / num_sections

# Halved subsection size - 2 fit on main section, 2 extend beyond
subsection_angle_multiplier = 1.5

# Arma 3 vanilla color scheme (based on default UI)
# Dark greenish-gray base with subtle transparency
section_color = (25, 35, 30, 128)  # 50% transparent dark green-gray
border_color = (80, 95, 85, 0)  # No visible borders

# Main section highlight - Arma 3 orange/amber
highlight_fill = (220, 140, 60, 180)  # Arma orange with transparency
highlight_glow = (240, 160, 80, 120)  # Lighter orange glow
highlight_border = (200, 120, 40, 220)  # Darker orange border

# Subcommand highlight - Arma 3 blue-cyan accent
sub_highlight_fill = (60, 140, 180, 180)  # Arma cyan-blue
sub_highlight_glow = (80, 160, 200, 120)  # Lighter blue glow
sub_highlight_border = (40, 120, 160, 220)  # Darker blue border

# Create base wheel WITHOUT subcommand ring
print("Creating base wheel...")
image = Image.new('RGBA', (width, height), (0, 0, 0, 0))
draw = ImageDraw.Draw(image)

# Draw all 8 main sections
for i in range(num_sections):
    start_angle = i * angle_per_section - 90
    end_angle = (i + 1) * angle_per_section - 90
    
    draw_section(
        draw, 
        center_x, 
        center_y, 
        inner_radius, 
        outer_radius, 
        start_angle, 
        end_angle, 
        section_color, 
        border_color
    )

# Draw center circle (transparent)
draw.ellipse(
    [center_x - inner_radius, center_y - inner_radius, 
     center_x + inner_radius, center_y + inner_radius],
    fill=(0, 0, 0, 0),  # Fully transparent center
    outline=border_color,
    width=2
)

# Draw outer ring
draw.ellipse(
    [center_x - outer_radius, center_y - outer_radius,
     center_x + outer_radius, center_y + outer_radius],
    fill=None,
    outline=border_color,
    width=2
)

image.save(f'{IMAGE_SOURCE_DIR}/command_wheel.png', 'PNG')
print("Base wheel saved")

# Create main section highlight overlays
print("\nCreating main section highlights...")
for section_num in range(num_sections):
    overlay = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    
    start_angle = section_num * angle_per_section - 90
    end_angle = (section_num + 1) * angle_per_section - 90
    
    # Draw outer glow layer
    draw_section(
        draw,
        center_x,
        center_y,
        inner_radius - 5,
        outer_radius + 5,
        start_angle,
        end_angle,
        highlight_glow,
        (240, 160, 80, 80),
        gap_angle
    )
    
    overlay = overlay.filter(ImageFilter.GaussianBlur(radius=8))
    
    # Draw main highlighted section
    draw = ImageDraw.Draw(overlay)
    draw_section(
        draw,
        center_x,
        center_y,
        inner_radius,
        outer_radius,
        start_angle,
        end_angle,
        highlight_fill,
        highlight_border,
        gap_angle
    )
    
    filename = f'{IMAGE_SOURCE_DIR}/command_wheel_section_{section_num}.png'
    overlay.save(filename, 'PNG')
    print(f"Created: section_{section_num}")

# Create subcommand base overlays
print("\nCreating subcommand base overlays...")
for section_num in range(num_sections):
    overlay = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    
    main_start_angle = section_num * angle_per_section - 90
    main_end_angle = (section_num + 1) * angle_per_section - 90
    main_center_angle = (main_start_angle + main_end_angle) / 2
    
    # Calculate subsection angles - centered on main section
    base_sub_angle = angle_per_section / num_subsections
    wide_sub_angle = base_sub_angle * subsection_angle_multiplier
    
    # Start from center and work outward
    for j in range(num_subsections):
        # Calculate offset from center
        offset_from_center = (j - (num_subsections - 1) / 2) * wide_sub_angle
        
        sub_start_angle = main_center_angle + offset_from_center - wide_sub_angle / 2
        sub_end_angle = main_center_angle + offset_from_center + wide_sub_angle / 2
        
        draw_section(
            draw,
            center_x,
            center_y,
            sub_inner_radius,
            sub_outer_radius,
            sub_start_angle,
            sub_end_angle,
            section_color,
            border_color,
            gap_angle * 0.5
        )
    
    # No border outlines for subbase
    
    filename = f'{IMAGE_SOURCE_DIR}/command_wheel_subbase_{section_num}.png'
    overlay.save(filename, 'PNG')
    print(f"Created: subbase_{section_num}")

# Create subcommand highlight overlays
print("\nCreating subcommand highlights...")
for section_num in range(num_sections):
    main_start_angle = section_num * angle_per_section - 90
    main_end_angle = (section_num + 1) * angle_per_section - 90
    main_center_angle = (main_start_angle + main_end_angle) / 2
    
    base_sub_angle = angle_per_section / num_subsections
    wide_sub_angle = base_sub_angle * subsection_angle_multiplier
    
    for sub_num in range(num_subsections):
        overlay = Image.new('RGBA', (width, height), (0, 0, 0, 0))
        draw = ImageDraw.Draw(overlay)
        
        offset_from_center = (sub_num - (num_subsections - 1) / 2) * wide_sub_angle
        
        sub_start_angle = main_center_angle + offset_from_center - wide_sub_angle / 2
        sub_end_angle = main_center_angle + offset_from_center + wide_sub_angle / 2
        
        # Draw outer glow layer
        draw_section(
            draw,
            center_x,
            center_y,
            sub_inner_radius - 5,
            sub_outer_radius + 5,
            sub_start_angle,
            sub_end_angle,
            sub_highlight_glow,
            (80, 160, 200, 80),
            gap_angle * 0.5
        )
        
        overlay = overlay.filter(ImageFilter.GaussianBlur(radius=10))
        
        # Draw main highlighted subsection
        draw = ImageDraw.Draw(overlay)
        draw_section(
            draw,
            center_x,
            center_y,
            sub_inner_radius,
            sub_outer_radius,
            sub_start_angle,
            sub_end_angle,
            sub_highlight_fill,
            sub_highlight_border,
            gap_angle * 0.5
        )
        
        filename = f'{IMAGE_SOURCE_DIR}/command_wheel_sub_{section_num}_{sub_num}.png'
        overlay.save(filename, 'PNG')
        print(f"Created: sub_{section_num}_{sub_num}")

print(f"\nGeneration complete!")
print(f"- 1 base wheel")
print(f"- {num_sections} main section highlights")
print(f"- {num_sections} subcommand base overlays")
print(f"- {num_sections * num_subsections} subcommand highlights")

# Convert to PAA format
print("\n" + "="*60)
print("Converting PNG to PAA format...")
print("="*60)

if os.path.exists(IMAGETOPAA_PATH):
    png_files = [f for f in os.listdir(IMAGE_SOURCE_DIR) if f.endswith('.png')]
    
    for i, png_file in enumerate(png_files, 1):
        input_path = os.path.join(IMAGE_SOURCE_DIR, png_file)
        output_file = png_file.replace('.png', '.paa')
        output_path = os.path.join(PAA_OUTPUT_DIR, output_file)
        
        try:
            subprocess.run([IMAGETOPAA_PATH, input_path, output_path], 
                         check=True, 
                         capture_output=True)
            print(f"[{i}/{len(png_files)}] Converted: {png_file} -> {output_file}")
        except subprocess.CalledProcessError as e:
            print(f"[{i}/{len(png_files)}] Failed: {png_file} - {e}")
        except Exception as e:
            print(f"[{i}/{len(png_files)}] Error: {png_file} - {e}")
    
    print(f"\nConversion complete! PAA files saved to: {PAA_OUTPUT_DIR}")
else:
    print(f"\nWARNING: ImageToPAA not found at: {IMAGETOPAA_PATH}")
    print("Please update IMAGETOPAA_PATH variable with correct path")
    print(f"PNG files are available in: {IMAGE_SOURCE_DIR}")