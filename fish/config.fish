source /usr/share/cachyos-fish-config/cachyos-config.fish

# Dodatkowe pathy

fish_add_path  $HOME/.oh-my-zsh
fish_add_path  $HOME/.local/bin
fish_add_path  $HOME/bin
fish_add_path  $HOME/.cargo/bin
fish_add_path  $HOME/.spicetify
fish_add_path  $HOME/go/bin

# Aliasy

alias db="distrobox"
alias amfora="~/amfora/./amfora_1.9.2_linux_64-bit"
alias zyp="sudo zypper"
alias syp="sypper"
alias pacin="sudo pacman -S"
alias pacre="sudo pacman -R"
alias pacup="sudo pacman -Syu"
alias pacse="sudo pacman -Ss"
alias apt="sudo apt"
alias cat="bat --theme 1337"
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias .7="cd ../../../../../../.."
alias .8="cd ../../../../../../../.."
alias ls="eza --icons"
alias dir="eza -l --icons"
alias cd="z"
alias pogoda=" curl -s 'wttr.in/Swiebodzice?m2&lang=pl' "
alias cp="rsync -aP"
alias shell="echo "$SHELL""
alias iso="~/moje/Bash/./woeusb-5.2.4.bash --device"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ram="sudo dmidecode --type 17"
alias clearram="sudo ~/moje/Bash/./clear_ram.sh"
alias gdriveup="~/moje/Bash/./gdriveupload.sh"
alias gdrivedo="~/moje/Bash/./gdrivedownload.sh"
alias gdrivesee="rclone ls google-drive:/Pliki-Linux"
alias czas='python3 ~/moje/Python/male_skrypty/clock1.py'
alias ncdu="ncdu --color dark"
alias cmatrix="rs-matrix --katakana --asynchronous --delay 65 --glitch-freq 1.0 --colour red"

#ten jest do otwierania obrazków
alias icat="kitten icat"

#ten ci wyśle text na telefon z powiadomieniem
alias notify="curl -d "ukończono-zadanie" 192.168.1.13/raspberry-notyfikacje"

#ten ci wyszuka pliki z fzf i i ten co wybierzesz otworzy w lvim 
alias fzftext="~/moje/Bash/./fzftext.sh"

#alias p10k-colors="~/moje/Bash/./p10k-colors.sh"
#alias hide.me="~/moje/Bash/hideme.sh"

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# Fastfetch

fastfetch --logo-color-1 bold_yellow --logo-color-2 bold_red --logo-color-3 bold_magenta --logo-color-4 bold_blue

# Starship

starship init fish | source
set STARSHIP_CONFIG ~/.config/starship.toml

# Zoxide

zoxide init fish | source

# manpager neovim (zeby strony man otwieralo ci w neovim z syntax highlight)

set -Ux MANPAGER 'nvim +Man!'

