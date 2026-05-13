# Setup Instructions for OpenGoalz

This guide will help you set up your development environment for contributing to or building the OpenGoalz Flutter app. OpenGoalz is a cross-platform application supporting Android, iOS, Windows, and web.

## Automated Package Installation with Chocolatey

Most dependencies can be installed automatically with a single Chocolatey command. This includes tools like VS Code, Git, Flutter Version Manager (FVM), OpenJDK 17, and Android Debug Bridge (ADB).

Run the following command:

```powershell
choco install vscode vscode.install git git.install fvm openjdk17 adb -y
```

This will install:

- VS Code (editor)
- Git (version control)
- FVM (Flutter version management)
- OpenJDK 17 (Java for Android development)
- ADB (Android debugging)

## Install Flutter SDK with FVM

After installing FVM, run the following command from the root of the repository to download the stable Flutter SDK and set it as the active version for this project:

```powershell
fvm use stable
```

This will install the latest stable Flutter release and create a `.fvm` folder in the project root with a symlink to the selected SDK. Normally you dont need to run fvm flutter but directly flutter commands as FVM will automatically route them to the correct SDK.

## Run the project

To run the project, use the following command:

```powershell
.\run_flutter.ps1
```

### Windows Build Requirements

For building the Windows version of the app, you need to have Visual Studio 2022 Community Edition installed with the "Desktop development with C++" workload.

```powershell
choco install visualstudio2022community --package-parameters "--add Microsoft.VisualStudio.Workload.NativeDesktop" -y
```

### Android Build Requirements

To build the Android version of the app, you need to have the Android SDK installed. You can install it using the following command:

```powershell
choco install androidstudio -y
```

## Next Steps

See [docs/USEFUL_COMMANDS.md](USEFUL_COMMANDS.md) for more build and run commands.
