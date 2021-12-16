# Unity Game Libs Nuget Creator

Creates nugets with stripped and publicized libraries for Unity game modding.

If the game gets updated, this package needs to get updated too.

`strip-assembiles.bat` does two things:

- Strips game assembiles using [NStrip](https://github.com/BepInEx/NStrip). This removes game code and leaves only API definitions.
- Publicizes `Assembly.CSharp.dll` and `AAssembly-CSharp-firstpass.dll`. This makes all types, methods, properties and fields public, to make modding easier.

## Usage

- Create a nuget package.
- Add a `NUGET_KEY` secret to this repository, with the nuget key that has permissions to publish your nuget.
- Make sure you start off with a clean `Managed` folder, with no extra or modified dlls.
- Drag the game's exe and drop it on `strip-assembiles.bat`.
- Dlls are stripped, publicized, and placed in `package\lib`.
- Edit the `.nuspec` file, make `<version>` match the current game version.
- Open a PR or push to master.
- Updating master will trigger a workflow that will pack the dlls and update the NuGet package.
