
# Wallpaper Switcher

A simple script written in bash using Wofi and Swww to change wallpaper, with pywal intergrated.


## Screenshots

![App Screenshot](https://raw.githubusercontent.com/k4ahr/wallpaper-switcher/main/screenshot.png)



## Feature & Dependencies

***Switcher is originally a script for one of my [Hyprland's dotfiles](https://github.com/k4ahr/dotfiles), which being included multiple features related to pywal.***

These are minimum requirements in order to Switcher works:
* [Swww](https://github.com/dylanaraps/pywal): Changing wallpapers (of course)
* [Wofi](https://archlinux.org/packages/extra/x86_64/wofi/): Select menu from a list of multiple wallpapers

Other optional dependencies that supported:
* [Pywal](https://github.com/dylanaraps/pywal): For generate and apply a palette of colors from the selected wallpapers
* [pywal-spicetify](https://github.com/jhideki/pywal-spicetify): A simple cli tool for applying wal generated colors to Spicetify.

## Installation

Install Switcher by cloning this repository:

```bash
  git clone https://github.com/k4ahr/wallpaper-switcher.git
  cd wallpaper-switcher
  chmod +x wallpaper_switcher.sh
```
    
## Usage/Examples

Switcher can be easily executed by the following command:
```bash
  sh wallpaper_switcher.sh
```

You can apply this to a keybind in any Desktop Enviroment's configuration file that use Wayland. For example to appy the script to a keybind in Hyprland, add this line to your Hyprland's configuration File (`~/.config/hypr/hyprland.conf`) : 
```bash
  # Changing wallpaper
  bind = $mainMod, Tab, exec, ~/wallpaper-switcher/wallpaper_switcher.sh
```



## Wallpaper

You can easily add or remove Wallpapers that you want to add to the list by editing the wallpapers itself in the `wallpaper` directory, or you can set your own path to your existing directory of wallpapers in one of the first lines of the `wallpaper_switcher.sh` script:

```bash
  # Directory containing your wallpapers
  WALLPAPER_DIR="path/to/your/directory"
```
