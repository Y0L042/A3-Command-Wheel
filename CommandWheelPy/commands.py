# commands.py
"""
Command structure definition for ARMA 3 Command Wheel
"""

COMMANDS = {
    0: {
        "name": "Hold",
        "hint": "hint 'Hold'",
        "command": "fn_hold.sqf",
        "subs": {
            0: {
                "name": "Regroup",
                "hint": "hint 'Regroup'",
                "command": "fn_regroup.sqf"
            },
            1: {
                "name": "Move there",
                "hint": "hint 'Move there'",
                "command": "fn_moveThere.sqf"
            },
            2: {
                "name": "GoGoGo!",
                "hint": "hint 'GoGoGo!'",
                "command": "fn_gogogo.sqf"
            },
            3: {
                "name": "Teleport to me",
                "hint": "hint 'Teleport to me'",
                "command": "fn_teleportToMe.sqf"
            }
        }
    },
    1: {
        "name": "Stealth & Hold Fire",
        "hint": "hint 'Stealth & Hold Fire'",
        "command": "fn_stealthHoldFire.sqf",
        "subs": {
            0: {
                "name": "Prone",
                "hint": "hint 'Prone'",
                "command": "fn_prone.sqf"
            },
            1: {
                "name": "Get Up",
                "hint": "hint 'Get Up'",
                "command": "fn_getUp.sqf"
            },
            2: {
                "name": "Match my stance",
                "hint": "hint 'Match my stance'",
                "command": "fn_matchStance.sqf"
            },
            3: {
                "name": "Find cover",
                "hint": "hint 'Find cover'",
                "command": "fn_findCover.sqf"
            }
        }
    },
    2: {
        "name": "Suppressive fire",
        "hint": "hint 'Suppressive fire'",
        "command": "fn_suppressiveFire.sqf",
        "subs": {
            0: {
                "name": "Forced suppressive fire",
                "hint": "hint 'Forced suppressive fire'",
                "command": "fn_forcedSuppressiveFire.sqf"
            },
            1: {
                "name": "Target enemy",
                "hint": "hint 'Target enemy'",
                "command": "fn_targetEnemy.sqf"
            },
            2: {
                "name": "Heal soldier",
                "hint": "hint 'Heal soldier'",
                "command": "fn_healSoldier.sqf"
            },
            3: {
                "name": "Disengage",
                "hint": "hint 'Disengage'",
                "command": "fn_disengage.sqf"
            }
        }
    },
    3: {
        "name": "Column",
        "hint": "hint 'Column'",
        "command": "fn_column.sqf",
        "subs": {
            0: {
                "name": "Staggered column",
                "hint": "hint 'Staggered column'",
                "command": "fn_staggeredColumn.sqf"
            },
            1: {
                "name": "Wedge",
                "hint": "hint 'Wedge'",
                "command": "fn_wedge.sqf"
            },
            2: {
                "name": "File",
                "hint": "hint 'File'",
                "command": "fn_file.sqf"
            },
            3: {
                "name": "Line",
                "hint": "hint 'Line'",
                "command": "fn_line.sqf"
            }
        }
    }
}