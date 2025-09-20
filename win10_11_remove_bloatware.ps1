# Windows 10/11 Comprehensive Bloatware Detection and Removal Script
# Universal script for scanning and removing bloatware on Windows 10 and 11
# Run as Administrator

param(
    [switch]$RemoveAll,
    [switch]$ScanOnly
)

Write-Host "Windows 10/11 Comprehensive Bloatware Detection and Removal Tool" -ForegroundColor Green
Write-Host "=" * 70
Write-Host ""

# Comprehensive bloatware patterns for Windows 10 and 11
$BloatwarePatterns = @(
    # Gaming & Entertainment
    "*xbox*",
    "*candy*", 
    "*solitaire*",
    "*bubble*",
    "*march*",
    "*hidden*",
    "*disney*",
    "*spotify*",
    "*netflix*",
    "*king.*",
    "*farm*",
    "*twitter*",
    "*facebook*",
    "*instagram*",
    "*tiktok*",
    "*whatsapp*",
    
    # Microsoft Apps
    "*3dbuilder*",
    "*3dviewer*",
    "*mixedreality*",
    "*paint3d*",
    "*gethelp*",
    "*tips*",
    "*yourphone*",
    "*phonelink*",
    "*zunemusic*",
    "*groove*",
    "*zunevideo*",
    "*onenote*",
    "*skype*",
    "*teams*",
    "*officehub*",
    "*getstarted*",
    "*print3d*",
    "*wallet*",
    "*messaging*",
    
    # News & Weather
    "*bingweather*",
    "*bingnews*",
    "*bingsports*",
    "*bingfinance*",
    "*msn*",
    
    # Tools & Productivity
    "*windowsmaps*",
    "*windowsalarms*",
    "*soundrecorder*",
    "*stickynotes*",
    "*mathsolver*",
    "*whiteboard*",
    "*quickassist*",
    "*clocksandalarms*",
    "*windowscamera*",
    "*cortana*",
    
    # Communication & Social
    "*windowscommunications*",
    "*people*",
    "*messaging*",
    "*mail*",
    "*calendar*",
    
    # OEM Bloatware patterns
    "*mcafee*",
    "*norton*",
    "*spotify*",
    "*dropbox*",
    "*evernote*",
    "*flipboard*",
    "*pandora*",
    "*dolby*",
    "*realtek*",
    "*wildtangent*",
    "*cyberlink*"
)

