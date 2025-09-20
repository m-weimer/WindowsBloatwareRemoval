# WindowsBloatwareRemoval

A comprehensive PowerShell script for detecting and removing bloatware from Windows 10 and Windows 11 systems. This tool provides both automated and selective removal options for a clean, bloat-free Windows experience.

## 🚀 Features

- **Universal Compatibility**: Works on both Windows 10 and Windows 11
- **Comprehensive Detection**: Scans for 200+ known bloatware applications
- **Selective Removal**: Choose exactly which apps to remove
- **Smart Categorization**: Apps organized by type (Gaming, Office, Media, etc.)
- **Multiple Usage Modes**: Interactive, scan-only, or fully automated
- **Safe Operation**: Only targets known bloatware, preserves essential system apps
- **Provisioned Package Cleanup**: Prevents bloatware reinstallation for new users
- **Detailed Reporting**: Shows exactly what was found and removed

## 📋 What Gets Detected

### Gaming & Entertainment
- Xbox apps and services
- Casual games (Candy Crush, Solitaire, Bubble Witch, etc.)
- Social media apps (Facebook, Twitter, TikTok, Instagram)
- Media apps (Netflix, Spotify trials)

### Microsoft Bloatware
- 3D Builder, Paint 3D, Mixed Reality Portal
- Office trial apps and OneNote UWP
- Get Help, Tips, Feedback Hub
- Your Phone/Phone Link
- Groove Music, Movies & TV
- Teams consumer version

### News & Weather
- Bing Weather, News, Sports, Finance
- MSN apps

### Tools & Utilities
- Maps, Alarms & Clock, Sound Recorder
- Sticky Notes, Math Solver, Whiteboard

### OEM Bloatware
- McAfee, Norton trials
- Manufacturer-specific apps
- Third-party trial software

## 🛠️ Usage

### Prerequisites
- Windows 10 or Windows 11
- PowerShell (run as Administrator)
- Execution policy allowing script execution

### Quick Start

1. **Download the script**
   ```powershell
   # Save as bloatware-removal.ps1
   ```

2. **Set execution policy** (if needed)
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Run the script**
   ```powershell
   .\bloatware-removal.ps1
   ```

### Usage Modes

#### Interactive Mode (Default)
```powershell
.\bloatware-removal.ps1
```
- Scans system for bloatware
- Displays organized results by category
- Provides menu options for removal

**Menu Options:**
1. **Remove ALL** - Removes all detected bloatware
2. **SELECT specific apps** - Choose exactly which apps to remove
3. **Show detailed info** - View full package information
4. **Exit** - Quit without changes

#### Scan Only Mode
```powershell
.\bloatware-removal.ps1 -ScanOnly
```
- Performs detection scan only
- No removal operations
- Perfect for auditing systems

#### Auto-Remove Mode
```powershell
.\bloatware-removal.ps1 -RemoveAll
```
- Automatically removes all detected bloatware
- No user interaction required
- Ideal for scripted deployments

### Selective Removal Examples

When using **Option 2** (SELECT specific apps), you can:

- **Individual selection**: `1,3,5,8` (removes apps 1, 3, 5, and 8)
- **Range selection**: `1-5` (removes apps 1 through 5)
- **Mixed selection**: `1,3,7-12,15` (combines individual and range)
- **Remove all**: `all` (removes everything)
- **Cancel**: `cancel` (exit without removing)

## 📊 Sample Output

```
Windows 10/11 Comprehensive Bloatware Detection and Removal Tool
======================================================================

Detected OS: Windows 11 Pro

BLOATWARE SCAN RESULTS:
============================================================

GAMING & XBOX (5 apps):
----------------------------------------
  - Microsoft.XboxGameCallableUI
  - Microsoft.XboxIdentityProvider
  - Microsoft.Xbox.TCUI
  - Microsoft.XboxGamingOverlay
  - Microsoft.XboxSpeechToTextOverlay

GAMES (2 apps):
----------------------------------------
  - Microsoft.MicrosoftSolitaireCollection
  - king.com.CandyCrushSaga

OFFICE & PRODUCTIVITY (2 apps):
----------------------------------------
  - Microsoft.MicrosoftOfficeHub
  - Microsoft.Office.OneNote

TOTAL: Found 17 bloatware apps

REMOVAL OPTIONS:
======================================================================
1. Remove ALL found bloatware apps (17 apps)
2. SELECT specific apps to remove
3. Show detailed information about found apps
4. Exit without removing anything
```

## ⚠️ Important Notes

### Safety
- **Safe to use**: Only targets known bloatware applications
- **System apps protected**: Essential Windows components are never touched
- **Reversible**: Most apps can be reinstalled from Microsoft Store if needed

### What's NOT Removed
- Windows Security/Defender
- Microsoft Store
- Settings app
- Calculator
- Essential system components
- Microsoft Edge (system dependency)

### Permissions Required
- **Administrator privileges**: Required for app removal
- **Execution policy**: May need to be set to allow script execution

## 🔧 Troubleshooting

### Execution Policy Error
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Some Apps Won't Remove
- Some apps may be protected by group policy
- Try running as different administrator account
- Certain OEM apps may require additional steps

### Script Won't Run
```powershell
# Alternative bypass method
PowerShell.exe -ExecutionPolicy Bypass -File ".\bloatware-removal.ps1"
```

## 📈 Use Cases

### Personal Use
- Clean up new PC purchases
- Remove accumulated bloatware
- Prepare system for performance optimization

### IT Administration
- Deploy across multiple systems
- Standardize company workstations
- Reduce support overhead from unwanted apps

### System Preparation
- Prepare golden images
- Clean systems before deployment
- Reduce attack surface

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests for:
- Additional bloatware detection patterns
- New features or improvements
- Bug fixes
- Documentation updates

## 📝 License

This project is licensed under the MIT License - feel free to use, modify, and distribute.

## ⭐ Acknowledgments

- Inspired by various Windows debloating tools
- Community feedback for comprehensive app detection
- Microsoft documentation for PowerShell cmdlets

---

**Disclaimer**: This tool modifies your Windows installation by removing applications. While it only targets known bloatware, use at your own risk. Always ensure you have backups and understand what's being removed.
