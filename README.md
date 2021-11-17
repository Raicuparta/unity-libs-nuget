# Outer Wilds Game Libs

Stripped and publicized libraries from Outer Wilds.

If the game gets updated, this package needs to get updated too.

`strip-assembiles.bat` does two things:
- Strips game assembiles using [NStrip](https://github.com/BepInEx/NStrip). This removes game code and leaves only API definitions.
- Publicizes `Assembly.CSharp.dll` and `AAssembly-CSharp-firstpass.dll`. This makes all types, methods, properties and fields public, to make modding easier.

## Usage

- Make sure you start off with a clean `OuterWilds_Data\Managed`, with no extra dlls (like OWML), and no modified dlls.
- Drag `OuterWilds.exe` and drop it on `strip-assembiles.bat`.
- Dlls are stripped, publicized, and placed in `package\lib\net46`.
- Edit `OuterWilds.GameLibs.nuspec`, make `<version>` match the current game version.
- Open a PR or push to master.
- Updating master will trigger a workflow that will pack the dlls and update the [NuGet package](https://www.nuget.org/packages/OuterWildsGameLibs/).
