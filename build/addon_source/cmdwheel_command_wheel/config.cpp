class CfgPatches {
    class cmdwheel_command_wheel {
        name = "Command Wheel";
        author = "Y0L042";
        url = "https://github.com/Y0L042/A3-Command-Wheel";
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.00;
        requiredAddons[] = {"A3_Data_F", "cba_settings"};  // CBA required for settings
        version = "1.0.0";
        versionStr = "1.0.0";
        versionAr[] = {1,0,0};
    };
};

// ============================================================================
// DIALOG DEFINITIONS
// ============================================================================
#include "\cmdwheel_command_wheel\UI\BaseControls.hpp"
#include "\cmdwheel_command_wheel\UI\CommandWheel.hpp"

// ============================================================================
// EXTENDED EVENT HANDLERS
// ============================================================================
class Extended_PreInit_EventHandlers {
    class CMDWHEEL {
        init = "call compile preprocessFileLineNumbers '\cmdwheel_command_wheel\XEH_preInit.sqf'";
    };
};

// ============================================================================
// FUNCTIONS
// ============================================================================
class CfgFunctions {
    class CMDWHEEL {
        tag = "CMDWHEEL";
        
        // Core initialization functions
        class init {
            file = "\cmdwheel_command_wheel\functions";
            class initCommandWheel {
                postInit = 1;  // Auto-initialize when mod loads
            };
        };
        
        // Main command wheel functions
        class Functions {
            file = "\cmdwheel_command_wheel\functions";
 
            class wheelLoop {};
            class wheelClick {};
            class load {};
            class unload {};
            class executeAction {};
            class getCommandUnits {};

            class hold {};
            class regroup {};
            class moveThere {};
            class gogogo {};
            class teleportToMe {};
            class prone {};
            class getUp {};
            class matchStance {};
            class stealthHoldFire {};
            class alert {};
            class garrison {};
            
            // Wrapper functions (main sections 00-07)
            class 00 {};
            class 00_0 {};
            class 00_1 {};
            class 00_2 {};
            class 00_3 {};
            
            // Section 1 (FLANK) subcommands
            class 01 {};
            class 01_0 {};
            class 01_1 {};
            class 01_2 {};
            class 01_3 {};
            
            // Section 2 (FOLLOW) subcommands
            class 02 {};
            class 02_0 {};
            class 02_1 {};
            class 02_2 {};
            class 02_3 {};
            
            // Section 3 (SUPPRESS) subcommands
            class 03 {};
            class 03_0 {};
            class 03_1 {};
            class 03_2 {};
            class 03_3 {};
            
            // Section 4 (STOP) subcommands
            class 04 {};
            class 04_0 {};
            class 04_1 {};
            class 04_2 {};
            class 04_3 {};
            
            // Section 5 (REGROUP) subcommands
            class 05 {};
            class 05_0 {};
            class 05_1 {};
            class 05_2 {};
            class 05_3 {};
            
            // Section 6 (COVER) subcommands
            class 06 {};
            class 06_0 {};
            class 06_1 {};
            class 06_2 {};
            class 06_3 {};
            
            // Section 7 (ADVANCE) subcommands
            class 07 {};
            class 07_0 {};
            class 07_1 {};
            class 07_2 {};
            class 07_3 {};
        };
    };
};