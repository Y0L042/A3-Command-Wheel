player addAction [
    "Open Command Wheel",
    {
        if (isNull (findDisplay 9000)) then {
            createDialog "CommandWheel";
            systemChat "Command Wheel opened";
        };
    },
    nil,
    0,
    false,
    true,
    "User20"
];