# Complete Subcommand Reference

## Section 0: MOVE
Move commands with different formations

### Sub 0: Wedge Formation
- **Formation**: WEDGE
- **Behavior**: AWARE
- **Speed**: NORMAL
- **Use**: Tactical advancement, good all-around formation

### Sub 1: Line Formation
- **Formation**: LINE
- **Behavior**: AWARE
- **Speed**: NORMAL
- **Use**: Assault or patrol, maximum firepower forward

### Sub 2: Column Formation
- **Formation**: COLUMN
- **Behavior**: AWARE
- **Speed**: NORMAL
- **Use**: Roads or confined spaces, file formation

### Sub 3: Staggered Column
- **Formation**: STAG COLUMN
- **Behavior**: AWARE
- **Speed**: NORMAL
- **Use**: Urban or flanking maneuvers

---

## Section 1: FLANK
Flanking maneuvers around target position

### Sub 0: Flank Left
- **Angle**: 90° left of target
- **Distance**: 50% of original distance
- **Speed**: FULL
- **Use**: Quick flanking from left side

### Sub 1: Flank Right
- **Angle**: 90° right of target
- **Distance**: 50% of original distance
- **Speed**: FULL
- **Use**: Quick flanking from right side

### Sub 2: Wide Left
- **Angle**: 120° left of target
- **Distance**: 75% of original distance
- **Speed**: NORMAL
- **Use**: Wide flanking maneuver, more cautious

### Sub 3: Wide Right
- **Angle**: 120° right of target
- **Distance**: 75% of original distance
- **Speed**: NORMAL
- **Use**: Wide flanking maneuver, more cautious

---

## Section 2: FOLLOW
Different follow modes for the squad

### Sub 0: Close Formation
- **Formation**: COLUMN
- **Behavior**: AWARE
- **Stance**: AUTO
- **Use**: Close quarters, tight formation

### Sub 1: Dispersed Formation
- **Formation**: WEDGE
- **Behavior**: AWARE
- **Stance**: AUTO
- **Use**: Open terrain, spread out for safety

### Sub 2: Stealth Follow
- **Formation**: STAG COLUMN
- **Behavior**: STEALTH
- **Stance**: MIDDLE (Crouch)
- **Use**: Sneaking, avoiding detection

### Sub 3: Combat Ready
- **Formation**: LINE
- **Behavior**: COMBAT
- **Stance**: AUTO
- **Use**: High threat areas, ready for contact

---

## Section 3: SUPPRESS
Suppressive fire options

### Sub 0: Suppress Target
- **Target**: Cursor target object
- **Use**: Suppress specific enemy unit or vehicle

### Sub 1: Suppress Area
- **Target**: Screen center position
- **Use**: Suppress area/position, no specific target needed

### Sub 2: Suppress Nearest Enemy
- **Target**: Automatically finds nearest known enemy
- **Use**: Quick response to closest threat

### Sub 3: Suppress Watch Direction
- **Target**: 200m in player's facing direction
- **Behavior**: COMBAT + watch direction
- **Use**: Suppress and watch a direction

---

## Section 4: STOP
Different stop/halt options

### Sub 0: Hold Position
- **Behavior**: AWARE
- **Stance**: AUTO
- **Use**: Standard stop, alert but standing

### Sub 1: Take Cover (Prone)
- **Behavior**: COMBAT
- **Stance**: DOWN (Prone)
- **Use**: Maximum cover, defensive

### Sub 2: Crouch
- **Behavior**: AWARE
- **Stance**: MIDDLE (Crouch)
- **Use**: Medium cover, better mobility than prone

### Sub 3: Stealth Stop
- **Behavior**: STEALTH
- **Stance**: MIDDLE (Crouch)
- **Use**: Stop while maintaining stealth

---

## Section 5: REGROUP
Rally and regroup commands

### Sub 0: Regroup On Me
- **Rally Point**: Player position
- **Speed**: FULL
- **Use**: Quick rally to player

### Sub 1: Rally Point
- **Rally Point**: Screen center position
- **Speed**: FULL
- **Use**: Set designated rally point

