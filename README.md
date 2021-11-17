# Outer Wilds Game Libs

Stripped and publicized libraries from Outer Wilds.

## Usage

If the game gets updated, this package needs to get updated too.

- Drag `OuterWilds.exe` and drop it on `strip-assembiles.bat`.
- Dlls are stripped, publicized, and placed in `package\lib\net46`.
- Edit `OuterWilds.GameLibs.nuspec`, make `<version>` match the current game version.
- Open a PR or push to master. Updating master will trigger a workflow that will pack the dlls and update the [NuGet package](https://www.nuget.org/packages/OuterWildsGameLibs/).
