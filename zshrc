# Dodatkowe pathy

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm/node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:/home/asteroth/.spicetify

# Themesy

#ZSH_THEME="agnoster"

# Pluginy i Oh My Zsh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


# Aliasy

alias db="distrobox"
alias amfora="/home/asteroth/amfora/./amfora_1.9.2_linux_64-bit"
alias zyp="sudo zypper"
alias syp="sypper"
alias pacin="sudo pacman -S"
alias pacre="sudo pacman -R"
alias pacup="sudo pacman -Syu"
alias pacse="sudo pacman -Ss"
alias apt="sudo apt"
alias cargoup="cargo install-update -a"
alias npmup="npm update"
alias plugup="hyprpm update"
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
alias shell="echo "$SHELL""
alias pogoda=" curl -s 'wttr.in/Swiebodzice?m2&lang=pl' "
alias cp="rsync -aP"
alias iso="/home/asteroth/moje/Bash/./woeusb-5.2.4.bash --device"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ram="sudo dmidecode --type 17"
alias clearram="sudo /home/asteroth/moje/Bash/./clear_ram.sh"
alias gdriveup="/home/asteroth/moje/Bash/./gdriveupload.sh"
alias gdrivedo="/home/asteroth/moje/Bash/./gdrivedownload.sh"
alias gdrivesee="rclone ls google-drive:/Pliki-Linux"
alias czas='python3 /home/asteroth/moje/Python/gotowe/zegarek10.py'
alias searchtxt='python3 /home/asteroth/moje/Python/gotowe/wyszukiwarka-textu.py'
alias searchtxtr='python3 /home/asteroth/moje/Python/gotowe/wyszukiwarka-textu-rangger.py'
alias ascii='python3 /home/asteroth/moje/Python/gotowe/ascii-art.py'
alias ncdu="ncdu --color dark"
#ten jest do otwierania obrazków
alias icat="kitten icat"
#ten ci wyśle text na telefon z powiadomieniem
alias notify="curl -d "ukończono-zadanie" 192.168.1.13/raspberry-notyfikacje"
#ten ci wyszuka pliki z fzf i i ten co wybierzesz otworzy w lvim
alias fzftext="/home/asteroth/moje/Bash/./fzftext.sh"

#alias p10k-colors="/home/asteroth/moje/Bash/./p10k-colors.sh"
#alias hide.me="/home/asteroth/moje/Bash/hideme.sh"
#alias cmatrix="rs-matrix --katakana --asynchronous --delay 65 --glitch-freq 1.0 --colour red"


#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


# PROMPTY, KONFIGI

# fastfetch

fastfetch --logo-color-1 bold_yellow --logo-color-2 bold_red --logo-color-3 bold_magenta --logo-color-4 bold_blue

#fastfetch --logo-color-1 yellow --logo-color-2 red --logo-color-3 magenta --logo-color-4 blue | tte sweep --first-sweep-direction row_top_to_bottom --second-sweep-direction row_bottom_to_top

# fuzzy finder

source <(fzf --zsh)

# zoxide

eval "$(zoxide init zsh)"

# starship prompt (rozpocznij i skieruj do mojego konfigu)

eval "$(starship init zsh)"

export STARSHIP_CONFIG=~/.config/starship.toml

# manpager neovim (zeby strony man otwieralo ci w neovim z syntax highlight)

export MANPAGER='nvim +Man!'
