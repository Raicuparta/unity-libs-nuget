# Unity Game Libs Nuget Creator

Creates nugets with stripped and publicized libraries for Unity game modding.

If the game gets updated, this package needs to get updated too.

`strip-assembiles.bat` does two things:

- Strips game assembiles using [NStrip](https://github.com/BepInEx/NStrip). This removes game code and leaves only API definitions.
- Publicizes `Assembly.CSharp.dll` and `AAssembly-CSharp-firstpass.dll`. This makes all types, methods, properties and fields public, to make modding easier.

## Usage

### Nuget account

- Go to [nuget.org](https://nuget.org/).
- Either log in, or create a new account.
- [Create a new API key](https://www.nuget.org/account/apikeys) with permissions to push new packages.

### Prepare your repository

- [Create a new repository based on this template](https://github.com/Raicuparta/unity-libs-nuget/generate).
- Add a secret called `NUGET_KEY` to this repository. Give it the value of the API key you created earlier.
- Update the repository's name. This will be used as your Nuget ID, so it can't clash with another nuget package on [nuget.org](https://nuget.org/).
- Update the repository's description. This will be used as the nuget's description too.

### Generate the stripped libraries

- Make sure you start off with a clean version of the game files, with no extra/modified dlls.
- Drag the game's exe and drop it on `strip-assembiles.bat`.
- Dlls are stripped, publicized, and placed in `package\lib`.

### Updating the Nuget

- Edit the `.nuspec` file, make `<version>` match the game version where these assemblies come from.
- Push to master.
- Updating master will trigger a workflow that will pack the dlls and update the NuGet package.

### Publicized assemblies

By default, only `Assembly-CSharp.dll` and `Assembly-CSharp-firstpass.dll` are publicized. All other dlls are stripped only. To publicize other dlls, edit `strip-assemblies.bat` and add the dll names to the `toPublicize` variable.