### Sub 2: Regroup Nearest Unit
- **Rally Point**: Nearest squad member
- **Speed**: FULL
- **Use**: Rally on closest friendly

### Sub 3: Regroup Formation
- **Action**: Follow player and reform
- **Formation**: WEDGE
- **Use**: Reform tactical formation

---

## Section 6: COVER
Take cover with different behaviors

### Sub 0: Suppressive Cover
- **Stance**: MIDDLE (Crouch)
- **Behavior**: COMBAT
- **Action**: Provides suppressive fire
- **Use**: Cover with fire support

### Sub 1: Defensive Cover
- **Stance**: DOWN (Prone)
- **Behavior**: COMBAT
- **Action**: Maximum defensive posture
- **Use**: Heavy defense position

### Sub 2: Watch Cover
- **Stance**: MIDDLE (Crouch)
- **Behavior**: AWARE
- **Action**: Watch designated direction
- **Use**: Cover while observing

### Sub 3: Overwatch
- **Stance**: MIDDLE (Crouch)
- **Behavior**: AWARE
- **Action**: Watch forward, stay in place
- **Use**: Provide overwatch from current position

---

## Section 7: ADVANCE
Different advancement tactics

### Sub 0: Assault
- **Formation**: LINE
- **Behavior**: COMBAT
- **Speed**: FULL
- **Use**: Aggressive frontal assault

### Sub 1: Tactical Advance
- **Formation**: WEDGE
- **Behavior**: AWARE
- **Speed**: NORMAL
- **Use**: Balanced tactical movement

### Sub 2: Bounding Overwatch
- **Formation**: Split team
- **Behavior**: AWARE
- **Action**: Half advances, half covers
- **Use**: Careful advance with covering fire

### Sub 3: Stealth Advance
- **Formation**: STAG COLUMN
- **Behavior**: STEALTH
- **Speed**: LIMITED
- **Stance**: MIDDLE (Crouch)
- **Use**: Silent approach

---

## Arma 3 Scripting Commands Used

### Movement Commands
- `doMove` - Basic movement order
- `move` - Group movement
- `commandMove` - Direct movement command
- `doFollow` - Follow specific unit

### Behavior Commands
- `setBehaviour` - Set AI behavior (CARELESS, SAFE, AWARE, COMBAT, STEALTH)
- `setCombatMode` - Set engagement rules (BLUE, GREEN, YELLOW, RED)
- `setSpeedMode` - Set movement speed (LIMITED, NORMAL, FULL)
- `setFormation` - Set group formation (WEDGE, LINE, COLUMN, STAG COLUMN, etc.)

### Stance Commands
- `setUnitPos` - Set unit stance (AUTO, UP, MIDDLE, DOWN)

### Combat Commands
- `doSuppressiveFire` - Order suppressive fire
- `doWatch` - Watch direction/target

### Utility Commands
- `screenToWorld` - Convert screen position to world position
- `cursorTarget` - Get object under cursor
- `getPos` - Get position
- `getDir` - Get direction
- `distance` - Calculate distance
- `BIS_fnc_dirTo` - Calculate direction to target

### Group/Unit Selection
- `group player` - Get player's group
- `units group` - Get all units in group
- `allGroups` - Get all groups
- `side` - Get unit's side

---

## Tips

1. **Screen Center Targeting**: Most position-based commands use screen center (0.5, 0.5)
2. **Cursor Targeting**: Some commands use cursor target for precise control
3. **Behavior Stack**: Commands set behavior, speed, combat mode, and formation for complete control
4. **Stance Control**: Stance affects visibility and cover effectiveness
5. **Formation Choice**: Choose formation based on terrain and tactical situation

## Quick Reference: When to Use What

**Open Terrain**: Wedge, Line formations
**Urban/Forest**: Stag Column, Column formations  
**Under Fire**: Cover commands, prone stance
**Flanking**: Flank Left/Right commands
**Stealth**: Stealth behavior + crouch stance
**Assault**: Combat behavior + full speed + line formation
**Defense**: Combat behavior + prone + cover
