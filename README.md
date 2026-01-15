# Being Hacked Simulation

A prank script that simulates a cyber attack by rapidly launching random applications and displaying hacking-themed visuals. This entertaining simulation creates the illusion of a system breach and concludes with a shutdown command.

## What It Does

This script launches random Windows applications in rapid succession to create the visual effect of a system being hacked. It displays hacking-themed content and terminates by issuing a shutdown command, making it appear as though the system is being taken over. Perfect for pranking friends or colleagues with a harmless tech gag.

## Configuration

The script behavior can be customized by editing the `config.ini` file. You can control:

- **DURATION** - How long the prank runs (in seconds)
- **ENABLE_SHUTDOWN** - Whether to actually shutdown the computer (true/false)
- **SHUTDOWN_DELAY** - Time before shutdown triggers
- **ENABLE_MOUSE_CONTROL** - Whether the mouse moves around randomly
- **MOUSE_SPEED** - How frequently the mouse moves (lower = more annoying)
- **ENABLE_APP_LAUNCHES** - Whether random applications launch
- **ENABLE_KILL_SWITCH** - Whether Shift+K will stop the prank

## How to Stop It

If you have the kill switch enabled, press **Shift+K** at any time to:
- Stop all prank activities
- Cancel the shutdown
- Restore the system

## Requirements

- Windows 7 or later
- AutoHotkey (for mouse control and kill switch features)
  - Download from: https://www.autohotkey.com/

## Files

- `Hacked.bat` - Main prank script
- `config.ini` - Configuration file (edit this to customize)
- `KillSwitch.ahk` - Kill switch hotkey handler
- `MouseControl.ahk` - Random mouse movement controller

## Troubleshooting

**Q: Nothing happens when I run the script**
- Make sure you have AutoHotkey installed for full functionality
- Run as Administrator for best results
- Check that config.ini is in the same folder as Hacked.bat

**Q: The kill switch doesn't work**
- Make sure AutoHotkey is installed
- Try pressing Escape or Ctrl+Alt+K if Shift+K doesn't work
- The kill switch window must be visible/active for hotkeys to register

**Q: Apps aren't launching**
- Some apps may not be installed on your system (Chrome, Firefox, etc.)
- Set ENABLE_APP_LAUNCHES=false in config.ini to disable this feature
- Make sure ENABLE_APP_LAUNCHES is set to true in config.ini

**Q: The mouse is too fast/slow**
- Adjust MOUSE_SPEED in config.ini (lower = faster, higher = slower)
- Valid range: 500-5000 milliseconds

**Q: Shutdown didn't actually happen**
- Check that ENABLE_SHUTDOWN is set to true in config.ini
- Make sure SHUTDOWN_DELAY is greater than DURATION
- You may need to run as Administrator

## Disclaimer

**⚠️ Use at Your Own Risk** - This is intended as a harmless prank script for entertainment purposes only. Any damage, loss of data, or other harm caused by the use of this script is not the responsibility of the creator. Users are solely responsible for how they use this script and should only run it on systems they own or have explicit permission to use.

## Creator

Created by **LazyWind** 
