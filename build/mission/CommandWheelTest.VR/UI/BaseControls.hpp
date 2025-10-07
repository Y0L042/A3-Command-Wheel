#include "\a3\ui_f\hpp\defineCommonGrids.inc"

class RscText {
    access = 0;
    type = 0;
    idc = -1;
    style = 0;
    text = "";
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    font = "RobotoCondensed";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
};

class RscPicture {
    access = 0;
    type = 0;
    idc = -1;
    style = 48;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class RscButton {
    access = 0;
    type = 1;
    style = 0;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {0.4, 0.4, 0.4, 1};
    colorBackground[] = {0, 0, 0, 0.8};
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {0, 0, 0, 1};
    colorFocused[] = {0, 0, 0, 1};
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
    idc = -1;
    font = "RobotoCondensed";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    shadow = 2;
    borderSize = 0;
};