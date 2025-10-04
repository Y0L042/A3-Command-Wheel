class CommandWheel {
    idd = 9000;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "uiNamespace setVariable ['CommandWheel_Display', _this select 0]; call CMDWHEEL_fnc_wheelLoop;";
    onUnload = "uiNamespace setVariable ['CommandWheel_Active', false];";
    
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
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
        };
        
        class SectionHighlight0: RscPicture {
            idc = 9010;
            text = "data\command_wheel_section_0.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight1: RscPicture {
            idc = 9011;
            text = "data\command_wheel_section_1.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight2: RscPicture {
            idc = 9012;
            text = "data\command_wheel_section_2.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight3: RscPicture {
            idc = 9013;
            text = "data\command_wheel_section_3.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight4: RscPicture {
            idc = 9014;
            text = "data\command_wheel_section_4.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight5: RscPicture {
            idc = 9015;
            text = "data\command_wheel_section_5.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight6: RscPicture {
            idc = 9016;
            text = "data\command_wheel_section_6.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
        
        class SectionHighlight7: RscPicture {
            idc = 9017;
            text = "data\command_wheel_section_7.paa";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 6.5 * GUI_GRID_CENTER_H;
            w = 20 * GUI_GRID_CENTER_W;
            h = 12 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 0};
        };
    };
    
    class controls {
        class LabelTop: RscText {
            idc = 9020;
            text = "MOVE";
            x = GUI_GRID_CENTER_X + 17.5 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 7.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelTopRight: RscText {
            idc = 9021;
            text = "FLANK";
            x = GUI_GRID_CENTER_X + 22 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 9.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelRight: RscText {
            idc = 9022;
            text = "FOLLOW";
            x = GUI_GRID_CENTER_X + 23 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 12 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelBottomRight: RscText {
            idc = 9023;
            text = "HOLD";
            x = GUI_GRID_CENTER_X + 22 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 14.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelBottom: RscText {
            idc = 9024;
            text = "STOP";
            x = GUI_GRID_CENTER_X + 17.5 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 16 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelBottomLeft: RscText {
            idc = 9025;
            text = "REGROUP";
            x = GUI_GRID_CENTER_X + 11 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 14.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelLeft: RscText {
            idc = 9026;
            text = "COVER";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 12 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
        
        class LabelTopLeft: RscText {
            idc = 9027;
            text = "ADVANCE";
            x = GUI_GRID_CENTER_X + 11 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 9.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            style = 2;
        };
    };
};