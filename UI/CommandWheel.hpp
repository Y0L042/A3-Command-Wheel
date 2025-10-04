class CommandWheel {
    idd = 9000;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "uiNamespace setVariable ['CommandWheel_Display', _this select 0];";
    onUnload = "";
    
    class controlsBackground {
        class Background: RscText {
            idc = -1;
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        
        class WheelCenter: RscText {
            idc = 9001;
            x = GUI_GRID_CENTER_X + 15 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 10 * GUI_GRID_CENTER_H;
            w = 10 * GUI_GRID_CENTER_W;
            h = 5 * GUI_GRID_CENTER_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.8};
        };
    };
    
    class controls {
        class ButtonMove: RscButton {
            idc = 9010;
            text = "MOVE";
            x = GUI_GRID_CENTER_X + 17.5 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 3 * GUI_GRID_CENTER_H;
            action = "call CMDWHEEL_fnc_move;";
        };
        
        class ButtonFollow: RscButton {
            idc = 9011;
            text = "FOLLOW";
            x = GUI_GRID_CENTER_X + 25 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 3 * GUI_GRID_CENTER_H;
            action = "call CMDWHEEL_fnc_follow;";
        };
        
        class ButtonHold: RscButton {
            idc = 9012;
            text = "HOLD";
            x = GUI_GRID_CENTER_X + 17.5 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 18 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 3 * GUI_GRID_CENTER_H;
            action = "call CMDWHEEL_fnc_hold;";
        };
        
        class ButtonRegroup: RscButton {
            idc = 9013;
            text = "REGROUP";
            x = GUI_GRID_CENTER_X + 10 * GUI_GRID_CENTER_W;
            y = GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H;
            w = 5 * GUI_GRID_CENTER_W;
            h = 3 * GUI_GRID_CENTER_H;
            action = "call CMDWHEEL_fnc_regroup;";
        };
    };
};