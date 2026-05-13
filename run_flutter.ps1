# PowerShell script to read .env and run Flutter with --dart-define
# Usage: .\run_flutter.ps1 [-Device w|c|e|a] [-- <extra flutter args>]
# Devices: w=windows (default), c=chrome, e=edge, a/p/phone=android

param(
    [string]$Device = "windows"
)

# Map short input to full device name
switch ($Device.ToLower()) {
    'w' { $Device = 'windows' }
    'c' { $Device = 'chrome' }
    'e' { $Device = 'edge' }
    { $_ -in 'a', 'p', 'phone' } { $Device = 'android' }
}

# If device is 'android', try to detect the first connected Android device
if ($Device -eq 'android') {
    $adbOutput = & adb devices | Select-Object -Skip 1 | Where-Object { $_ -match 'device$' }
    if ($adbOutput) {
        $Device = ($adbOutput -split '\s+')[0]
        Write-Host "Detected Android device: $Device"
    } else {
        Write-Warning "No Android device detected via ADB. Passing 'android' as device ID."
    }
}

# Path to your .env file
$envFile = ".env"
if (-not (Test-Path $envFile)) {
    Write-Error ".env file not found. Please create a .env file in the project root.`nRequired variables:`n  SUPABASE_URL=`n  SUPABASE_KEY="
    exit 1
}

# Read .env file, skip blank lines and comments, extract key=value pairs
$dartDefineArgs = Get-Content $envFile |
    Where-Object { $_ -match '^\s*[^#\s].*=' } |
    ForEach-Object {
        $parts = $_ -split '=', 2
        "--dart-define=$($parts[0].Trim())=$($parts[1].Trim())"
    }

# Run flutter using argument array (safe, no injection risk)
Write-Host "Running: flutter run -d $Device with --dart-define arguments from .env (values hidden)"
& flutter run -d $Device @dartDefineArgs
