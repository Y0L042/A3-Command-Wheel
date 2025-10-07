/*
 * Author: Y0L042
 * Function: CMDWHEEL_fnc_initCommandWheel
 * Description: Initialize the Command Wheel mod when the game starts
 * This replaces the old init.sqf and runs automatically via postInit
 * 
 * Returns: Nothing
 * 
 * Public: No
 */

// Only run on player clients, not on dedicated servers
if (!hasInterface) exitWith {};

// Wait for player to be initialized
waitUntil {!isNull player && isPlayer player};

// Add keybind action to open command wheel
player addAction [
    "Open Command Wheel",
    {
        if (isNull (findDisplay 9000)) then {
            createDialog "CommandWheel";
        };
    },
    nil,
    0,
    false,
    true,
    "User20"  // Default keybind: Y key
];

// Optional: Add system notification
systemChat "Command Wheel mod loaded! Press Y to open.";

// Log initialization
diag_log "[CMDWHEEL] Command Wheel initialized successfully";
