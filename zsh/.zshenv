#!/usr/bin/env zsh
# No, you (if anybody other than me even reads all this) don't need to know what's in here. It just works.

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

if [[ -f "$ZDOTDIR/.zshenv" && "$ZDOTDIR/.zshenv" != "$HOME/.zshenv" ]]; then
    source "$ZDOTDIR/.zshenv"
fi