# Comprehensive specific apps list for Windows 10 and 11
$SpecificApps = @(
    # Microsoft Core Bloatware
    "Microsoft.3DBuilder",
    "Microsoft.Print3D",
    "Microsoft.3DViewer",
    "Microsoft.BingFinance",
    "Microsoft.BingNews", 
    "Microsoft.BingSearch",
    "Microsoft.BingSports",
    "Microsoft.BingTranslator",
    "Microsoft.BingTravel",
    "Microsoft.BingWeather",
    "Microsoft.CommsPhone",
    "Microsoft.ConnectivityStore",
    "Microsoft.FreshPaint",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.HelpAndTips",
    "Microsoft.Media.PlayReadyClient.2",
    "Microsoft.Messaging",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftPowerBIForWindows",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MinecraftUWP",
    "Microsoft.MixedReality.Portal",
    "Microsoft.MSPaint",
    "Microsoft.NetworkSpeedTest",
    "Microsoft.News",
    "Microsoft.Office.OneNote",
    "Microsoft.Office.Sway",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.Reader",
    "Microsoft.RemoteDesktop",
    "Microsoft.SkypeApp",
    "Microsoft.Todos",
    "Microsoft.Wallet",
    "Microsoft.WebMediaExtensions",
    "Microsoft.Whiteboard",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsPhone",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.WinJS.1.0",
    "Microsoft.WinJS.2.0",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    
    # Xbox and Gaming
    "Microsoft.GamingApp",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameCallableUI",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.XboxGameBar",
    
    # Teams variants
    "MSTeams",
    "Microsoft.Teams",
    "Microsoft.TeamsForSurfaceHub",
    
    # Mail and Calendar
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsMailAndCalendar",
    
    # Common third-party bloatware
    "2414FC7A.Viber",
    "41038Axilesoft.ACGMediaPlayer",
    "46928bounde.EclipseManager",
    "4DF9E0F8.Netflix",
    "64885BlueEdge.OneCalendar",
    "7EE7776C.LinkedInforWindows",
    "828B5831.HiddenCityMysteryofShadows",
    "89006A2E.AutodeskSketchBook",
    "9E2F88E3.Twitter",
    "A278AB0D.DisneyMagicKingdoms",
    "A278AB0D.MarchofEmpires",
    "ActiproSoftwareLLC.562882FEEB491",
    "CAF9E577.Plex",
    "ClearChannelRadioDigital.iHeartRadio",
    "D52A8D61.FarmVille2CountryEscape",
    "D5EA27B7.Duolingo-LearnLanguagesforFree",
    "DB6EA5DB.CyberLinkMediaSuiteEssentials",
    "DolbyLaboratories.DolbyAccess",
    "Drawboard.DrawboardPDF",
    "Facebook.Facebook",
    "Fitbit.FitbitCoach",
    "flaregamesGmbH.RoyalRevolt2",
    "GAMELOFTSA.Asphalt8Airborne",
    "KeeperSecurityInc.Keeper",
    "king.com.BubbleWitch3Saga", 
    "king.com.CandyCrushFriends",
    "king.com.CandyCrushSaga",
    "king.com.CandyCrushSodaSaga",
    "NORDCURRENT.COOKINGFEVER",
    "PandoraMediaInc.29680B314EFC2",
    "Playtika.CaesarsSlotsFreeCasino",
    "ShazamEntertainmentLtd.Shazam",
    "SlingTVLLC.SlingTV",
    "SpotifyAB.SpotifyMusic",
    "TheNewYorkTimes.NYTCrossword",
    "ThumbmunkeysLtd.PhototasticCollage",
    "TuneIn.TuneInRadio",
    "WinZipComputing.WinZipUniversal",
    "XINGAG.XING",
    "Adobe.CC.XD",
    "AdobePhotoshopExpress"
)

function Scan-Bloatware {
    Write-Host "Scanning for Windows 10/11 Bloatware..." -ForegroundColor Yellow
    Write-Host "=" * 60
    
    # Get Windows version with better Windows 11 detection
    $regInfo = Get-ItemProperty "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion"
    $buildNumber = $regInfo.CurrentBuildNumber
    $productName = $regInfo.ProductName
    
    # Windows 11 detection: Build 22000 and higher
    if ([int]$buildNumber -ge 22000) {
        $WindowsVersion = $productName -replace "Windows 10", "Windows 11"
    } else {
        $WindowsVersion = $productName
    }
    
    Write-Host "Detected OS: $WindowsVersion (Build $buildNumber)" -ForegroundColor Cyan
    Write-Host ""
    
    # Create arrays to store results
    $InstalledBloatware = @()
    $AllFoundApps = @()
    
    # Check pattern-based apps
    Write-Host "Checking bloatware patterns..." -ForegroundColor Yellow
    foreach ($pattern in $BloatwarePatterns) {
        $apps = Get-AppxPackage $pattern -AllUsers -ErrorAction SilentlyContinue
        
        if ($apps) {
            foreach ($app in $apps) {
                if ($AllFoundApps -notcontains $app.Name) {
                    $InstalledBloatware += [PSCustomObject]@{
                        Name = $app.Name
                        DisplayName = $app.PackageFullName
                        Pattern = $pattern
                        Category = Get-AppCategory -AppName $app.Name
                    }
                    $AllFoundApps += $app.Name
                }
            }
        }
    }
    
    # Check specific apps
    Write-Host "Checking specific known bloatware apps..." -ForegroundColor Yellow
    foreach ($appName in $SpecificApps) {
        $app = Get-AppxPackage $appName -AllUsers -ErrorAction SilentlyContinue
        if ($app -and $AllFoundApps -notcontains $app.Name) {
            $InstalledBloatware += [PSCustomObject]@{
                Name = $app.Name
                DisplayName = $app.PackageFullName
                Pattern = "Specific Check"
                Category = Get-AppCategory -AppName $app.Name
            }
            $AllFoundApps += $app.Name
        }
    }
    
    # Display results
    Write-Host "`nBLOATWARE SCAN RESULTS:" -ForegroundColor Red
    Write-Host "=" * 60
    
    if ($InstalledBloatware.Count -eq 0) {
        Write-Host "No bloatware found! Your system is clean." -ForegroundColor Green
        return @()
    } else {
        # Group by category for better display
        $GroupedApps = $InstalledBloatware | Group-Object Category | Sort-Object Name
        
        foreach ($group in $GroupedApps) {
            Write-Host "`n$($group.Name.ToUpper()) ($($group.Count) apps):" -ForegroundColor Magenta
            Write-Host ("-" * 40)
            $group.Group | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor White }
        }
        
        Write-Host "`nTOTAL: Found $($InstalledBloatware.Count) bloatware apps" -ForegroundColor Red
        return $InstalledBloatware
    }
}

