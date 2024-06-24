# Windows Setup

Download Windows installation media at [link](https://www.microsoft.com/en-au/software-download/)

For Windows, use `Rufus` or `Windows USB/DVD Download Tool`

For Linux, use `WoeUSB` to create a bootable USB drive with the Windows installation media

For install alongside of other OS, remove that OS drive before booting installation media

## Post-Installation

Install `Chocolatey` [link](https://chocolatey.org/install)

Install Choco [packages](https://gist.github.com/4mirul/a4664606a796e50b78548287944d47c9#file-choco-packages-txt), `choco install <package> <package1> <package2> -y`

Install Winget [packages](https://gist.github.com/4mirul/a4664606a796e50b78548287944d47c9#file-winget-packages-txt), `winget install <package>`, or use [winget.run](https://winget.run/)

Install Other software [link](https://gist.github.com/4mirul/a4664606a796e50b78548287944d47c9/#file-official-website-downloads-txt)

Change Windows basic settings

### Firefox Developer Edition setting

Login Firefox account

Install [one-line-firefox](https://github.com/khuedoan/one-line-firefox)

## Additional

Export installed windows applications using `Get-WmiObject -Class Win32_Product | select Name, Version | Out-File .\installed.txt`

### `choco` cheatsheet

Update/Upgrade all packages `sudo choco cup -all`

```.md
1. `choco install <package>`: Installs a package from the Chocolatey repository.
   Example: `choco install googlechrome`

2. `choco uninstall <package>`: Uninstalls a package.
   Example: `choco uninstall git`

3. `choco update <package>`: Updates a package to the latest version.
   Example: `choco update nodejs`

4. `choco list`: Lists all installed packages.

5. `choco search <package>`: Searches for a package in the Chocolatey repository.
   Example: `choco search python`

6. `choco upgrade all`: Upgrades all installed packages to their latest versions.

7. `choco upgrade <package>`: Upgrades a specific package to the latest version.
   Example: `choco upgrade vscode`

8. `choco pin add -n=<package>`: Pins a package to prevent it from being automatically upgraded.
   Example: `choco pin add -n=firefox`

9. `choco pin remove -n=<package>`: Removes a pin from a package, allowing it to be upgraded again.
   Example: `choco pin remove -n=firefox`

10. `choco outdated`: Lists all installed packages that have available updates.
```

### `winget` cheatsheet

```.md
1. `winget install <package>`: Installs a package from the Microsoft Store or other sources.
   Example: `winget install microsoft-edge`

2. `winget uninstall <package>`: Uninstalls a package.
   Example: `winget uninstall vscode`

3. `winget upgrade`: Upgrades all installed packages to their latest versions.

4. `winget upgrade <package>`: Upgrades a specific package to the latest version.
   Example: `winget upgrade git`

5. `winget list`: Lists all installed packages.

6. `winget search <package>`: Searches for a package in the winget repository.
   Example: `winget search python`

7. `winget source list`: Lists all configured package sources.

8. `winget source add -n <name> -u <url>`: Adds a new package source.
   Example: `winget source add -n MySource -u https://example.com/repo`

9. `winget source update -n <name>`: Updates a specific package source.
   Example: `winget source update -n MySource`

10. `winget source remove -n <name>`: Removes a package source.
    Example: `winget source remove -n MySource`
```