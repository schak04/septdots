# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# git aliases
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log --oneline --graph --all'
alias lp='git add . && git commit -m "chore: update learning repo" && git push' # only for my learning repos where I make tiny checkpoint commits. my real projects always get meaningful, atomic commits.
alias cv='git add . && git commit -m "chore: update my CV" && git push'
alias ncv='git add . && git commit -m "chore: update other stuff; not my CV(s)" && git push' # non-cv stuff in my cv backup repo

# other aliases
eval "$(thefuck --alias)"

alias enter-the-wasteland='sudo systemctl reboot --boot-loader-entry=auto-windows'

# using bt mic using hfp/hsp and switching back to a2dp
alias btmic='pactl set-card-profile $(pactl list cards short | grep bluez | cut -f2) headset-head-unit-cvsd && pactl set-source-mute $(pactl list sources short | grep bluez_input | cut -f2) 0 && pactl set-source-volume $(pactl list sources short | grep bluez_input | cut -f2) 80%'
alias bta2dp='pactl set-card-profile $(pactl list cards short | grep bluez | cut -f2) a2dp-sink'

# editor
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

# space at the start to keep command outta history
HISTCONTROL=ignorespace