function Get-AppCategory {
    param($AppName)
    
    switch -Wildcard ($AppName) {
        "*Xbox*" { return "Gaming & Xbox" }
        "*Candy*" { return "Games" }
        "*Solitaire*" { return "Games" }
        "*King*" { return "Games" }
        "*Disney*" { return "Games" }
        "*Farm*" { return "Games" }
        "*Bubble*" { return "Games" }
        "*3D*" { return "3D & Mixed Reality" }
        "*MixedReality*" { return "3D & Mixed Reality" }
        "*Bing*" { return "News & Weather" }
        "*MSN*" { return "News & Weather" }
        "*Weather*" { return "News & Weather" }
        "*News*" { return "News & Weather" }
        "*Office*" { return "Office & Productivity" }
        "*OneNote*" { return "Office & Productivity" }
        "*Teams*" { return "Communication" }
        "*Skype*" { return "Communication" }
        "*Mail*" { return "Communication" }
        "*People*" { return "Communication" }
        "*YourPhone*" { return "Phone Integration" }
        "*PhoneLink*" { return "Phone Integration" }
        "*Zune*" { return "Media" }
        "*Groove*" { return "Media" }
        "*Spotify*" { return "Media" }
        "*Netflix*" { return "Media" }
        "*Maps*" { return "Tools & Utilities" }
        "*Alarms*" { return "Tools & Utilities" }
        "*SoundRecorder*" { return "Tools & Utilities" }
        "*StickyNotes*" { return "Tools & Utilities" }
        "*Tips*" { return "Help & Tips" }
        "*GetHelp*" { return "Help & Tips" }
        "*Feedback*" { return "Help & Tips" }
        default { return "Other" }
    }
}

function Show-SelectiveRemoval {
    param($FoundApps)
    
    Write-Host "`nSELECTIVE REMOVAL MODE" -ForegroundColor Yellow
    Write-Host "=" * 60
    Write-Host "Select apps to remove (enter numbers separated by commas, or 'all' for everything):"
    Write-Host ""
    
    # Display numbered list grouped by category
    $index = 1
    $appList = @{}
    $GroupedApps = $FoundApps | Group-Object Category | Sort-Object Name
    
    foreach ($group in $GroupedApps) {
        Write-Host "$($group.Name.ToUpper()):" -ForegroundColor Magenta
        foreach ($app in $group.Group) {
            Write-Host "  [$index] $($app.Name)" -ForegroundColor White
            $appList[$index] = $app.Name
            $index++
        }
        Write-Host ""
    }
    
    Write-Host "Examples:" -ForegroundColor Cyan
    Write-Host "  Enter '1,3,5' to remove apps 1, 3, and 5"
    Write-Host "  Enter '1-5' to remove apps 1 through 5"
    Write-Host "  Enter 'all' to remove everything"
    Write-Host "  Enter 'cancel' to exit"
    Write-Host ""
    
    do {
        $selection = Read-Host "Your selection"
        
        if ($selection -eq 'cancel') {
            Write-Host "Operation cancelled." -ForegroundColor Red
            return @()
        }
        
        if ($selection -eq 'all') {
            return $FoundApps.Name
        }
        
        $selectedApps = @()
        $validSelection = $true
        
        # Parse selection
        $parts = $selection -split ','
        foreach ($part in $parts) {
            $part = $part.Trim()
            
            if ($part -match '(\d+)-(\d+)') {
                # Range selection (e.g., "1-5")
                $start = [int]$matches[1]
                $end = [int]$matches[2]
                for ($i = $start; $i -le $end; $i++) {
                    if ($appList.ContainsKey($i)) {
                        $selectedApps += $appList[$i]
                    } else {
                        Write-Host "Invalid selection: $i" -ForegroundColor Red
                        $validSelection = $false
                        break
                    }
                }
            } elseif ($part -match '^\d+$') {
                # Single number
                $num = [int]$part
                if ($appList.ContainsKey($num)) {
                    $selectedApps += $appList[$num]
                } else {
                    Write-Host "Invalid selection: $num" -ForegroundColor Red
                    $validSelection = $false
                    break
                }
            } else {
                Write-Host "Invalid format: $part" -ForegroundColor Red
                $validSelection = $false
                break
            }
        }
        
        if ($validSelection -and $selectedApps.Count -gt 0) {
            Write-Host "`nSelected apps for removal:" -ForegroundColor Yellow
            $selectedApps | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }
            
            $confirm = Read-Host "`nProceed with removal? (Y/N)"
            if ($confirm -eq 'Y' -or $confirm -eq 'y') {
                return $selectedApps
            } else {
                Write-Host "Selection cancelled. Please select again or enter 'cancel'." -ForegroundColor Yellow
                continue
            }
        } elseif ($validSelection) {
            Write-Host "No valid apps selected. Please try again." -ForegroundColor Red
        }
        
    } while ($true)
}

