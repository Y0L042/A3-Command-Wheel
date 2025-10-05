class CommandWheel {
    idd = 9000;
    movingEnable = 1;
    enableSimulation = 1;
    disableSerialization = 1;
    onLoad = "_this call CMDWHEEL_fnc_load;";
    onUnload = "_this call CMDWHEEL_fnc_unload;";

    class controlsBackground {
        class Background: RscText {
            idc = -1;
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        
        class WheelBase: RscPicture {
            idc = 9001;
            text = "data\command_wheel.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
        };
    };
    
    class controls {
        class SectionHighlight0: RscPicture {
            idc = 9010;
            text = "data\command_wheel_section_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight1: RscPicture {
            idc = 9011;
            text = "data\command_wheel_section_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight2: RscPicture {
            idc = 9012;
            text = "data\command_wheel_section_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight3: RscPicture {
            idc = 9013;
            text = "data\command_wheel_section_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight4: RscPicture {
            idc = 9014;
            text = "data\command_wheel_section_4.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight5: RscPicture {
            idc = 9015;
            text = "data\command_wheel_section_5.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight6: RscPicture {
            idc = 9016;
            text = "data\command_wheel_section_6.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SectionHighlight7: RscPicture {
            idc = 9017;
            text = "data\command_wheel_section_7.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        
        // Subcommand base overlays (shown when submenus are active)
        class SubBase0: RscPicture {
            idc = 9040;
            text = "data\command_wheel_subbase_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase1: RscPicture {
            idc = 9041;
            text = "data\command_wheel_subbase_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase2: RscPicture {
            idc = 9042;
            text = "data\command_wheel_subbase_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase3: RscPicture {
            idc = 9043;
            text = "data\command_wheel_subbase_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase4: RscPicture {
            idc = 9044;
            text = "data\command_wheel_subbase_4.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase5: RscPicture {
            idc = 9045;
            text = "data\command_wheel_subbase_5.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase6: RscPicture {
            idc = 9046;
            text = "data\command_wheel_subbase_6.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubBase7: RscPicture {
            idc = 9047;
            text = "data\command_wheel_subbase_7.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        
        // Subcommand highlights (8 sections × 4 subsections = 32 total)
        // Section 0 subcommands
        class SubHighlight0_0: RscPicture {
            idc = 9100;
            text = "data\command_wheel_sub_0_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight0_1: RscPicture {
            idc = 9101;
            text = "data\command_wheel_sub_0_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight0_2: RscPicture {
            idc = 9102;
            text = "data\command_wheel_sub_0_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight0_3: RscPicture {
            idc = 9103;
            text = "data\command_wheel_sub_0_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 1 subcommands
        class SubHighlight1_0: RscPicture {
            idc = 9104;
            text = "data\command_wheel_sub_1_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight1_1: RscPicture {
            idc = 9105;
            text = "data\command_wheel_sub_1_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight1_2: RscPicture {
            idc = 9106;
            text = "data\command_wheel_sub_1_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight1_3: RscPicture {
            idc = 9107;
            text = "data\command_wheel_sub_1_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 2 subcommands
        class SubHighlight2_0: RscPicture {
            idc = 9108;
            text = "data\command_wheel_sub_2_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight2_1: RscPicture {
            idc = 9109;
            text = "data\command_wheel_sub_2_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight2_2: RscPicture {
            idc = 9110;
            text = "data\command_wheel_sub_2_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight2_3: RscPicture {
            idc = 9111;
            text = "data\command_wheel_sub_2_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 3 subcommands
        class SubHighlight3_0: RscPicture {
            idc = 9112;
            text = "data\command_wheel_sub_3_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight3_1: RscPicture {
            idc = 9113;
            text = "data\command_wheel_sub_3_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight3_2: RscPicture {
            idc = 9114;
            text = "data\command_wheel_sub_3_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight3_3: RscPicture {
            idc = 9115;
            text = "data\command_wheel_sub_3_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 4 subcommands
        class SubHighlight4_0: RscPicture {
            idc = 9116;
            text = "data\command_wheel_sub_4_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight4_1: RscPicture {
            idc = 9117;
            text = "data\command_wheel_sub_4_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight4_2: RscPicture {
            idc = 9118;
            text = "data\command_wheel_sub_4_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight4_3: RscPicture {
            idc = 9119;
            text = "data\command_wheel_sub_4_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 5 subcommands
        class SubHighlight5_0: RscPicture {
            idc = 9120;
            text = "data\command_wheel_sub_5_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight5_1: RscPicture {
            idc = 9121;
            text = "data\command_wheel_sub_5_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight5_2: RscPicture {
            idc = 9122;
            text = "data\command_wheel_sub_5_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight5_3: RscPicture {
            idc = 9123;
            text = "data\command_wheel_sub_5_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 6 subcommands
        class SubHighlight6_0: RscPicture {
            idc = 9124;
            text = "data\command_wheel_sub_6_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight6_1: RscPicture {
            idc = 9125;
            text = "data\command_wheel_sub_6_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight6_2: RscPicture {
            idc = 9126;
            text = "data\command_wheel_sub_6_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight6_3: RscPicture {
            idc = 9127;
            text = "data\command_wheel_sub_6_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        // Section 7 subcommands
        class SubHighlight7_0: RscPicture {
            idc = 9128;
            text = "data\command_wheel_sub_7_0.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight7_1: RscPicture {
            idc = 9129;
            text = "data\command_wheel_sub_7_1.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight7_2: RscPicture {
            idc = 9130;
            text = "data\command_wheel_sub_7_2.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        class SubHighlight7_3: RscPicture {
            idc = 9131;
            text = "data\command_wheel_sub_7_3.paa";
            x = safeZoneX + safeZoneW * 0.5 - (600 * pixelW * 0.5);
            y = safeZoneY + safeZoneH * 0.5 - (600 * pixelH * 0.5);
            w = 600 * pixelW;
            h = 600 * pixelH;
            colorText[] = {1, 1, 1, 0};
        };
        
        // 22.5° (HOLD)
        class LabelTop: RscText {
            idc = 9020;
            text = "HOLD";
            x = safeZoneX + safeZoneW * 0.5 + (45 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (-110 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.0)";
            style = 2 + 0x100;
            angle = 22.5;
        };
        // 67.5° (PRONE)
        class LabelTopRight: RscText {
            idc = 9021;
            text = "PRONE";
            x = safeZoneX + safeZoneW * 0.5 + (110 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (-45 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.0)";
            style = 2 + 0x100;
            angle = 67.5;
        };
        // 112.5° (STEALTH)
        class LabelRight: RscText {
            idc = 9022;
            text = "STEALTH";
            x = safeZoneX + safeZoneW * 0.5 + (110 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (45 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.0)";
            style = 2 + 0x100;
            angle = 112.5;
        };
        // 157.5° (COLUMN)
        class LabelBottomRight: RscText {
            idc = 9023;
            text = "COLUMN";
            x = safeZoneX + safeZoneW * 0.5 + (45 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (110 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.0)";
            style = 2 + 0x100;
            angle = 157.5;
        };
        // 202.5° (SUPPRESSIVE FIRE)
        class LabelBottom: RscText {
            idc = 9024;
            text = "SUPPRESSIVE FIRE";
            x = safeZoneX + safeZoneW * 0.5 + (-45 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (110 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.0)";
            style = 2 + 0x100;
            angle = 202.5;
        };
        // 337.5° (TELEPORT TO ME)
        class LabelTopLeft: RscText {
            idc = 9027;
            text = "TELEPORT TO ME";
            x = safeZoneX + safeZoneW * 0.5 + (-45 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (-110 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.0)";
            style = 2 + 0x100;
            angle = 337.5;
        };
        
        // Subcommand Labels (outer ring)

        // Section 0 (HOLD) subcommand labels
        class SubLabel0_0: RscText {
    idc = 9200;
    text = "REGROUP";
    x = safeZoneX + safeZoneW * 0.5 + (-11 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-239 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = -2.81;
};
        class SubLabel0_1: RscText {
    idc = 9201;
    text = "MOVE THERE";
    x = safeZoneX + safeZoneW * 0.5 + (58 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-232 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 14.06;
};
        class SubLabel0_2: RscText {
    idc = 9202;
    text = "GOGOGO!";
    x = safeZoneX + safeZoneW * 0.5 + (123 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-205 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 30.94;
};
        class SubLabel0_3: RscText {
    idc = 9203;
    text = "GARRISON";
    x = safeZoneX + safeZoneW * 0.5 + (177 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-161 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 47.81;
};

        // Section 1 (PRONE) subcommand labels
        class SubLabel1_0: RscText {
    idc = 9204;
    text = "GET UP";
    x = safeZoneX + safeZoneW * 0.5 + (161 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-177 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 42.19;
};
        class SubLabel1_1: RscText {
    idc = 9205;
    text = "MATCH MY STANCE";
    x = safeZoneX + safeZoneW * 0.5 + (205 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-123 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 59.06;
};
        class SubLabel1_2: RscText {
    idc = 9206;
    text = "FIND COVER";
    x = safeZoneX + safeZoneW * 0.5 + (232 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-58 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 75.94;
};
        class SubLabel1_3: RscText {
    idc = 9207;
    text = "PRONE";
    x = safeZoneX + safeZoneW * 0.5 + (239 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (11 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 92.81;
};

        // Section 2 (STEALTH) subcommand labels
        class SubLabel2_0: RscText {
    idc = 9208;
    text = "ALERT";
    x = safeZoneX + safeZoneW * 0.5 + (239 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (-11 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 87.19;
};
        class SubLabel2_1: RscText {
    idc = 9209;
    text = "TARGET ENEMY";
    x = safeZoneX + safeZoneW * 0.5 + (232 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (58 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 104.06;
};
        class SubLabel2_2: RscText {
    idc = 9210;
    text = "HEAL SOLDIER";
    x = safeZoneX + safeZoneW * 0.5 + (205 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (123 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 120.94;
};
        class SubLabel2_3: RscText {
    idc = 9211;
    text = "DISENGAGE";
    x = safeZoneX + safeZoneW * 0.5 + (161 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (177 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 137.81;
};

        // Section 3 (COLUMN) subcommand labels
        class SubLabel3_0: RscText {
    idc = 9212;
    text = "STAGGERED COLUMN";
    x = safeZoneX + safeZoneW * 0.5 + (177 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (161 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 132.19;
};
        class SubLabel3_1: RscText {
    idc = 9213;
    text = "WEDGE";
    x = safeZoneX + safeZoneW * 0.5 + (123 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (205 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 149.06;
};
        class SubLabel3_2: RscText {
    idc = 9214;
    text = "FILE";
    x = safeZoneX + safeZoneW * 0.5 + (58 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (232 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 165.94;
};
        class SubLabel3_3: RscText {
    idc = 9215;
    text = "LINE";
    x = safeZoneX + safeZoneW * 0.5 + (-11 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (239 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 182.81;
};

        // Section 4 (SUPPRESSIVE FIRE) subcommand labels
        class SubLabel4_0: RscText {
    idc = 9216;
    text = "FORCED SUPPRESSIVE FIRE";
    x = safeZoneX + safeZoneW * 0.5 + (11 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (239 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 177.19;
};
        class SubLabel4_1: RscText {
    idc = 9217;
    text = "TARGET ENEMY";
    x = safeZoneX + safeZoneW * 0.5 + (-58 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (232 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 194.06;
};
        class SubLabel4_2: RscText {
    idc = 9218;
    text = "HEAL SOLDIER";
    x = safeZoneX + safeZoneW * 0.5 + (-123 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (205 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 210.94;
};
        class SubLabel4_3: RscText {
    idc = 9219;
    text = "DISENGAGE";
    x = safeZoneX + safeZoneW * 0.5 + (-177 * pixelW) - (2.0 * GUI_GRID_CENTER_W);
    y = safeZoneY + safeZoneH * 0.5 + (161 * pixelH) - (0.4 * GUI_GRID_CENTER_H);
    w = 4 * GUI_GRID_CENTER_W;
    h = 0.8 * GUI_GRID_CENTER_H;
    colorText[] = {0.7, 0.9, 1, 0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    style = 2 + 0x100;
    angle = 227.81;
};

        // Section 5 (empty) subcommand labels

        // Section 6 (empty) subcommand labels

        // Section 7 (TELEPORT TO ME) subcommand labels
    };
};