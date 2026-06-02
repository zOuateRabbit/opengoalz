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

For building the Windows version of the app, you need Visual Studio 2022 with the **Desktop development with C++** workload installed.

```powershell
# ❌ This command often does NOT install the C++ workload correctly — use the manual steps below instead
choco install visualstudio2022community --package-parameters "--add Microsoft.VisualStudio.Workload.NativeDesktop" -y
```

**Recommended Setup (manual install via Visual Studio Installer):**

1. Download and run the [Visual Studio Installer](https://visualstudio.microsoft.com/downloads/).
2. Select **Visual Studio Community**.
3. Under the **Workloads** tab, check the box for **Desktop development with C++**.
4. Click **Install** (or **Modify** if already installed) in the bottom right corner and wait for the installation to complete.

### Android Build Requirements

To build the Android version of the app, you need Android Studio and the Android SDK installed.

> ⚠️ **The following Chocolatey command does NOT work reliably** — it may install Android Studio but frequently fails to set up the Android SDK and required components. **Do not rely on it.**

```powershell
# ❌ This command often does NOT set up the Android SDK correctly — use the manual steps below instead
choco install androidstudio -y
```

**Recommended Setup (manual install via Android Studio):**

1. Download and install [Android Studio](https://developer.android.com/studio) directly from the official site.
2. Launch Android Studio and complete the **Setup Wizard** — this installs the Android SDK and default components automatically.
3. Once installed, open **Settings > Languages & Frameworks > Android SDK** (or via the **SDK Manager** button on the welcome screen).
4. Under the **SDK Platforms** tab, install the Android version you want to target.
5. Under the **SDK Tools** tab, make sure **Android SDK Build-Tools**, **Android Emulator**, and **Android SDK Platform-Tools** are all installed.
6. Run `fvm flutter doctor --android-licenses` to accept the required Android licenses.

## Next Steps

See [docs/USEFUL_COMMANDS.md](USEFUL_COMMANDS.md) for more build and run commands.
