// ============================================================================
// PATH CONFIGURATION FOR HYBRID MISSION/MOD DEVELOPMENT
// ============================================================================
//
// This file defines path macros that change based on development context:
// - MISSION MODE: Uses relative paths for testing in missions
// - MOD MODE: Uses absolute PBO paths for addon building
//
// Usage:
//   #include "paths.hpp"
//   #include PATH_UI"CommandWheel.hpp"
//   text = PATH_DATA"command_wheel.paa";
//
// ============================================================================

// Mission mode: Use relative paths
#ifdef __MISSION_MODE__
    #define PATH_PREFIX ""
    #define PATH_UI "UI\"
    #define PATH_FUNCTIONS "Functions\"
    #define PATH_DATA "Data\"

// Mod mode: Use absolute PBO paths (default)
#else
    #define PATH_PREFIX "\cmdwheel_command_wheel\"
    #define PATH_UI "\cmdwheel_command_wheel\UI\"
    #define PATH_FUNCTIONS "\cmdwheel_command_wheel\Functions\"
    #define PATH_DATA "\cmdwheel_command_wheel\data\"
#endif
