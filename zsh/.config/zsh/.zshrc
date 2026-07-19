# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path to oh-my-zsh
ZSH=/usr/share/oh-my-zsh/

# p10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# plugins
plugins=()
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# detect yay or paru
if pacman -Qi yay &>/dev/null; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null; then
            arch+=("${pkg}")
        else
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
# alias c='clear' # clear terminal -> commented out because I use 'c' for my C learning dir

# Set colors for ls/eza
[ -f ~/.dircolors ] && eval $(dircolors -b ~/.dircolors)

alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list directory as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list available package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor

# cd shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# auto -p for mkdir
alias mkdir='mkdir -p'

# custom stuff

# git stuff
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log --oneline --graph --all'
alias lp='git add . && git commit -m "chore: update learning repo" && git push' # only for my learning repos where I make tiny checkpoint commits. my real projects always get meaningful, atomic commits.
alias cv='git add . && git commit -m "chore: update my CV" && git push'
alias ncv='git add . && git commit -m "chore: update other stuff; not my CV(s)" && git push' # non-cv stuff in my cv backup repo

# random stuff
# for when I mess up a command and need a second chance (or third)
eval $(thefuck --alias)

alias enter-the-wasteland='sudo systemctl reboot --boot-loader-entry=auto-windows'

# using mic while using bluetooth headsets using hfp/hsp and then switching back to a2dp again
alias btmic='pactl set-card-profile $(pactl list cards short | grep bluez | cut -f2) headset-head-unit-cvsd && pactl set-source-mute $(pactl list sources short | grep bluez_input | cut -f2) 0 && pactl set-source-volume $(pactl list sources short | grep bluez_input | cut -f2) 80%'
alias bta2dp='pactl set-card-profile $(pactl list cards short | grep bluez | cut -f2) a2dp-sink'

# nvim life
export EDITOR=nvim
export VISUAL=nvim

# projects I'm currently workin on
alias septcrawler='cd $HOME/Documents/Projects/backend-systems/septcrawler'
alias priorify='cd $HOME/Documents/Projects/native-apps/priorify'
alias s-ls='cd $HOME/Documents/Projects/systems-programming/s-ls'
alias s-memalloc='cd $HOME/Documents/Projects/systems-programming/s-memalloc'
alias s-vector='cd $HOME/Documents/Projects/libs/s-vector'

# some important learning dirs
alias c='cd $HOME/Documents/Learnings/C'
alias cpp='cd $HOME/Documents/Learnings/C++'
alias go='cd $HOME/Documents/Learnings/Go'
alias rust='cd $HOME/Documents/Learnings/Rust'
alias dsa='cd $HOME/Documents/Learnings/DSA'

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh

# space at the start to keep command outta history
setopt hist_ignore_space
