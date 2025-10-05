// Add action to open command wheel
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
    "User20"
];