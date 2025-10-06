#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

# define your preferred text editor and terminal to use
editor=gedit

configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"
waybarstyle="$HOME/.config/waybar/style"
waybarconfig="$HOME/.config/waybar/configs"
waybarmodules="$HOME/.config/waybar"

menu(){
  printf "                    HYPRLAND                       \n"
  printf "1. view Env-variables\n"
  printf "2. view Window-Rules\n"
  printf "3. view Startup_Apps\n"
  printf "4. view User-Keybinds\n"
  printf "5. view Monitors\n"
  printf "6. view Laptop-Keybinds\n"
  printf "7. view User-Settings\n"
  printf "8. view Workspace-Rules\n"
  printf "9. view Default-Settings\n"
  printf "10. view Default-Keybinds\n"
  printf "                     WAYBAR                        \n"
  printf "11. view style\n"
  printf "12. view config\n"
  printf "13. view modules\n"
  
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact4.rasi | cut -d. -f1)
    case $choice in
        1)
            $editor "$UserConfigs/ENVariables.conf"
            ;;
        2)
            $editor "$UserConfigs/WindowRules.conf"
            ;;
        3)
            $editor "$UserConfigs/Startup_Apps.conf"
            ;;
        4)
            $editor "$UserConfigs/UserKeybinds.conf"
            ;;
        5)
            $editor "$UserConfigs/Monitors.conf"
            ;;
        6)
            $editor "$UserConfigs/Laptops.conf"
            ;;
        7)
            $editor "$UserConfigs/UserSettings.conf"
            ;;
        8)
            $editor "$UserConfigs/WorkspaceRules.conf"
            ;;
	9)
            $editor "$configs/Settings.conf"
            ;;
        10)
            $editor "$configs/Keybinds.conf"
            ;;
        11)
            $editor "$waybarstyle/b3-jet-mniejszy.css"
            ;;
        12) 
            $editor "$waybarconfig/b3-jet-mniejszy"
            ;;
        13) 
            $editor "$waybarmodules/modules"
            ;;
        *)
            ;;
    esac
}

main
