class CommandWheel {
    idd = 9000;
    movingEnable = 0;
    enableSimulation = 1;
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
        




        
        // 22.5° (MOVE at top-right of vertical)
        class LabelTop: RscText {
            idc = 9020;
            text = "MOVE";
            x = safeZoneX + safeZoneW * 0.5 + (46 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 - (111 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 22.5;
        };

        // 67.5° (FLANK)
        class LabelTopRight: RscText {
            idc = 9021;
            text = "FLANK";
            x = safeZoneX + safeZoneW * 0.5 + (111 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 - (46 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 67.5;
        };

        // 112.5° (FOLLOW)
        class LabelRight: RscText {
            idc = 9022;
            text = "FOLLOW";
            x = safeZoneX + safeZoneW * 0.5 + (111 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (46 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 112.5;
        };

        // 157.5° (SUPPRESS)
        class LabelBottomRight: RscText {
            idc = 9023;
            text = "SUPPRESS";
            x = safeZoneX + safeZoneW * 0.5 + (46 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (111 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 157.5;
        };

        // 202.5° (STOP)
        class LabelBottom: RscText {
            idc = 9024;
            text = "STOP";
            x = safeZoneX + safeZoneW * 0.5 - (46 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (111 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 202.5;
        };

        // 247.5° (REGROUP)
        class LabelBottomLeft: RscText {
            idc = 9025;
            text = "REGROUP";
            x = safeZoneX + safeZoneW * 0.5 - (111 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 + (46 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 247.5;
        };

        // 292.5° (COVER)
        class LabelLeft: RscText {
            idc = 9026;
            text = "COVER";
            x = safeZoneX + safeZoneW * 0.5 - (111 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 - (46 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 292.5;
        };

        // 337.5° (ADVANCE)
        class LabelTopLeft: RscText {
            idc = 9027;
            text = "ADVANCE";
            x = safeZoneX + safeZoneW * 0.5 - (46 * pixelW) - (2.5 * GUI_GRID_CENTER_W);
            y = safeZoneY + safeZoneH * 0.5 - (111 * pixelH) - (0.5 * GUI_GRID_CENTER_H);
            w = 5 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2 + 0x100;
            angle = 337.5;
        };
    };
};