function Remove-Bloatware {
    param($AppsToRemove)
    
    if ($AppsToRemove.Count -eq 0) {
        Write-Host "No apps to remove." -ForegroundColor Green
        return
    }
    
    Write-Host "`nStarting removal process..." -ForegroundColor Green
    Write-Host "=" * 60
    
    $RemovalCount = 0
    $FailedRemovals = @()
    
    foreach ($AppName in $AppsToRemove) {
        Write-Host "Removing: $AppName" -ForegroundColor Cyan
        
        try {
            # Remove for current user
            $App = Get-AppxPackage $AppName -ErrorAction SilentlyContinue
            if ($App) {
                Remove-AppxPackage $App.PackageFullName -ErrorAction Stop
                Write-Host "  ✓ Removed for current user: $AppName" -ForegroundColor Green
            }
            
            # Remove for all users
            $AllUsersApp = Get-AppxPackage $AppName -AllUsers -ErrorAction SilentlyContinue
            if ($AllUsersApp) {
                Remove-AppxPackage $AllUsersApp.PackageFullName -AllUsers -ErrorAction Stop
                Write-Host "  ✓ Removed for all users: $AppName" -ForegroundColor Green
            }
            
            if ($App -or $AllUsersApp) {
                $RemovalCount++
            } else {
                Write-Host "  ⚠ App not found (may already be removed): $AppName" -ForegroundColor Yellow
            }
        }
        catch {
            Write-Host "  ✗ Failed to remove: $AppName" -ForegroundColor Red
            Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
            $FailedRemovals += $AppName
        }
    }
    
    # Summary
    Write-Host "`n" + "=" * 60
    Write-Host "REMOVAL SUMMARY:" -ForegroundColor Green
    Write-Host "=" * 60
    Write-Host "Successfully removed: $RemovalCount apps" -ForegroundColor Green
    
    if ($FailedRemovals.Count -gt 0) {
        Write-Host "Failed to remove: $($FailedRemovals.Count) apps" -ForegroundColor Red
        Write-Host "Failed apps:" -ForegroundColor Red
        foreach ($failed in $FailedRemovals) {
            Write-Host "  - $failed" -ForegroundColor Red
        }
    }
    
    # Optional: Remove provisioned packages
    Write-Host "`n" + "=" * 60
    $provisionedCleanup = Read-Host "Remove provisioned packages to prevent reinstall for new users? (Y/N)"
    
    if ($provisionedCleanup -eq 'Y' -or $provisionedCleanup -eq 'y') {
        Write-Host "Removing provisioned packages..." -ForegroundColor Cyan
        $provisionedCount = 0
        
        foreach ($AppName in $AppsToRemove) {
            try {
                $ProvisionedApps = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq $AppName}
                foreach ($ProvisionedApp in $ProvisionedApps) {
                    Remove-AppxProvisionedPackage -Online -PackageName $ProvisionedApp.PackageName -ErrorAction Stop
                    Write-Host "  ✓ Removed provisioned: $AppName" -ForegroundColor Green
                    $provisionedCount++
                }
            }
            catch {
                # Silently continue if provisioned package removal fails
            }
        }
        Write-Host "Provisioned package cleanup complete! Removed $provisionedCount packages." -ForegroundColor Green
    }
    
    Write-Host "`nCleanup complete!" -ForegroundColor Green
    Write-Host "You may want to restart your computer to complete the cleanup." -ForegroundColor Yellow
}

