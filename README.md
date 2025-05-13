## Installing a Nerd Font

We need to use a Nerd Font as our WSL terminal font. Otherwise, certain icons in Neovim will just look like: ▯. In my case, I downloaded the JetBrainsMono Nerd Font (download here). Once the download was completed, I unzipped the directory, selected all the fonts, and right-clicked my selection. This lets you choose the option to “Install all” the fonts.

To use the Nerd Font in our Windows Terminal:

- Open up Settings ctrl ,
- Open the tray by clicking the three-lines icon on the top left
- Click Ubuntu under Profiles to open its profile settings
- Scroll down to Additional Settings and click Appearance
- Change Font face to JetBrainsMono Nerd Font

## Installing on Windows

### Install dependecies
```bash
winget install fzf
winget install --id=DEVCOM.Lua  -e
winget install sharkdp.fd
```

Download (ripgrep)[https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-pc-windows-msvc.zip] and unzip it in `C:\dev\`.  

Add `C:\dev\ripgrep-13.0.0-x86_64-pc-windows-msvc` to your PATH.  

Download (ziglang)[https://ziglang.org/builds/zig-windows-x86_64-0.15.0-dev.483+837e0f9c3.zip] and unzip it in `C:\dev\`.  

Add `C:\dev\zig-windows-x86_64-0.15.0-dev.483+837e0f9c3` to your PATH. 

Run Neovim as admin so that Treesitter can build and install the parsers.  

### Configure to run from address bar

Make a batch fil in `C:\dev\` called `nv.bat` with the following content:
```bat
@echo off
setlocal
set "dir=%cd%"
start powershell.exe -NoExit -Command "cd '%dir%'; nvim"
```

Add `C:\dev\` to your PATH.

