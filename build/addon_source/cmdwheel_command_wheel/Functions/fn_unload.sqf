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
private _ehMouseDown = uiNamespace getVariable ['CommandWheel_MouseDownEH', -1];
if (_ehMouseDown != -1) then {
    (findDisplay 46) displayRemoveEventHandler ['MouseButtonDown', _ehMouseDown];
    uiNamespace setVariable ['CommandWheel_MouseDownEH', -1];
};

// Remove MouseButtonUp event handler
private _ehMouseUp = uiNamespace getVariable ['CommandWheel_MouseUpEH', -1];
if (_ehMouseUp != -1) then {
    (findDisplay 46) displayRemoveEventHandler ['MouseButtonUp', _ehMouseUp];
    uiNamespace setVariable ['CommandWheel_MouseUpEH', -1];
};

// Reset mouse state variables
uiNamespace setVariable ['CommandWheel_MouseButtonHeld', false];
uiNamespace setVariable ['CommandWheel_LockedSection', -1];
uiNamespace setVariable ['CommandWheel_MouseDownTime', -1];