# Main script logic
if ($ScanOnly) {
    # Scan only mode
    $foundApps = Scan-Bloatware
} elseif ($RemoveAll) {
    # Auto-remove mode (for scripted use)
    Write-Host "Auto-removal mode: Scanning and removing all bloatware..." -ForegroundColor Yellow
    $foundApps = Scan-Bloatware
    if ($foundApps.Count -gt 0) {
        Remove-Bloatware -AppsToRemove $foundApps.Name
    }
} else {
    # Interactive mode (default)
    $foundApps = Scan-Bloatware
    
    if ($foundApps.Count -gt 0) {
        Write-Host "`n" + "=" * 70
        Write-Host "REMOVAL OPTIONS:" -ForegroundColor Yellow
        Write-Host "=" * 70
        Write-Host "1. Remove ALL found bloatware apps ($($foundApps.Count) apps)"
        Write-Host "2. SELECT specific apps to remove"
        Write-Host "3. Show detailed information about found apps"
        Write-Host "4. Exit without removing anything"
        Write-Host ""
        
        do {
            $choice = Read-Host "Enter your choice (1-4)"
            
            switch ($choice) {
                "1" {
                    Write-Host "`nProceeding with removal of ALL $($foundApps.Count) apps..." -ForegroundColor Yellow
                    $confirm = Read-Host "Are you sure? This cannot be undone easily. (Y/N)"
                    if ($confirm -eq 'Y' -or $confirm -eq 'y') {
                        Remove-Bloatware -AppsToRemove $foundApps.Name
                    } else {
                        Write-Host "Operation cancelled." -ForegroundColor Red
                    }
                    break
                }
                "2" {
                    $selectedApps = Show-SelectiveRemoval -FoundApps $foundApps
                    if ($selectedApps.Count -gt 0) {
                        Remove-Bloatware -AppsToRemove $selectedApps
                    }
                    break
                }
                "3" {
                    Write-Host "`nDETAILED APP INFORMATION:" -ForegroundColor Cyan
                    Write-Host "=" * 60
                    $GroupedApps = $foundApps | Group-Object Category | Sort-Object Name
                    foreach ($group in $GroupedApps) {
                        Write-Host "`n$($group.Name.ToUpper()):" -ForegroundColor Magenta
                        foreach ($app in $group.Group) {
                            $appInfo = Get-AppxPackage $app.Name -ErrorAction SilentlyContinue
                            if ($appInfo) {
                                Write-Host "  App: $($app.Name)" -ForegroundColor White
                                Write-Host "  Full Name: $($appInfo.PackageFullName)" -ForegroundColor Gray
                                Write-Host "  -" * 50
                            }
                        }
                    }
                    Write-Host "`nPress Enter to return to menu..."
                    Read-Host
                    continue
                }
                "4" {
                    Write-Host "Exiting without removing apps." -ForegroundColor Yellow
                    break
                }
                default {
                    Write-Host "Invalid choice. Please enter 1, 2, 3, or 4." -ForegroundColor Red
                    continue
                }
            }
            break
        } while ($true)
    }
}

Write-Host "`n" + "=" * 70
Write-Host "USAGE EXAMPLES:" -ForegroundColor Green
Write-Host "=" * 70
Write-Host "Scan only:           .\script.ps1 -ScanOnly"
Write-Host "Auto-remove all:     .\script.ps1 -RemoveAll"
Write-Host "Interactive (default): .\script.ps1"
Write-Host "=" * 70