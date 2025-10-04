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
        
        class WheelBase: RscText {
            idc = 9001;
            x = GUI_GRID_CENTER_X + 12 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 8 * GUI_GRID_CENTER_H;
            w = 16 * GUI_GRID_CENTER_W;
            h = 9 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.1, 0.1, 0.1, 0.9};
        };
        
        class SectorMove: RscText {
            idc = 9010;
            x = GUI_GRID_CENTER_X + 17 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 8 * GUI_GRID_CENTER_H;
            w = 6 * GUI_GRID_CENTER_W;
            h = 4 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.3, 0.3, 0.3, 0.8};
        };
        
        class SectorFollow: RscText {
            idc = 9011;
            x = GUI_GRID_CENTER_X + 23 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 11 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 6 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.3, 0.3, 0.3, 0.8};
        };
        
        class SectorHold: RscText {
            idc = 9012;
            x = GUI_GRID_CENTER_X + 17 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 13 * GUI_GRID_CENTER_H;
            w = 6 * GUI_GRID_CENTER_W;
            h = 4 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.3, 0.3, 0.3, 0.8};
        };
        
        class SectorRegroup: RscText {
            idc = 9013;
            x = GUI_GRID_CENTER_X + 12 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 11 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 6 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.3, 0.3, 0.3, 0.8};
        };
        
        class Center: RscText {
            idc = 9002;
            x = GUI_GRID_CENTER_X + 18 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H;
            w = 4 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };
    };
    
    class controls {
        class LabelMove: RscText {
            idc = 9020;
            text = "MOVE";
            x = GUI_GRID_CENTER_X + 17 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 9 * GUI_GRID_CENTER_H;
            w = 6 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
            style = 2;
        };
        
        class LabelFollow: RscText {
            idc = 9021;
            text = "FOLLOW";
            x = GUI_GRID_CENTER_X + 23 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 12.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
            style = 2;
        };
        
        class LabelHold: RscText {
            idc = 9022;
            text = "HOLD";
            x = GUI_GRID_CENTER_X + 17 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 14 * GUI_GRID_CENTER_H;
            w = 6 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
            style = 2;
        };
        
        class LabelRegroup: RscText {
            idc = 9023;
            text = "REGROUP";
            x = GUI_GRID_CENTER_X + 12 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 12.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            colorText[] = {1, 1, 1, 1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
            style = 2;
        };
    };
};