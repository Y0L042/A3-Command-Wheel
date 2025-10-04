// Command Wheel onUnload handler
// Cleanup all event handlers and state

uiNamespace setVariable ['CommandWheel_Active', false];

// Remove EachFrame event handler
private _ehFrame = uiNamespace getVariable ['CommandWheel_FrameEH', -1];
if (_ehFrame != -1) then {
    removeMissionEventHandler ['EachFrame', _ehFrame];
    uiNamespace setVariable ['CommandWheel_FrameEH', -1];
};

// Remove MouseButtonDown event handler
private _ehClick = uiNamespace getVariable ['CommandWheel_MouseEH', -1];
if (_ehClick != -1) then {
    (findDisplay 46) displayRemoveEventHandler ['MouseButtonDown', _ehClick];
    uiNamespace setVariable ['CommandWheel_MouseEH', -1];
};
